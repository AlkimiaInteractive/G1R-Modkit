/*UCLASS()
class AFoliageBaker : AGeneratedDynamicMeshActor
{
    UPROPERTY(DefaultComponent)
    UBoxComponent Bounds;

    UPROPERTY(Category = "Settings", BlueprintReadWrite)
    bool ShouldProcessMesh;
    UPROPERTY(Category = "Settings", BlueprintReadWrite)
    bool ShouldCalculateDistances;
    UPROPERTY(Category = "Settings", BlueprintReadWrite)
    UStaticMesh FoliageMesh;
    UPROPERTY(Category = "Settings")
    float GroundBlendDistance;
    UPROPERTY(Category = "Settings")
    float SafeGroundDistance;

    UPROPERTY(Category = "Debug")
    EDebugVertexVisualization Visualization;

    UPROPERTY(Category = "Internal", BlueprintReadWrite, NotVisible)
    TArray<FFoliageVertices> PiecesFoliageData;
    UPROPERTY(Category = "Internal", NotVisible)
    TMap<int, FVerticesList> ConnectedVertices;
    UPROPERTY(Category = "Internal", NotVisible)
    TMap<int, float> VerticesDistances;
    UPROPERTY(Category = "Internal", NotVisible)
    TMap<int, FPlantBuildData> PlantsBuildData;

    UDynamicMesh DynamicMesh;

    UFUNCTION(BlueprintOverride)
    void OnRebuildGeneratedMesh(UDynamicMesh TargetMesh) 
    {
        DynamicMesh = TargetMesh;
        BuildMesh();
    }

    UFUNCTION(BlueprintCallable)
    void BuildMesh()
    {
        if (DynamicMesh == nullptr)
            return;

        EGeometryScriptOutcomePins Outcome = EGeometryScriptOutcomePins::Failure;
        GeometryScript_AssetUtils::CopyMeshFromStaticMesh(
            FoliageMesh, 
            DynamicMesh, 
            FGeometryScriptCopyMeshFromAssetOptions(),
            FGeometryScriptMeshReadLOD(),
            Outcome);

        if (Outcome != EGeometryScriptOutcomePins::Success)
            return;
        
        auto MeshSelection = ProcessSelection(DynamicMesh, GetSelectionBox());
        if(CheckAndConsume(ShouldProcessMesh))
            ProcessMesh(DynamicMesh, ConnectedVertices, PiecesFoliageData);
        if(CheckAndConsume(ShouldCalculateDistances))
            ProcessDistances(
                DynamicMesh, 
                MeshSelection,
                PiecesFoliageData,
                ConnectedVertices, 
                VerticesDistances, 
                PlantsBuildData);
        ProcessColors(Visualization, DynamicMesh, MeshSelection, PiecesFoliageData, VerticesDistances);
    }

    FBox GetSelectionBox()
    {
        auto Box = Bounds.Bounds.Box;
        auto ActorCenter = GetActorLocation();
        return FBox(Box.Min-ActorCenter, Box.Max-ActorCenter);
    }

    FGeometryScriptMeshSelection ProcessSelection(UDynamicMesh Target, const FBox &Box)
    {
        FGeometryScriptMeshSelection Selection;
        GeometryScript_MeshSelection::SelectMeshElementsInBox(Target, Selection, Box, EGeometryScriptMeshSelectionType::Vertices);
        return Selection;
    }

    void ProcessMesh(
        UDynamicMesh Target, 
        TMap<int, FVerticesList> &VerticesMap, 
        TArray<FFoliageVertices> &FoliagePiecesArray)
    {
        VerticesMap = MapAllTrianglesConnections(Target);
        FoliagePiecesArray = SplitAllMeshesPiecesIntoFoliageInstances(VerticesMap);
    }

    TMap<int, FVerticesList> MapAllTrianglesConnections(UDynamicMesh Target)
    {
        TMap<int, FVerticesList> VerticesMap;

        FGeometryScriptIndexList GeometryTrianglesIds;
        bool HasTriangleIdGaps = false;
        GeometryScript_MeshQueries::GetAllTriangleIDs(Target, GeometryTrianglesIds, HasTriangleIdGaps);
        if (HasTriangleIdGaps)
            Print("It has triangle gaps");
        TArray<int> TrianglesIds;
        GeometryScript_List::ConvertIndexListToArray(GeometryTrianglesIds, TrianglesIds);

        for (auto TriangleId : TrianglesIds)
        {
            bool IsValidTriangle = false;
            auto Indices = GeometryScript_MeshQueries::GetTriangleIndices(Target, TriangleId, IsValidTriangle);
            if(!IsValidTriangle)
                Print(f"Triangle {TriangleId} is invalid");
            RegisterConnectedVertices(Indices[0], Indices[1], Indices[2], VerticesMap);
            RegisterConnectedVertices(Indices[1], Indices[0], Indices[2], VerticesMap);
            RegisterConnectedVertices(Indices[2], Indices[1], Indices[0], VerticesMap);
        }

        return VerticesMap;
    }

    void RegisterConnectedVertices(
        int MainVertex, 
        int FirstConnected, 
        int SecondConnected, 
        TMap<int, FVerticesList> &VerticesMap)
    {
        FVerticesList Vertices;
        VerticesMap.Find(MainVertex, Vertices);
        Vertices.VerticesIds.AddUnique(FirstConnected);
        Vertices.VerticesIds.AddUnique(SecondConnected);
        VerticesMap.Add(MainVertex, Vertices);
    }

    TArray<FFoliageVertices> SplitAllMeshesPiecesIntoFoliageInstances(const TMap<int, FVerticesList> &VerticesMap)
    {
        TArray<FFoliageVertices> FoliageVertices;
        TArray<int> AnalyzedNodes;

        for (auto Item : VerticesMap)
        {
            auto Vertex = Item.Key;
            if (AnalyzedNodes.Contains(Vertex))
                continue;

            TArray<int> OpenNodes;
            OpenNodes.Add(Vertex);
            TArray<int> ClosedNodes;

            while(!OpenNodes.IsEmpty())
            {
                auto CurrentVertex = OpenNodes[0];
                ClosedNodes.Add(CurrentVertex);
                OpenNodes.Remove(CurrentVertex);
                FVerticesList VerticesConnected;
                VerticesMap.Find(CurrentVertex, VerticesConnected);
                for (auto ConnectedVertex : VerticesConnected.VerticesIds)
                {
                    if (!ClosedNodes.Contains(ConnectedVertex))
                        OpenNodes.Add(ConnectedVertex);
                }
            }

            FVerticesList VerticesList(ClosedNodes);
            auto FoliageData = FFoliageData();
            FoliageData.Id = FoliageVertices.Num();
            FoliageData.DependantId = -1;
            FoliageVertices.Add(FFoliageVertices(VerticesList, FoliageData));
            AnalyzedNodes.Append(ClosedNodes);
        }

        return FoliageVertices;
    }

    TMap<int, float> ProcessDistances(
        UDynamicMesh Target, 
        FGeometryScriptMeshSelection &Selection, 
        TArray<FFoliageVertices> &FoliagePieces,
        const TMap<int, FVerticesList> &VerticesMap,
        TMap<int, float> &VertexDistance,
        TMap<int, FPlantBuildData> &BuildedPlants)
    {
        VertexDistance.Empty();
        auto InitialSelection = GetInitialSelection(Target, Selection, FoliagePieces);

        TMap<int, FPlantData> IndexedPlants;
        for (const auto& FoliagePiece : FoliagePieces)
        {
            FPlantData PlantData;
            IndexedPlants.Find(FoliagePiece.FoliageData.PlantId, PlantData);
            PlantData.FoliagePieces.Add(FoliagePiece);
            IndexedPlants.Add(FoliagePiece.FoliageData.PlantId, PlantData);
        }

        TMap<int, FVector> VertexPositions = GetVertexPositionsByID(Target);

        for (const auto PlantItem : IndexedPlants)
        {
            FPlantBuildData PlantBuildData = ProcessPlant(
                PlantItem.Value, 
                InitialSelection, 
                VertexPositions, 
                VerticesMap, 
                VertexDistance,
                FoliagePieces);
            BuildedPlants.Add(PlantItem.Key, PlantBuildData);
        }

        return VertexDistance;
    }

    TArray<int> GetInitialSelection(
        UDynamicMesh Target, 
        FGeometryScriptMeshSelection &Selection, 
        const TArray<FFoliageVertices> &FoliagePieces)
    {
        TArray<int> SelectedIds;

        TArray<int> PhaseZeroIds;
        for (const auto& Piece : FoliagePieces)
        {
            if (Piece.FoliageData.Section != 0)
                continue; 

            PhaseZeroIds.Append(Piece.Group.VerticesIds);
        }

        TArray<int> SelectionIds;
        EGeometryScriptMeshSelectionType SelectionType;
        GeometryScript_MeshSelection::ConvertMeshSelectionToIndexArray(Target, Selection, SelectionIds, SelectionType);

        for (auto Id : SelectionIds)
        {
            if (!PhaseZeroIds.Contains(Id))
                continue;

            SelectedIds.Add(Id);
        }

        return SelectedIds;
    }

    TMap<int, FVector> GetVertexPositionsByID(UDynamicMesh Target)
    {
        TMap<int, FVector> PositionsById;
        bool HasVertexIdGaps = false;
        
        FGeometryScriptVectorList MeshPositions;
        TArray<FVector> Positions;
        GeometryScript_MeshQueries::GetAllVertexPositions(Target, MeshPositions, false, HasVertexIdGaps);
        GeometryScript_List::ConvertVectorListToArray(MeshPositions, Positions);
        
        FGeometryScriptIndexList MeshIds;
        TArray<int> Ids;
        GeometryScript_MeshQueries::GetAllVertexIDs(Target, MeshIds, HasVertexIdGaps);
        GeometryScript_List::ConvertIndexListToArray(MeshIds, Ids);

        for (int i = 0; i < Positions.Num(); i++)
            PositionsById.Add(Ids[i], Positions[i]);
        return PositionsById;
    }

    FPlantBuildData ProcessPlant(
        const FPlantData &Plant, 
        const TArray<int> &InitialSelection, 
        const TMap<int, FVector> &IndexedPositions,
        const TMap<int, FVerticesList> &VerticesMap,
        TMap<int, float> &VertexDistance,
        TArray<FFoliageVertices> &FoliagePieces)
    {
        auto BaseFoliagePieces = GetFoliageSectionsFromPlant(Plant, 0);
        TArray<FPlantBuildStep> BaseBuildSteps;
        for (auto FoliagePiece : BaseFoliagePieces)
        {
            auto BaseSelectedVertices = GetSelectedVerticeForGroupBuilded(FoliagePiece.Group, InitialSelection);

            auto BuildStep = FPlantBuildStep(
                -1, 
                0, 
                false, 
                FoliagePiece, 
                BaseSelectedVertices);
            BaseBuildSteps.Add(BuildStep);
        }

        TArray<FPlantBuildStep> BuildSteps = CreateIndexedBuildDependeciesForPlant(BaseBuildSteps, Plant);

        for (auto& BuildStep : BuildSteps)
        {
            if (BuildStep.PreviousBuildIndex != -1)
            {
                auto PreviousBuild = BuildSteps[BuildStep.PreviousBuildIndex];
                if (!PreviousBuild.IsBuilt)
                {
                    PrintError("Trying to build a step that has it's dependency not built");
                    break;
                }

                float Distance = 0;
                int OtherClosestVertex = 0;
                auto ClosestVertex = GetClosestVertexToTwoLists(
                    BuildStep.FoliageToBuild.Group, 
                    PreviousBuild.FoliageToBuild.Group,
                    IndexedPositions, 
                    Distance,
                    OtherClosestVertex);

                float ClosestVertexDistance = 0;
                VertexDistance.Find(OtherClosestVertex, ClosestVertexDistance);
                Distance += ClosestVertexDistance;
                BuildStep.BuildedVertices.Add(ClosestVertex, Distance);
                UpdateFoliagePieceDistanceById(BuildStep.FoliageToBuild.FoliageData.Id, FoliagePieces, Distance);
            }

            BuildPlantStep(BuildStep, VerticesMap, IndexedPositions);
            float EndDistance = 0;
            for (auto BuildedVertex : BuildStep.BuildedVertices)
            {
                VertexDistance.Add(BuildedVertex.Key, BuildedVertex.Value);
                EndDistance = Math::Max(EndDistance, BuildedVertex.Value);
            }

            UpdateFoliagePieceEndDistanceById(BuildStep.FoliageToBuild.FoliageData.Id, FoliagePieces, EndDistance);
        }

        return FPlantBuildData(BuildSteps);
    }

    TArray<FFoliageVertices> GetFoliageSectionsFromPlant(const FPlantData& Plant, int Section)
    {
        TArray<FFoliageVertices> Pieces;
        for (auto& Piece : Plant.FoliagePieces)
        {
            if (Piece.FoliageData.Section == Section)
                Pieces.Add(Piece);
        }
        return Pieces;
    }

    TMap<int, float> GetSelectedVerticeForGroupBuilded(const FVerticesList &Group, const TArray<int> FilterList)
    {
        TMap<int, float> Selection;
        for (auto Vertex : Group.VerticesIds)
        {
            if(FilterList.Contains(Vertex))
                Selection.Add(Vertex, 0);
        }
        return Selection;
    }

    TArray<FPlantBuildStep> CreateIndexedBuildDependeciesForPlant(
        const TArray<FPlantBuildStep> &BaseSteps, 
        const FPlantData& Plant)
    {
        TArray<FPlantBuildStep> BuildSteps;
        TMap<int, FPlantBuildStep> BuildOrder;
        for (auto BaseStep : BaseSteps)
        {
            BuildSteps.Add(BaseStep);
            BuildOrder.Add(BaseStep.FoliageToBuild.FoliageData.Id, BaseStep);
        }

        while (BuildOrder.Num() < Plant.FoliagePieces.Num())
        {
            TArray<FPlantBuildStep> NewSteps;
            for (auto& Piece : Plant.FoliagePieces)
            {
                if (BuildOrder.Contains(Piece.FoliageData.Id))
                    continue;

                FPlantBuildStep PreviousRequiredBuild;
                if (Piece.FoliageData.DependantId != -1 && !BuildOrder.Find(Piece.FoliageData.DependantId, PreviousRequiredBuild))
                    continue;

                int BuildId = BuildSteps.Num() + NewSteps.Num();
                NewSteps.Add(FPlantBuildStep(
                    PreviousRequiredBuild.CurrentBuildIndex, 
                    BuildId, 
                    false, 
                    Piece,
                    TMap<int, float>()));
            }

            if(NewSteps.IsEmpty())
                break;

            for (auto NewBuildStep : NewSteps)
            {
                BuildSteps.Add(NewBuildStep);
                BuildOrder.Add(NewBuildStep.FoliageToBuild.FoliageData.Id, NewBuildStep);
            }
        }
        return BuildSteps;
    }

    int GetClosestVertexToTwoLists(
        const FVerticesList& RefGroup, 
        const FVerticesList& CompareToGroup, 
        const TMap<int, FVector> &IndexedPositions,
        float &ClosestDistance,
        int &OtherClosestVertex)
    {
        ClosestDistance = 999999999999999.9;
        int VertexId = -1;

        for (auto RefVertex : RefGroup.VerticesIds)
        {
            FVector RefPosition(0,0,0);
            IndexedPositions.Find(RefVertex, RefPosition);
            for (auto CompareVertex : CompareToGroup.VerticesIds)
            {
                FVector ComparePosition(0,0,0);
                IndexedPositions.Find(CompareVertex, ComparePosition);
                auto Distance = RefPosition.Distance(ComparePosition);
                if(Distance < ClosestDistance)
                {
                    VertexId = RefVertex;
                    OtherClosestVertex = CompareVertex;
                    ClosestDistance = Distance;
                }
            }
        }

        return VertexId;
    }

    void UpdateFoliagePieceDistanceById(int Id, TArray<FFoliageVertices> &FoliagePieces, float StartingDistance)
    {
        for (auto& Piece : FoliagePieces)
        {
            if (Piece.FoliageData.Id != Id)
                continue;
            
            Piece.FoliageData.StartingDistance = StartingDistance;
            break;
        }
    }

    void UpdateFoliagePieceEndDistanceById(int Id, TArray<FFoliageVertices> &FoliagePieces, float EndDistance)
    {
        for (auto& Piece : FoliagePieces)
        {
            if (Piece.FoliageData.Id != Id)
                continue;
            
            Piece.FoliageData.EndDistance = EndDistance;
            break;
        }
    }

    void BuildPlantStep(
        FPlantBuildStep &BuildStep, 
        const TMap<int, FVerticesList> &VerticesMap, 
        const TMap<int, FVector> &IndexedPositions)
    {
        TArray<int> Open;
        for (auto Item : BuildStep.BuildedVertices)
            Open.Add(Item.Key);
        TArray<int> Closed;

        while(!Open.IsEmpty())
        {
            auto OpenVertex = Open[0];
            Closed.Add(OpenVertex);
            Open.RemoveAt(0);

            FVector OpenPosition;
            IndexedPositions.Find(OpenVertex, OpenPosition);
            float OpenDistance;
            BuildStep.BuildedVertices.Find(OpenVertex, OpenDistance);

            FVerticesList Vertices;
            VerticesMap.Find(OpenVertex, Vertices);
            for (auto Vertex : Vertices.VerticesIds)
            {
                if (Closed.Contains(Vertex))
                    continue;

                Open.AddUnique(Vertex);
                FVector Position;
                IndexedPositions.Find(Vertex, Position);
                float Distance = OpenPosition.Distance(Position) + OpenDistance;
                float PreviousDistance = 99999999999999.9;
                BuildStep.BuildedVertices.Find(Vertex, PreviousDistance);
                BuildStep.BuildedVertices.Add(Vertex, Math::Min(Distance, PreviousDistance));
            }
        }

        BuildStep.IsBuilt = true;
    }

    void ProcessColors(
        EDebugVertexVisualization VisualizationType,
        UDynamicMesh Target, 
        const FGeometryScriptMeshSelection &Selection,
        TArray<FFoliageVertices> &FoliagePiecesArray,
        const TMap<int, float> &DistancesPerVertex)
    {
        switch(VisualizationType)
        {
            case EDebugVertexVisualization::PreviewSelection:
                PreviewSelection(DynamicMesh, Selection);
                break;
            case EDebugVertexVisualization::PlantId:
                UpdateColorsPerPlantId(Target, FoliagePiecesArray, DistancesPerVertex);
                break;
            case EDebugVertexVisualization::Distance:
                UpdateColorsPerDistance(Target, FoliagePiecesArray, DistancesPerVertex);
                break;
            case EDebugVertexVisualization::Section:
                UpdateColorsPerSection(Target, FoliagePiecesArray);
                break;
            case EDebugVertexVisualization::CustomColors:
                UpdateColorsPerFoliagePiece(Target, FoliagePiecesArray);
                break;
            case EDebugVertexVisualization::LandscapeIntegration:
                UpdateColorsPerGroundIntegration(Target, FoliagePiecesArray, DistancesPerVertex);
                break;
            case EDebugVertexVisualization::Result:
                SetVertexColorsMesh(Target, FoliagePiecesArray, DistancesPerVertex);
                break;
        }
    }

    void PreviewSelection(UDynamicMesh Target, const FGeometryScriptMeshSelection &Selection)
    {
        TArray<int> Indices;
        EGeometryScriptMeshSelectionType MeshSelectionType = EGeometryScriptMeshSelectionType::Vertices;
        GeometryScript_MeshSelection::ConvertMeshSelectionToIndexArray(Target, Selection, Indices, MeshSelectionType);
        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (int i = 0; i < MeshColoring.VerticesId.Num(); i++)
        {
            auto Id = MeshColoring.VerticesId[i];
            MeshColoring.Colors[i] = Indices.Contains(Id) ? FLinearColor(0.00, 1.00, 0.00) : FLinearColor(0.00, 0.00, 0.00); 
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    void UpdateColorsPerPlantId(
        UDynamicMesh Target, 
        TArray<FFoliageVertices> &FoliagePieces, 
        const TMap<int, float> &DistancesPerVertex)
    {
        TMap<int, FLinearColor> ColorsPerPlantId;
        FRandomStream RandomStrem(0);

        for (auto& Item : FoliagePieces)
        {
            auto& FoliageData = Item.FoliageData;
            FLinearColor PhaseColor;
            if (!ColorsPerPlantId.Find(FoliageData.PlantId, PhaseColor))
            {
                PhaseColor = FLinearColor(
                    RandomStrem.RandRange(0.0, 1.0),
                    RandomStrem.RandRange(0.0, 1.0),
                    RandomStrem.RandRange(0.0, 1.0),
                    1.0);

                ColorsPerPlantId.Add(FoliageData.PlantId, PhaseColor);
            }
        }

        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (int i = 0; i < FoliagePieces.Num(); i++)
        {
            auto FoliagePiece = FoliagePieces[i];
            auto Data = FoliagePiece.FoliageData;
            for(auto Vertex : FoliagePiece.Group.VerticesIds)
            {
                float VertexDistance = 0;
                DistancesPerVertex.Find(Vertex, VertexDistance);
                auto VertexColor = ColorsPerPlantId[Data.PlantId];
                MeshColoring.Colors[MeshColoring.VerticesId[Vertex]] = VertexColor;
            }
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    void UpdateColorsPerDistance(
        UDynamicMesh Target, 
        TArray<FFoliageVertices> &FoliagePieces, 
        const TMap<int, float> &DistancesPerVertex)
    {
        float MaxDistance = 0;

        for (auto& Item : DistancesPerVertex)
            MaxDistance = Math::Max(Item.Value-SafeGroundDistance, MaxDistance);

        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (auto& Item : FoliagePieces)
        {
            auto Data = Item.FoliageData;
            for (auto Vertex : Item.Group.VerticesIds)
            {
                float Distance = 0;
                if(!Data.HasUniformDistance)
                    DistancesPerVertex.Find(Vertex, Distance);
                else
                    Distance = Data.StartingDistance;
                Distance = Math::Max(Distance-SafeGroundDistance, 0);
                MeshColoring.Colors[MeshColoring.VerticesId[Vertex]] = FLinearColor(Distance/MaxDistance,0,0,1);
            }
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    void UpdateColorsPerSection(UDynamicMesh Target, TArray<FFoliageVertices> &FoliagePieces)
    {
        auto ColorsPerSection = TMap<int, FLinearColor>();
        FRandomStream RandomStrem(0);

        for (auto& Item : FoliagePieces)
        {
            auto& FoliageData = Item.FoliageData;
            FLinearColor SectionColor;
            if (!ColorsPerSection.Find(FoliageData.Section, SectionColor))
            {
                SectionColor = FLinearColor(
                    RandomStrem.RandRange(0.0, 1.0), 
                    RandomStrem.RandRange(0.0, 1.0), 
                    RandomStrem.RandRange(0.0, 1.0), 
                    1.0);

                ColorsPerSection.Add(FoliageData.Section, SectionColor);
            }
        }

        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (int i = 0; i < FoliagePieces.Num(); i++)
        {
            auto FoliagePiece = FoliagePieces[i];
            for(auto Vertex : FoliagePiece.Group.VerticesIds)
                MeshColoring.Colors[MeshColoring.VerticesId[Vertex]] = ColorsPerSection[FoliagePiece.FoliageData.Section];
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    void UpdateColorsPerFoliagePiece(UDynamicMesh Target, TArray<FFoliageVertices> &FoliagePieces)
    {
        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (int i = 0; i < FoliagePieces.Num(); i++)
        {
            auto FoliagePiece = FoliagePieces[i];
            for(auto Vertex : FoliagePiece.Group.VerticesIds)
                MeshColoring.Colors[MeshColoring.VerticesId[Vertex]] = FoliagePiece.FoliageData.Color;
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    void UpdateColorsPerGroundIntegration(
        UDynamicMesh Target, 
        TArray<FFoliageVertices> &FoliagePieces, 
        const TMap<int, float> &DistancesPerVertex)
    {
        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (auto& Item : FoliagePieces)
        {
            for (auto Vertex : Item.Group.VerticesIds)
            {
                float Distance = 0;
                DistancesPerVertex.Find(Vertex, Distance);
                Distance = Math::Max(Distance-SafeGroundDistance, 0);
                float GroundDistance = 1.0 - Math::Clamp(Distance / GroundBlendDistance, 0.0, 1.0);
                MeshColoring.Colors[MeshColoring.VerticesId[Vertex]] = FLinearColor(GroundDistance,0,0,1);
            }
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    void SetVertexColorsMesh(
        UDynamicMesh Target, 
        TArray<FFoliageVertices> &FoliagePieces, 
        const TMap<int, float> &DistancesPerVertex)
    {
        float MaxDistance = 0;
        for (auto& Item : DistancesPerVertex)
            MaxDistance = Math::Max(Item.Value-SafeGroundDistance, MaxDistance);
        MaxDistance++;

        int MaxPlantId = 0;
        for (auto& Item : FoliagePieces)
            MaxPlantId = Math::Max(MaxPlantId, Item.FoliageData.PlantId);
        MaxPlantId++;

        auto MeshColoring = GetDynamicMeshColorsPerVertex(Target);
        for (auto& Item : FoliagePieces)
        {
            auto Data = Item.FoliageData;
            for (auto Vertex : Item.Group.VerticesIds)
            {
                float Distance = 0;
                if(!Data.HasUniformDistance)
                    DistancesPerVertex.Find(Vertex, Distance);
                else
                    Distance = Data.StartingDistance;
                Distance = Math::Max(Distance-SafeGroundDistance, 0);
                float GroundIntegration = 1.0 - Math::Clamp(Distance / GroundBlendDistance, 0.0, 1.0);
                float FoliagePhase = float(Data.PlantId)/float(MaxPlantId);
                float DistanceGradient = Distance/MaxDistance;
                FLinearColor Color(GroundIntegration, FoliagePhase, DistanceGradient, 1);
                MeshColoring.Colors[MeshColoring.VerticesId[Vertex]] = Color;
            }
        }
        ApplyDynamicMeshColorsPerVertex(Target, MeshColoring);
    }

    FMeshColoring GetDynamicMeshColorsPerVertex(UDynamicMesh Target)
    {
        bool IsValidColorSet = false;
        bool HasVertexIdGaps = false;

        FGeometryScriptColorList ColorsList;
        GeometryScript_VertexColors::GetMeshPerVertexColors(Target, ColorsList, IsValidColorSet, HasVertexIdGaps);
        TArray<FLinearColor> Colors;
        GeometryScript_List::ConvertColorListToArray(ColorsList, Colors);

        FGeometryScriptIndexList VerticesList;
        GeometryScript_MeshQueries::GetAllVertexIDs(Target, VerticesList, HasVertexIdGaps);
        TArray<int> Vertices;
        GeometryScript_List::ConvertIndexListToArray(VerticesList, Vertices);

        return FMeshColoring(Colors, Vertices);
    }

    void ApplyDynamicMeshColorsPerVertex(UDynamicMesh Target, const FMeshColoring &Data)
    {
        FGeometryScriptColorList ColorsList;
        GeometryScript_List::ConvertArrayToColorList(Data.Colors, ColorsList);
        GeometryScript_VertexColors::SetMeshPerVertexColors(Target, ColorsList);
    }

    bool CheckAndConsume(bool &Condition, bool ShouldConsume = true)
    {
        bool Return = Condition;
        if  (ShouldConsume)
            Condition = false;
        return Return;
    }

    FFoliageData GetFoliageDataById(int Id, TArray<FFoliageVertices>& FoliagePieces)
    {
        for (auto FoliageData : FoliagePieces)
        {
            if (FoliageData.FoliageData.Id == Id)
                return FoliageData.FoliageData;
        }
        return FFoliageData();
    }

    UFUNCTION(BlueprintCallable)
    void ShowFoliagePiece(int FoliageId)
    {
        if(DynamicMesh == nullptr || PiecesFoliageData.Num() <= FoliageId || FoliageId < 0)
            return;

        for (auto& Piece : PiecesFoliageData)
            Piece.FoliageData.Color = FLinearColor(0,0,0,1);

        auto& Piece = PiecesFoliageData[FoliageId];
        Piece.FoliageData.Color = FLinearColor(1,0,0,1);

        ChangeVisualization(Visualization); //Update visuals callback
    }

    UFUNCTION(BlueprintCallable)
    void ChangeVisualization(EDebugVertexVisualization VisualizationType)
    {
        if (DynamicMesh == nullptr)
            return;

        Visualization = VisualizationType;
        auto MeshSelection = ProcessSelection(DynamicMesh, GetSelectionBox());
        ProcessColors(Visualization, DynamicMesh, MeshSelection, PiecesFoliageData, VerticesDistances);
    }

    UFUNCTION(BlueprintCallable)
    void ApplyFoliagePieceData(int FoliageId, FFoliageData FoliageData)
    {
        PiecesFoliageData[FoliageId].FoliageData = FoliageData;
    }

    UFUNCTION(BlueprintCallable)
    void BuildPlantsOnDependencies()
    {
        int RegisteredPlantIds = 0;
        for (auto& FoliageData : PiecesFoliageData)
        {
            if (FoliageData.FoliageData.DependantId != -1)
                continue;
            FoliageData.FoliageData.PlantId = RegisteredPlantIds++;
        }

        for (auto& FoliageData : PiecesFoliageData)
        {
            int Steps = 0;
            auto DependantFoliageData = FoliageData.FoliageData;
            while(DependantFoliageData.DependantId != -1)
            {
                DependantFoliageData = GetFoliageDataById(DependantFoliageData.DependantId, PiecesFoliageData);
                Steps++;
            }
            FoliageData.FoliageData.Section = Steps;
            FoliageData.FoliageData.PlantId = DependantFoliageData.PlantId;
        }
    }

    UFUNCTION(BlueprintCallable)
    UStaticMesh BakeMesh()
    {
        if (DynamicMesh == nullptr)
            return nullptr;

        auto MeshSelection = ProcessSelection(DynamicMesh, GetSelectionBox());
        ProcessColors(EDebugVertexVisualization::Result, DynamicMesh, MeshSelection, PiecesFoliageData, VerticesDistances);
        EGeometryScriptOutcomePins Outcome = EGeometryScriptOutcomePins::Failure;
        FGeometryScriptCreateNewStaticMeshAssetOptions Options;
        Options.bEnableCollision = false;
        Options.bEnableRecomputeNormals = false;
        Options.bEnableRecomputeTangents = false;
        Options.CollisionMode = ECollisionTraceFlag::CTF_UseDefault;
        auto NewMesh = GeometryScript_NewAssetUtils::CreateNewStaticMeshAssetFromMesh(
            DynamicMesh,
            FString(FoliageMesh.GetPackage().Name) + FString("_Updated"),
            Options,
            Outcome,
        );

        switch (Outcome)
        {
            case EGeometryScriptOutcomePins::Success:
                Print("Created actor");
                break;
            case EGeometryScriptOutcomePins::Failure:
                Print("Failed creation");
                break;
            default:
                break;
        }
        ProcessColors(Visualization, DynamicMesh, MeshSelection, PiecesFoliageData, VerticesDistances);
        return NewMesh;
    }

    UFUNCTION(BlueprintCallable)
    void PrintDistance(int VertexId)
    {
        float Distance = 0;
        VerticesDistances.Find(VertexId, Distance);
        Print(f"{Distance}");
    }

    UFUNCTION(BlueprintCallable)
    void PrintData(int VertexId)
    {
        for (auto FoliageData : PiecesFoliageData)
        {
            if(FoliageData.Group.VerticesIds.Contains(VertexId))
            {
                Print(f"Group with foliage id is: {FoliageData.FoliageData.Id}");
                for (auto Vertex : FoliageData.Group.VerticesIds)
                    Print(f"Vertex {Vertex}");
            }
        }
    }
}

USTRUCT()
struct FMeshColoring
{
    TArray<FLinearColor> Colors;
    TArray<int> VerticesId;

    FMeshColoring(TArray<FLinearColor> ColorsVal, TArray<int> VerticesIdVal)
    {
        Colors = ColorsVal;
        VerticesId = VerticesIdVal;
    }
}

USTRUCT()
struct FVerticesList
{
    UPROPERTY()
    TArray<int> VerticesIds;

    FVerticesList(TArray<int> VerticesIdsVal) 
    {
        VerticesIds = VerticesIdsVal;
    }
}

USTRUCT()
struct FFoliageData
{
    UPROPERTY()
    int PlantId;
    UPROPERTY()
    int Section;
    UPROPERTY()
    int Id;
    UPROPERTY()
    int DependantId;
    UPROPERTY()
    bool HasUniformDistance;
    UPROPERTY()
    float StartingDistance;
    UPROPERTY()
    float EndDistance;
    UPROPERTY()
    FLinearColor Color;
}

USTRUCT()
struct FFoliageVertices
{
    UPROPERTY()
    FVerticesList Group;
    UPROPERTY()
    FFoliageData FoliageData;

    FFoliageVertices(FVerticesList GroupVal, FFoliageData DataVal)
    {
        Group = GroupVal;
        FoliageData = DataVal;
    }
}

USTRUCT()
struct FPlantData
{
    UPROPERTY()
    TArray<FFoliageVertices> FoliagePieces;
}

USTRUCT()
struct FPlantBuildStep
{
    UPROPERTY()
    int PreviousBuildIndex;
    UPROPERTY()
    int CurrentBuildIndex;
    UPROPERTY()
    bool IsBuilt;
    UPROPERTY()
    FFoliageVertices FoliageToBuild;
    UPROPERTY()
    TMap<int, float> BuildedVertices;

    FPlantBuildStep(
        int PreviousBuildIndexVal,
        int CurrentBuildIndexVal,
        bool IsBuiltVal,
        FFoliageVertices FoliageToBuildVal,
        TMap<int, float> BuildedVerticesVal)
    {
        PreviousBuildIndex = PreviousBuildIndexVal;
        CurrentBuildIndex = CurrentBuildIndexVal;
        IsBuilt = IsBuiltVal;
        FoliageToBuild = FoliageToBuildVal;
        BuildedVertices = BuildedVerticesVal;
    }
}

USTRUCT()
struct FPlantBuildData
{
    UPROPERTY()
    TArray<FPlantBuildStep> Steps;

    FPlantBuildData(TArray<FPlantBuildStep> StepsVal)
    {
        Steps = StepsVal;
    }
}

USTRUCT()
struct FIndexList
{
    TArray<int> Indexes;
}

USTRUCT()
struct FClosestVertex
{
    UPROPERTY()
    float Distance;
    UPROPERTY()
    int VertexId;

    FClosestVertex(float DistanceVal, int VertexIdVal)
    {
        Distance = DistanceVal;
        VertexId = VertexIdVal;
    }
}

USTRUCT()
struct FFoliageBackUpData
{
    UPROPERTY()
    TArray<FFoliageVertices> Foliage;
}

UENUM()
enum EDebugVertexVisualization
{
    PreviewSelection,
    PlantId,
    Distance,
    Section,
    CustomColors,
    LandscapeIntegration,
    Result,
}*/