

struct FCombatPositioningResult
{
    TArray<FCPScoredPosition> Positions;
}

struct FCPCalculatedPosition
{
    FCPCalculatedPosition(FVector2D InPosition)
    {
        Position = InPosition;
    }
    FVector2D Position;
    bool bIsValid = false;
}

struct FCPScoredPosition
{
    float Score = 0.0f;
    FCPCalculatedPosition CalculatedPosition;

    int opCmp(const FCPScoredPosition& Other) const
    {
        if (Score > Other.Score)
            return -1;

        if (Score < Other.Score)
            return 1;

        return 0;
    }
}

struct FCalculatedPositionPair
{
    FCalculatedPositionPair(FVector2D Position)
    {
        CalculatedPositionA = FCPCalculatedPosition(Position);
        CalculatedPositionB = FCPCalculatedPosition(Position);
    }

    FCalculatedPositionPair(FCPCalculatedPosition InCalculatedPositionA, FCPCalculatedPosition InCalculatedPositionB)
    {
        CalculatedPositionA = InCalculatedPositionA;
        CalculatedPositionB = InCalculatedPositionB;
    }

    FCPCalculatedPosition CalculatedPositionA;
    FCPCalculatedPosition CalculatedPositionB;

    bool IsValid()
    {
        return CalculatedPositionA.bIsValid || CalculatedPositionB.bIsValid;
    }
}

UCLASS()
class UAICombatPositioning
{
    UAICombatPositioning(UAIState_Combat_G1R InCombat)
    {
        Combat = InCombat;
    }

    UPROPERTY()
    UAIState_Combat_G1R Combat;

    UPROPERTY()
    TArray<AGothicCharacter> Characters;

    UPROPERTY()
    float MaximumPositionDistance = 5000.0f;

    UPROPERTY()
    float MinimumPositionDistance = 35.0f;

    UPROPERTY()
    float SafeZonePadding = 80.0f;

    UPROPERTY()
    float ExpandedSafeZoneRadiusMultiplier = 5.0f;

    // UPROPERTY()
    // FVector PreferredLocation = FVector::ZeroVector;

    UPROPERTY()
    float PreferredLocationRadius = 10.0f;

    FVector2D FlattenPositionVector(FVector Position)
    {
        return FVector2D(Position.X, Position.Y);
    }

    FVector UnflattenPositionVector(FVector2D Position, float Z = 0.0f)
    {
        return FVector(Position.X, Position.Y, Z);
    }

    FVector RaisePosition(FVector Position, float DistanceUp = 10.0f)
    {
        return Position + FVector::UpVector * DistanceUp;
    }

    FVector PlaceFlatPositionIntoSpace(FVector2D FlatPosition, AGothicCharacter ReferenceCharacter)
    {
        return FVector(FlatPosition.X, FlatPosition.Y, ReferenceCharacter.NavAgentLocation.Z);
    }

    bool GetProjectedPointToNavigation(FVector& OutPosition, FVector2D FlatPosition, AGothicCharacter ReferenceCharacter)
    {
        return UNavigationSystemV1::ProjectPointExtent(ReferenceCharacter, PlaceFlatPositionIntoSpace(FlatPosition, ReferenceCharacter), OutPosition, FVector(10.0f, 10.0f, 1000.0f));
    }

    TArray<AGothicCharacter> GetCharactersInRangeOfTarget(float InDistanceRadius = -1.0f)
    {
        if (Combat.CharacterOfInterest == nullptr)
            return TArray<AGothicCharacter>();

        float DistanceRadius = InDistanceRadius;

        if (DistanceRadius < 0)
        {
            DistanceRadius = MaximumPositionDistance * 2.0f;
        }

        Characters.Reset();

        auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius2D(AGothicCharacter::StaticClass(), Combat.CharacterOfInterest.NavAgentLocation, DistanceRadius);
        auto Ignore = TArray<AGothicCharacter>();
        Ignore.Add(Combat.CharacterOfInterest);
        Ignore.Add(Combat.CharacterState.Character);

        for (auto Actor : Actors)
        {
            auto Character = Cast<AGothicCharacter>(Actor);
            if (!IsValid(Character))
                continue;

            if (Character.IsDead() || Character.IsDefeated())
                continue;

            if (Ignore.Contains(Character))
                continue;

            if (!Combat.Self.Perception.CanSense(Character))
                continue;

            Characters.Add(Character);
        }

        return Characters;
    }

    TArray<AGothicCharacter> GetCharactersInsideExpandedSafeZone()
    {
        auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), Combat.Self.NavAgentLocation, GetCharacterSafeZoneRadius(Combat.Self) * ExpandedSafeZoneRadiusMultiplier);
        TArray<AGothicCharacter> GothicCharacters;

        for (auto Actor : Actors)
        {
            auto GothicCharacter = Cast<AGothicCharacter>(Actor);
            if (GothicCharacter == nullptr)
                continue;

            if (GothicCharacter == Combat.CharacterState.Character)
                continue;

            GothicCharacters.Add(GothicCharacter);
        }

        return GothicCharacters;
    }

    bool IsInsidePreferredLocation()
    {
        return false;
        // return PreferredLocation.Distance(Combat.Self.NavAgentLocation) - PreferredLocationRadius < Combat.Self.SimpleCollisionRadius;
    }

    float GetCombatRadius(float InPreferredDistance = -1.0f)
    {
        float PreferredDistance = InPreferredDistance;
        if (PreferredDistance < 0.0f)
            PreferredDistance = Combat.Config.PreferredDistance;

        if (Combat.CharacterOfInterest == nullptr)
            return PreferredDistance;

        float Radius = Math::Max(PreferredDistance + Combat.CharacterOfInterest.SimpleCollisionRadius - 40.0f, Combat.CharacterOfInterest.SimpleCollisionRadius + MinimumPositionDistance);

        return Radius;
    }

    float GetCharacterSafeZoneRadius(AGothicCharacter Character) const
    {
        return Character.SimpleCollisionRadius + SafeZonePadding;
    }

    bool IsPositionValid(FVector2D Position)
    {
        return IsPositionValid(FVector(Position.X, Position.Y, 0.0f));
    }

    bool IsPositionValid(FVector Position)
    {
        // if (!IsPositionInPositioningDistanceRangeFromTarget(Position))
        // {
        //     VLog::LogInfo(Combat.Self, "Position invalid due to distance from target");
        //     return false;
        // }

        if (IsPositionOccupied(Position))
        {
            VLog::LogInfo(Combat.Self, "Position invalid due to being occupied");
            return false;
        }

        return true;
    }

    bool IsPositionOccupied(FVector Position)
    {
        auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius2D(AGothicCharacter::StaticClass(), Position, GetCharacterSafeZoneRadius(Combat.Self));
        if (Actors.IsEmpty())
            return false;

        if (Actors.Num() == 1 && Actors.Contains(Combat.Self))
            return false;
        
        for (auto Actor : Actors)
        {
            VLog::LogInfo(Combat.Self, f"Checked position occupied by {Actor.Name}");
        }

        return true;
    }

    bool IsPositionInPositioningDistanceRangeFromTarget(FVector Position)
    {
        if (Combat.CharacterOfInterest == nullptr)
            return false;
        
        FVector PositionToCheck = PlaceFlatPositionIntoSpace(FlattenPositionVector(Position), Combat.CharacterOfInterest);
        FVector CharacterOfInterestProjectedLocation = PlaceFlatPositionIntoSpace(FlattenPositionVector(Combat.CharacterOfInterest.NavAgentLocation), Combat.CharacterOfInterest);

        if (PositionToCheck.Distance(CharacterOfInterestProjectedLocation) > GetCombatRadius() + MinimumPositionDistance)
            return false;

        if (PositionToCheck.Distance(CharacterOfInterestProjectedLocation) < GetCombatRadius() - MinimumPositionDistance)
            return false;

        return true;
    }

    void DrawDebug() {};
    void LogDebugIntoVisualLogger() {};
    bool GetLocationToMoveTo(FVector& OutPosition, float PreferredDistance = -1.0f, bool bPositionInFrontOfTarget = true)
    {
        OutPosition = Combat.Self.NavAgentLocation;
        return false;
    };

    FVector GetNewMovementVector()
    {        
        float CharacterSafeZoneRadius = GetCharacterSafeZoneRadius(Combat.Self);
        auto NeighboringCharacters = Combat.Positioning.GetCharactersInsideExpandedSafeZone();
        float ExpandedSafeZoneRadius = CharacterSafeZoneRadius * ExpandedSafeZoneRadiusMultiplier;

        TArray<FVector> InfluenceVectors;
        FVector TotalInfluenceVector = FVector::ZeroVector;
        bool bForceMove = false;

        // move closer or away from character of interest
        FVector CharacterOfInterestInfluenceVector = GetCharacterOfInterestInfluenceVector();
        if (CharacterOfInterestInfluenceVector != FVector::ZeroVector)
        {
            VLog::Arrow(Combat.Self, "COIInfluenceVector", Combat.Self.NavAgentLocation, Combat.Self.NavAgentLocation + CharacterOfInterestInfluenceVector, FColor::Green);
            InfluenceVectors.Add(CharacterOfInterestInfluenceVector);
        }

        // Stay away from nearby characters
        for (auto Character : NeighboringCharacters)
        {
            float DistanceToCharacter = Combat.Self.NavAgentLocation.Distance(Character.NavAgentLocation);

            if (DistanceToCharacter < 0.5f)
            {
                bForceMove = true;
                continue;
            }

            float VectorLength = CharacterSafeZoneRadius * CharacterSafeZoneRadius / DistanceToCharacter;
            FVector CharacterToSelf = (Combat.Self.NavAgentLocation - Character.NavAgentLocation).GetSafeNormal();

            FVector InfluenceVector = CharacterToSelf * VectorLength;

            VLog::Arrow(Combat.Self, "NeighborInfluenceVector", Combat.Self.NavAgentLocation, Combat.Self.NavAgentLocation + InfluenceVector, FColor::Blue);
            InfluenceVectors.Add(InfluenceVector);
        }

        for (FVector InfluenceVector : InfluenceVectors)
        {
            TotalInfluenceVector += InfluenceVector;
        }

        if (bForceMove && TotalInfluenceVector.Size() < 30.0f)
        {
            float RandomNumber = Math::RandRange(0.0f, 2.0f);
            if (RandomNumber < 1.0f)
            {
                return Combat.Self.ActorRightVector * 200.0f;
            }
            else
            {
                return -Combat.Self.ActorRightVector * 200.0f;
            }
        }

        if (TotalInfluenceVector.Size() < 30.0f)
            return FVector::ZeroVector;

        return TotalInfluenceVector;
    }

    private FVector GetCharacterOfInterestInfluenceVector()
    {
        if (Combat.CharacterOfInterest == nullptr)
            return FVector::ZeroVector;

        float DistanceToCOI = Combat.Self.NavAgentLocation.Distance(Combat.CharacterOfInterest.NavAgentLocation);
        float PreferredDistance = 200.0f;

        PreferredDistance = Combat.Config.PreferredDistance;

        if (DistanceToCOI > PreferredDistance + 45.0f && Combat.Config.PreferredDistanceBehavior != EPreferredDistanceBehavior::FartherThan)
        {
            // Move towards COI until at Preferred Distance
            FVector ResultVector = (Combat.CharacterOfInterest.NavAgentLocation - Combat.Self.NavAgentLocation).GetSafeNormal() * (DistanceToCOI - PreferredDistance);

            return ResultVector;
        }

        if (DistanceToCOI < PreferredDistance - 45.0f && Combat.Config.PreferredDistanceBehavior != EPreferredDistanceBehavior::CloserThan)
        {
            // Move away from COI until at Preferred Distance
            FVector ResultVector = (Combat.Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation).GetSafeNormal() * (PreferredDistance - DistanceToCOI);

            return ResultVector;
        }

        return FVector::ZeroVector;
    }

    bool GetCirclingPathAroundTarget(FVector&out NextPosition, int PositionIndexInPath, float StepArcLength, int PathPositionAmount, int&out DirectionSign)
    {
        // Circular motion position vector formula to generate a circular path around the target
        // Position = R*cos(stepDistance*index)*(targetToSelfRightVector) + R*sin(stepDistance*index)*targetToSelfVector

        if (Combat == nullptr)
            return false;

        FVector SelfLocationOnNavmesh = Combat.Self.NavAgentLocation;
        FVector2D SelfLocationFlat = FlattenPositionVector(SelfLocationOnNavmesh);

        FVector TargetLocationOnNavmesh = Combat.CharacterOfInterest.NavAgentLocation;
        FVector2D TargetLocationFlat = FlattenPositionVector(TargetLocationOnNavmesh);

        FVector SelfLocationToDraw = RaisePosition(SelfLocationOnNavmesh);
        FVector TargetLocationToDraw = RaisePosition(TargetLocationOnNavmesh);

        VLog::Location(Combat.Self, "CurrentSelfLocation", SelfLocationToDraw, 10.0f, FColor::Green);
        VLog::Location(Combat.Self, "CurrentTargetLocation", TargetLocationToDraw, 10.0f, FColor::Red);

        FVector2D TargetToSelfFlat = (TargetLocationFlat - SelfLocationFlat).GetSafeNormal();
        FVector2D TargetToSelfPerpendicularFlat = FlattenPositionVector(UnflattenPositionVector(TargetToSelfFlat).CrossProduct(FVector::UpVector).GetSafeNormal2D());
        FVector2D TargetForwardFlat = FlattenPositionVector(Combat.CharacterOfInterest.ActorForwardVector.GetSafeNormal2D());
        FVector2D SelfForwardFlat = FlattenPositionVector(Combat.Self.ActorForwardVector.GetSafeNormal2D());

        float FrontDistance = 450.0f;
        float FrontRadius = FrontDistance - 120.0f;
        FVector2D FrontCenterLocation = SelfLocationFlat + SelfForwardFlat * FrontDistance;


        VLog::Arrow(Combat.Self, "SelfForward", SelfLocationToDraw, SelfLocationToDraw + UnflattenPositionVector(SelfForwardFlat) * 100.0f, FColor::Green);
        VLog::Arrow(Combat.Self, "TargetForward", TargetLocationToDraw, TargetLocationToDraw + UnflattenPositionVector(TargetForwardFlat) * 100.0f, FColor::Red);

        FVector FrontCenterLocationToDraw = RaisePosition(PlaceFlatPositionIntoSpace(FrontCenterLocation, Combat.CharacterOfInterest));
        VLog::Circle(Combat.Self, "Front", FrontCenterLocationToDraw, FrontRadius, FColor::Yellow, FVector::UpVector);

        VLog::Arrow(Combat.Self, "TtoS", TargetLocationToDraw, TargetLocationToDraw + UnflattenPositionVector(TargetToSelfFlat) * 100.0f, FColor::Blue);
        VLog::Arrow(Combat.Self, "TtoSPerp", TargetLocationToDraw, TargetLocationToDraw + UnflattenPositionVector(TargetToSelfPerpendicularFlat) * 100.0f, FColor::Blue);
        
        if (PositionIndexInPath == 1)
        {
            bool bNegativeAvailable = IsCirclingPathAvailableInDirection(-1, StepArcLength, PathPositionAmount, TargetLocationFlat, TargetToSelfFlat, TargetToSelfPerpendicularFlat);
            bool bPositiveAvailable = IsCirclingPathAvailableInDirection(1, StepArcLength, PathPositionAmount, TargetLocationFlat, TargetToSelfFlat, TargetToSelfPerpendicularFlat);

            if (bNegativeAvailable && !bPositiveAvailable)
            {
                DirectionSign = -1;
            }
            else if (bPositiveAvailable && !bNegativeAvailable)
            {
                DirectionSign = 1;
            }
            else if (!bPositiveAvailable && !bNegativeAvailable)
            {
                return false;
            }
            else if (Combat.CharacterOfInterest.IsCharacterDirectionFacingOtherCharacter(Combat.Self, Combat.CharacterOfInterest.ActorForwardVector))
            {
                // In front of target
                FVector TargetForwardNormalized = UnflattenPositionVector(TargetForwardFlat).GetSafeNormal2D();
                FVector TargetToSelfNormalized = UnflattenPositionVector(TargetToSelfFlat).GetSafeNormal2D();

                FVector CrossProductNormalized = TargetForwardNormalized.CrossProduct(TargetToSelfNormalized).GetSafeNormal2D();

                DirectionSign = CrossProductNormalized.Z > 0.0f ? -1 : 1;
            } 
            else if (Combat.CharacterOfInterest.IsCharacterDirectionFacingOtherCharacter(Combat.Self, -Combat.CharacterOfInterest.ActorForwardVector))
            {
                // Behind target
                FVector TargetBackwardNormalized = UnflattenPositionVector(-TargetForwardFlat).GetSafeNormal2D();
                FVector TargetToSelfNormalized = UnflattenPositionVector(TargetToSelfFlat).GetSafeNormal2D();

                FVector CrossProductNormalized = TargetBackwardNormalized.CrossProduct(TargetToSelfNormalized).GetSafeNormal2D();

                DirectionSign = CrossProductNormalized.Z > 0.0f ? -1 : 1;
            }            
        }

        float Radius = Combat.Config.PreferredDistance;
        float StepAngularDistance = StepArcLength / Radius;

        if (PositionIndexInPath >= PathPositionAmount)
            return false;

        FVector2D PerpendicularComponentFlat = TargetToSelfPerpendicularFlat * Radius * Math::Sin(StepAngularDistance * DirectionSign);
        FVector2D ParalelComponentFlat = TargetToSelfFlat * Radius * Math::Cos(StepAngularDistance * DirectionSign);
        FVector2D TargetToPositionFlat = PerpendicularComponentFlat - ParalelComponentFlat;

        VLog::Arrow(Combat.Self, "PerpComp", TargetLocationToDraw, TargetLocationToDraw + UnflattenPositionVector(PerpendicularComponentFlat), FColor::Yellow);
        VLog::Arrow(Combat.Self, "ParaComp", TargetLocationToDraw, TargetLocationToDraw + UnflattenPositionVector(ParalelComponentFlat), FColor::Yellow);

        FVector NavmeshPosition;
        if (!GetProjectedPointToNavigation(NavmeshPosition, TargetLocationFlat + TargetToPositionFlat, Combat.CharacterOfInterest))
        {
            VLog::Location(Combat.Self, f"Path[{Math::Abs(PositionIndexInPath)}] proj fail", RaisePosition(NavmeshPosition), 10.0f, FColor::Red);
            VLog::Arrow(Combat.Self, "", RaisePosition(Combat.Self.NavAgentLocation), RaisePosition(NavmeshPosition), FColor::Purple);
            return false;
        }

        FVector PreviousPosition = SelfLocationOnNavmesh;
        FVector PreviousPositionToDraw = RaisePosition(PreviousPosition);

        if (!UNavigationSystemV1::DoesPathExistWithinCostLimit(Combat.Self, PreviousPosition, NavmeshPosition, StepArcLength * 1.5f))
            return false;

        if (PreviousPosition.Distance(NavmeshPosition) <= 30.0f)
            return false;

        if (PreviousPosition.Distance(SelfLocationOnNavmesh) > NavmeshPosition.Distance(SelfLocationOnNavmesh))
            return false;

        FVector NavmeshPositionToDraw = RaisePosition(NavmeshPosition);

        float Distance = Combat.Self.GetNavAgentLocation().Distance(NavmeshPosition);
        VLog::Location(Combat.Self, f"Path[{Math::Abs(PositionIndexInPath)}]", NavmeshPositionToDraw, 10.0f, FColor::Purple);

        VLog::Arrow(Combat.Self, "", PreviousPositionToDraw, NavmeshPositionToDraw, FColor::Purple);


        // Correct output position to be inside the front circle

        FVector2D NavmeshPositionFlat = FlattenPositionVector(NavmeshPosition);
        FVector2D FrontToPosition = NavmeshPositionFlat - FrontCenterLocation;

        if (FrontToPosition.Size() > FrontRadius && !Combat.Self.CanStrafe())
        {
            VLog::Arrow(Combat.Self, "", FrontCenterLocationToDraw, NavmeshPositionToDraw, FColor::Yellow);

            FrontToPosition = FrontToPosition.GetSafeNormal();
            NavmeshPositionFlat = FrontCenterLocation + FrontToPosition * FrontRadius;

            if (!GetProjectedPointToNavigation(NavmeshPosition, NavmeshPositionFlat, Combat.CharacterOfInterest))
            {
                VLog::Location(Combat.Self, f"FinalPosition proj fail", NavmeshPositionToDraw, 10.0f, FColor::Red);
                return false;
            }

            NavmeshPositionToDraw = RaisePosition(NavmeshPosition);

            VLog::Location(Combat.Self, f"FinalPosition", NavmeshPositionToDraw, 10.0f, FColor::Purple);
        }

        NextPosition = NavmeshPosition;

        return true;
    }

    private bool IsCirclingPathAvailableInDirection(int DirectionSign, float StepArcLength, int PathPositionAmount, FVector2D TargetLocationFlat, FVector2D TargetToSelfFlat, FVector2D TargetToSelfPerpendicularFlat)
    {
        float Radius = Combat.Config.PreferredDistance;
        float StepAngularDistance = StepArcLength * PathPositionAmount / Radius;

        FVector2D PerpendicularComponentFlat = TargetToSelfPerpendicularFlat * Radius * Math::Sin(StepAngularDistance * DirectionSign);
        FVector2D ParallelComponentFlat = TargetToSelfFlat * Radius * Math::Cos(StepAngularDistance * DirectionSign);
        FVector2D TargetToPositionFlat = PerpendicularComponentFlat + ParallelComponentFlat;

        VLog::Arrow(Combat.Self, f"PathCheck PerpComp", RaisePosition(UnflattenPositionVector(TargetLocationFlat)), RaisePosition(UnflattenPositionVector(TargetLocationFlat + PerpendicularComponentFlat)), FColor::Red);
        VLog::Arrow(Combat.Self, f"PathCheck ParaComp", RaisePosition(UnflattenPositionVector(TargetLocationFlat)), RaisePosition(UnflattenPositionVector(TargetLocationFlat + ParallelComponentFlat)), FColor::Red);
        VLog::Arrow(Combat.Self, f"PathCheck ParaComp", RaisePosition(UnflattenPositionVector(TargetLocationFlat)), RaisePosition(UnflattenPositionVector(TargetLocationFlat + TargetToPositionFlat)), FColor::Red);

        FVector NavmeshPosition;
        
        if (!GetProjectedPointToNavigation(NavmeshPosition, TargetLocationFlat + TargetToPositionFlat, Combat.CharacterOfInterest))
        {
            VLog::Location(Combat.Self, f"PathCheck[{DirectionSign}] proj fail", RaisePosition(NavmeshPosition), 10.0f, FColor::Red);
            VLog::Arrow(Combat.Self, "", RaisePosition(Combat.Self.NavAgentLocation), RaisePosition(NavmeshPosition), FColor::Purple);
            return false;
        }

        FVector PreviousPosition = Combat.Self.NavAgentLocation;
        if (!UNavigationSystemV1::DoesPathExistWithinCostLimit(Combat.Self, PreviousPosition, NavmeshPosition, StepArcLength * 1.5f))
        {
            VLog::Location(Combat.Self, f"PathCheck[{DirectionSign}] cost fail", RaisePosition(NavmeshPosition), 10.0f, FColor::Red);
            VLog::Arrow(Combat.Self, "", RaisePosition(Combat.Self.NavAgentLocation), RaisePosition(NavmeshPosition), FColor::Purple);
            return false;
        }

        VLog::Location(Combat.Self, f"PathCheck[{DirectionSign}]", RaisePosition(NavmeshPosition), 10.0f, FColor::Green);
        VLog::Arrow(Combat.Self, "", RaisePosition(Combat.Self.NavAgentLocation), RaisePosition(NavmeshPosition), FColor::Purple);
        return true;
    }
}

UCLASS()
class UAICombatPositioning_StaticCircleAroundTarget : UAICombatPositioning
{
    UAICombatPositioning_StaticCircleAroundTarget(UAIState_Combat_G1R InCombat)
    {
        Combat = InCombat;
    }

    const int MaxCorrectionIterations = 4;

    UPROPERTY()
    TArray<FCalculatedPositionPair> CalculatedPositions;

    UPROPERTY()
    TArray<FCPScoredPosition> ScoredPositionResults;

    UPROPERTY()
    FVector2D BestPosition;

    UPROPERTY()
    FVector TargetLocation;

    UPROPERTY()
    FVector2D OwningAgentProjectedLocation;

    UPROPERTY()
    bool bMovingToPreferredPosition = false;

    UPROPERTY()
    float FrontQuadrantDistanceTolerance = 150.0f;

    UPROPERTY()
    bool bPreventStrafing = false;

    void DrawDebug() override
    {
        if (Combat.CharacterOfInterest == nullptr)
            return;
        
        FVector DrawTargetLocation = Combat.CharacterOfInterest.NavAgentLocation;
        DrawTargetLocation.Z += 10.0f;

        // Target marker
        DebugScript::DrawCircle(DrawTargetLocation, 100.0f, FColor::Red, alpha=0.0f);

        // Target Forward indicator
        DebugScript::DrawLine(DrawTargetLocation, DrawTargetLocation + Combat.CharacterOfInterest.ActorForwardVector * 200.0f, FColor::Red, 2.0f);

        // High Priority ring
        DebugScript::DrawCircle(DrawTargetLocation, GetCombatRadius(), FColor::Blue, alpha=0.0f);

        // Preferred Location Marker
        // DebugScript::DrawSphere(PreferredLocation, 15.0f, FColor::Purple);


        FVector DrawSelfLocation = Combat.Self.NavAgentLocation;
        DrawSelfLocation.Z += 10.0f;

        // Agent safezones
        DebugScript::DrawCircle(DrawSelfLocation, GetCharacterSafeZoneRadius(Combat.Self), FColor::Yellow, alpha=0.0f);
        Characters = GetCharactersInRangeOfTarget();

        for (auto Character : Characters)
        {
            auto CharacterAI = Character.GetGothicAI();
            if (CharacterAI != nullptr)
            {
                if (!CharacterAI.States.Contains(GameplayTag::AIState_Conflict_Combat))
                    continue;

                auto CharacterCombat = Cast<UAIState_Combat_G1R>(CharacterAI.States[GameplayTag::AIState_Conflict_Combat].Get().DefaultObject);
                if (CharacterCombat != nullptr)
                {
                    FVector DrawAgentLocation = Character.NavAgentLocation;
                    DrawAgentLocation.Z += 10.0f;

                    DebugScript::DrawCircle(DrawAgentLocation, GetCharacterSafeZoneRadius(Character), FColor::Yellow, alpha=0.0f);
                }
            }
        }
    }

    void LogDebugIntoVisualLogger() override
    {
        FVector DrawTargetLocation = Combat.CharacterOfInterest.NavAgentLocation;
        DrawTargetLocation.Z += 10.0f;

        VLog::Location(Combat.Self, "Distance to Target Collision: " + Combat.CharacterOfInterest.GetDistanceToHitCollision(Combat.Self.NavAgentLocation), DrawTargetLocation + FVector::UpVector * 100.0f, 10.0f, FColor::White);
        VLog::Location(Combat.Self, "Distance to Target Location: " + Combat.CharacterOfInterest.NavAgentLocation.Distance(Combat.Self.NavAgentLocation), DrawTargetLocation + FVector::UpVector * 130.0f, 10.0f, FColor::White);

        // Combat Center of mass indicator
        VLog::Location(Combat.Self, "Combat CoM", Combat.CombatGroup.CombatCenterOfMass, 15.0f, FColor::Red);

        FVector TargetToCenterOfMass = Combat.CombatGroup.CombatCenterOfMass - DrawTargetLocation;

        // Target Forward indicator
        VLog::Arrow(Combat.Self, "TargetForward", DrawTargetLocation, DrawTargetLocation + TargetToCenterOfMass.GetSafeNormal2D() * 200.0f, FColor::Red);

        // High Priority ring
        VLog::Circle(Combat.Self, "HighPriorityRing", DrawTargetLocation, GetCombatRadius(), FColor::Blue);

        FVector DrawSelfLocation = Combat.Self.NavAgentLocation;
        DrawSelfLocation.Z += 10.0f;

        // Agent safezones
        VLog::Circle(Combat.Self, "", DrawSelfLocation, GetCharacterSafeZoneRadius(Combat.Self), FColor::Yellow);
        Characters = GetCharactersInRangeOfTarget();

        for (auto Character : Characters)
        {
            if (Character.IsPlayerCharacter())
                continue;
            
            VLog::Location(Combat.Self, "", Character.ActorLocation, GetCharacterSafeZoneRadius(Character), FColor::Yellow);
            VLog::Location(Combat.Self, "", Character.NavAgentLocation, 10.0f, FColor::Yellow);

            FVector CharacterLocationOnTargetPlane = PlaceFlatPositionIntoSpace(FlattenPositionVector(Character.ActorLocation), Combat.CharacterOfInterest);
            
            VLog::Location(Combat.Self, "", CharacterLocationOnTargetPlane, 10.0f, FColor::Yellow);
            VLog::Circle(Combat.Self, "", CharacterLocationOnTargetPlane, 20.0f, FColor::Yellow);

            VLog::Arrow(Combat.Self, "", Character.ActorLocation, CharacterLocationOnTargetPlane, FColor::Yellow);
            VLog::Arrow(Combat.Self, "", Character.ActorLocation, Character.NavAgentLocation, FColor::Yellow);
        }
    }

    bool GetLocationToMoveTo(FVector& OutPosition, float PreferredDistance = -1.0f, bool bPositionInFrontOfTarget = true) override
    {
        float BaseSafeZonePadding = SafeZonePadding;

        Characters = GetCharactersInRangeOfTarget();
        TargetLocation = Combat.CharacterOfInterest.NavAgentLocation;
        VLog::Location(Combat.Self, "Target's Location", TargetLocation, 15.0f, FColor::Red);

        OwningAgentProjectedLocation = FlattenPositionVector(Combat.Self.NavAgentLocation);
        VLog::Location(Combat.Self, "Self's Location", Combat.Self.NavAgentLocation, 15.0f, FColor::Blue);
        VLog::Location(Combat.Self, "Self's Location on Target's z plane", PlaceFlatPositionIntoSpace(OwningAgentProjectedLocation, Combat.CharacterOfInterest), 5.0f, FColor::Blue);

        FindInitialCalculatedPositions(PreferredDistance, bPositionInFrontOfTarget);

        LogDebugIntoVisualLogger();

        PointCorrection(Characters);

        TArray<FCPScoredPosition> ScoredPositions = GetPositionsSortedByScore();
        FCPScoredPosition CurrentOwningAgentScoredPosition = FCPScoredPosition();
        CurrentOwningAgentScoredPosition.CalculatedPosition.Position = OwningAgentProjectedLocation;
        CurrentOwningAgentScoredPosition.CalculatedPosition.bIsValid = IsPositionValid(OwningAgentProjectedLocation);
        CurrentOwningAgentScoredPosition.Score = CalculateScoreForPosition(OwningAgentProjectedLocation);

        for (auto ScoredPosition : ScoredPositions)
        {
            FVector2D Position = ScoredPosition.CalculatedPosition.Position;
            FVector ProjectedPosition;
            if (!GetProjectedPointToNavigation(ProjectedPosition, Position, Combat.Self))
                return false;

            if (UNavigationSystemV1::DoesPathExistWithinCostLimit(Combat.Self, Combat.Self.NavAgentLocation, ProjectedPosition, MaximumPositionDistance * 2.0f))
            {
                OutPosition = ProjectedPosition;

                if (CurrentOwningAgentScoredPosition.CalculatedPosition.bIsValid && ScoredPosition.Score < CurrentOwningAgentScoredPosition.Score * 1.3f)
                {
                    SafeZonePadding = BaseSafeZonePadding;
                    return false;
                }

                VLog::Location(Combat.Self, "", OutPosition, 20.0f, FColor::Purple);
                SafeZonePadding = BaseSafeZonePadding;
                return true;
            }
        }

        SafeZonePadding = BaseSafeZonePadding;
        return false;
    }

    void FindInitialCalculatedPositions(float PreferredDistance, bool bPositionInFrontOfTarget)
    {
        // Find calculated positions
        FVector2D FlatTargetLocation = FlattenPositionVector(Combat.CharacterOfInterest.NavAgentLocation);
        FVector2D TargetToAgent = OwningAgentProjectedLocation - FlatTargetLocation;
        FVector2D TargetToAgentNormalized = TargetToAgent.GetSafeNormal();

        CalculatedPositions.Reset();

        
        float Radius = GetCombatRadius(PreferredDistance);
        
        if (Combat.Config.PreferredDistanceBehavior == EPreferredDistanceBehavior::FartherThan)
        {
            Radius = Math::Max(GetCombatRadius(Combat.DistanceToCharacterOfInterest), Radius);
        }
        else if (Combat.Config.PreferredDistanceBehavior == EPreferredDistanceBehavior::CloserThan)
        {
            Radius = Math::Min(GetCombatRadius(Combat.DistanceToCharacterOfInterest), Radius);
        }

        FVector2D CalculatedPosition;

        // Front
        FVector2D TargetToFrontPosition = TargetToAgentNormalized * Radius;
        CalculatedPosition = FlatTargetLocation + TargetToFrontPosition;
        CalculatedPositions.Add(FCalculatedPositionPair(CalculatedPosition));

        FVector CalculatedPositionToDraw = PlaceFlatPositionIntoSpace(CalculatedPosition, Combat.CharacterOfInterest);
        VLog::Arrow(Combat.Self, "", TargetLocation, CalculatedPositionToDraw, FColor::Blue);
        VLog::Location(Combat.Self, "", CalculatedPositionToDraw, 15.0f, FColor::Cyan);

        // Side 1
        FVector2D TargetToSideNormalized = FlattenPositionVector(PlaceFlatPositionIntoSpace(TargetToAgentNormalized, Combat.CharacterOfInterest).CrossProduct(FVector::UpVector));
        CalculatedPosition = FlatTargetLocation + (TargetToSideNormalized * Radius);
        CalculatedPositions.Add(FCalculatedPositionPair(CalculatedPosition));

        CalculatedPositionToDraw = PlaceFlatPositionIntoSpace(CalculatedPosition, Combat.CharacterOfInterest);
        VLog::Arrow(Combat.Self, "", TargetLocation, CalculatedPositionToDraw, FColor::Blue);
        VLog::Location(Combat.Self, "", CalculatedPositionToDraw, 15.0f, FColor::Cyan);

        // Side 2
        CalculatedPosition = FlatTargetLocation - (TargetToSideNormalized * Radius);
        CalculatedPositions.Add(FCalculatedPositionPair(CalculatedPosition));

        CalculatedPositionToDraw = PlaceFlatPositionIntoSpace(CalculatedPosition, Combat.CharacterOfInterest);
        VLog::Arrow(Combat.Self, "", TargetLocation, CalculatedPositionToDraw, FColor::Blue);
        VLog::Location(Combat.Self, "", CalculatedPositionToDraw, 15.0f, FColor::Cyan);

        // Target Front PositioningTODO: decouple front, make front slowly follow target front
        
        FVector2D TargetToCombatCenterOfMass = FlattenPositionVector(Combat.CombatGroup.CombatCenterOfMass) - FlatTargetLocation;
        FVector2D TargetToCombatCenterOfMassNormalized = TargetToCombatCenterOfMass.GetSafeNormal();

        CalculatedPosition = FlatTargetLocation + (TargetToCombatCenterOfMassNormalized * Radius);

        CalculatedPositionToDraw = PlaceFlatPositionIntoSpace(CalculatedPosition, Combat.CharacterOfInterest);
        VLog::Arrow(Combat.Self, "", TargetLocation, CalculatedPositionToDraw, FColor::Green);
        VLog::Location(Combat.Self, "", CalculatedPositionToDraw, 15.0f, FColor::Blue);
        CalculatedPositions.Add(FCalculatedPositionPair(CalculatedPosition));
        BestPosition = CalculatedPosition;
    }

    void PointCorrection(TArray<AGothicCharacter> NearbyCharacters, int IterationCount = 0)
    {
        int IterationCountInternal = IterationCount;
        int StructIndex = 0;
        bool bAllValid = true;
        for (FCalculatedPositionPair& CalculatedPositionPair : CalculatedPositions)
        {
            if (CalculatedPositionPair.IsValid())
                continue;

            for (int VariantIndex = 0; VariantIndex < 2; VariantIndex++)
            {
                FVector2D& PositionToCorrect = VariantIndex == 0 ? CalculatedPositionPair.CalculatedPositionA.Position : CalculatedPositionPair.CalculatedPositionB.Position;
                FVector2D MoveVector;
                for (auto Character : NearbyCharacters)
                {
                    if (Character == Combat.Self)
                        continue;

                    // PositioningTODO: Check if the character is in the enemy group, distance should then be CombatPriorityRadiusHigh - tolerance of this agent
                    float SafetyRadius = GetCharacterSafeZoneRadius(Combat.Self);

                    // Select the larger safezoneradius out of the current character's or the querying agent's
                    if (GetCharacterSafeZoneRadius(Character) > SafetyRadius)
                    {
                        SafetyRadius = GetCharacterSafeZoneRadius(Character);
                    }

                    FVector ConflictingPosition = Character.ActorLocation;

                    if (IsPositionValid(PositionToCorrect))
                    {
                        SetCorrectedPosition(StructIndex, VariantIndex, true, PositionToCorrect);
                        continue;
                    }

                    CorrectPosition(PositionToCorrect, FlattenPositionVector(ConflictingPosition), MoveVector, SafetyRadius, VariantIndex);

                    // Set position validity to false since we had to correct it
                    SetCorrectedPosition(StructIndex, VariantIndex, false, PositionToCorrect);
                    break;
                }

                // NearbyCharacters = Characters near target, may include Self
                if (NearbyCharacters.Num() == 0)
                {
                    SetCorrectedPosition(StructIndex, VariantIndex, true, PositionToCorrect);
                }

                FCPCalculatedPosition& CurrentCalculatedPosition = VariantIndex == 0 ? CalculatedPositions[StructIndex].CalculatedPositionA : CalculatedPositions[StructIndex].CalculatedPositionB;
                if (CurrentCalculatedPosition.bIsValid)
                {
                    MoveVector = FVector2D::ZeroVector;
                    // DebugScript::DrawSphere(CurrentCalculatedPosition.Position, 15.0f, FColor::Green);
                    VLog::Location(Combat.Self, "P", PlaceFlatPositionIntoSpace(CurrentCalculatedPosition.Position, Combat.CharacterOfInterest), 10.0f, FColor::Green);
                    continue;
                }

                bAllValid = false;
                FVector2D MoveVectorNormalized = MoveVector;
                MoveVectorNormalized.Normalize();
                MoveVector = MoveVector + MoveVectorNormalized * 25.0f;

                FVector ProjectedPositionToCorrect = PlaceFlatPositionIntoSpace(PositionToCorrect, Combat.CharacterOfInterest);
                FVector CorrectedPosition = PlaceFlatPositionIntoSpace(PositionToCorrect + MoveVector, Combat.CharacterOfInterest);
                VLog::Arrow(Combat.Self, "C", RaisePosition(ProjectedPositionToCorrect), CorrectedPosition, FColor::Orange);
                SetCorrectedPosition(StructIndex, VariantIndex, false, PositionToCorrect + MoveVector);
                VLog::Location(Combat.Self, "P", RaisePosition(PlaceFlatPositionIntoSpace(CurrentCalculatedPosition.Position, Combat.CharacterOfInterest)), 10.0f, FColor::Orange);
                MoveVector = FVector2D::ZeroVector;
            }

            StructIndex++;
        }

        if (bAllValid)
            return;

        if (IterationCount >= MaxCorrectionIterations)
            return;

        IterationCountInternal++;

        PointCorrection(NearbyCharacters, IterationCountInternal);
    }

    void CorrectPosition(FVector2D PositionToCorrect, FVector2D ConflictingPosition, FVector2D& OutMoveVector, float SafetyRadius, int VariantIndex)
    {
        // x, y, components parallel and perpendicular to the target-conflictingposition vector
        // a = (d^2 - r^2 + R^2)
        // x = a /(2*d)
        // y = sqrt(4*d^2 * R^2 - a^2) / (2*d) | make sure number inside sqrt isn't negative

        FVector2D FlattenedTargetLocation = FlattenPositionVector(TargetLocation);
        FVector TargetLocationInSelfReferenceSpace = PlaceFlatPositionIntoSpace(FlattenedTargetLocation, Combat.CharacterOfInterest);
        FVector ConflictingPositionInSelfReferenceSpace = PlaceFlatPositionIntoSpace(ConflictingPosition, Combat.CharacterOfInterest);

        float Radius1 = GetCombatRadius();
        float Radius2 = SafetyRadius + 10.0f;
        float Distance = FlattenedTargetLocation.Distance(ConflictingPosition);

        if (Distance <= 0.001f)
        {
            OutMoveVector = FVector2D::ZeroVector;
            return;
        }
        
        float A = Distance * Distance - Radius2 * Radius2 + Radius1 * Radius1;
        float ParallelComponentMagnitude = A / (2.0f * Distance);
        float PerpendicularComponentMagnitude = Math::Sqrt(Math::Max(4.0f * Distance * Distance * Radius1 * Radius1 - A * A, 0.0f)) / (2.0f * Distance);
        FVector XVector = ConflictingPositionInSelfReferenceSpace - TargetLocationInSelfReferenceSpace;
        XVector.Normalize();

        FVector YVector = XVector.CrossProduct(FVector::UpVector);
        YVector.Normalize();

        FVector NewPosition = ConflictingPositionInSelfReferenceSpace + XVector * (ParallelComponentMagnitude - Distance) + YVector * (VariantIndex == 0 ? 1.0f : -1.0f) * PerpendicularComponentMagnitude;
        OutMoveVector = FlattenPositionVector(NewPosition) - PositionToCorrect;
    }

    TArray<FCPScoredPosition> GetPositionsSortedByScore()
    {
        TArray<FCPScoredPosition> ScoredPositionsReturnValue;
        for (auto CalculatedPositionPair : CalculatedPositions)
        {
            if (CalculatedPositionPair.CalculatedPositionA.bIsValid)
            {
                FCPScoredPosition ScoredPosition = FCPScoredPosition();
                ScoredPosition.CalculatedPosition = CalculatedPositionPair.CalculatedPositionA;

                ScoredPosition.Score = CalculateScoreForPosition(ScoredPosition.CalculatedPosition.Position);

                if (ScoredPosition.Score > 0.0f)
                {
                    ScoredPositionsReturnValue.Add(ScoredPosition);
                }

                FColor ScoreColor = FColor::Black;

                if (ScoredPosition.Score >= 0.0f)
                {
                    ScoreColor.R = uint8(255 - Math::FloorToInt(ScoredPosition.Score / 3.0f * 255.0f));
                    ScoreColor.G = uint8(0 + Math::FloorToInt(ScoredPosition.Score / 3.0f * 255.0f));
                }

                VLog::Circle(Combat.Self, "S: " + ScoredPosition.Score, RaisePosition(PlaceFlatPositionIntoSpace(ScoredPosition.CalculatedPosition.Position, Combat.CharacterOfInterest)), 30.0f, ScoreColor);
            }
            else
            {
                //VLog::Circle(Combat.Self, "S: INV", CalculatedPositionPair.CalculatedPositionB.Position, 30.0f, FColor::Black);
            }

            if (CalculatedPositionPair.CalculatedPositionB.bIsValid)
            {
                FCPScoredPosition ScoredPosition = FCPScoredPosition();
                ScoredPosition.CalculatedPosition = CalculatedPositionPair.CalculatedPositionB;

                ScoredPosition.Score = CalculateScoreForPosition(ScoredPosition.CalculatedPosition.Position);

                if (ScoredPosition.Score >= 0.0f)
                {
                    ScoredPositionsReturnValue.Add(ScoredPosition);
                }

                FColor ScoreColor = FColor::Black;

                if (ScoredPosition.Score >= 0.0f)
                {
                    ScoreColor.R = uint8(255 - Math::FloorToInt(ScoredPosition.Score / 3.0f * 255.0f));
                    ScoreColor.G = uint8(0 + Math::FloorToInt(ScoredPosition.Score / 3.0f * 255.0f));
                }

                VLog::Circle(Combat.Self, "S: " + ScoredPosition.Score, PlaceFlatPositionIntoSpace(ScoredPosition.CalculatedPosition.Position, Combat.CharacterOfInterest), 30.0f, ScoreColor);
            }
            else
            {
                //VLog::Circle(Combat.Self, "S: INV", CalculatedPositionPair.CalculatedPositionB.Position, 30.0f, FColor::Black);
            }
        }

        ScoredPositionsReturnValue.Sort();
        return ScoredPositionsReturnValue;
    }

    float CalculateScoreForPosition(FVector2D Position)
    {
        TArray<float> Scores;

        // Add a vector2d to ScoresAndWeights for every score check

        // The Position has to be closer than the movement distance maximum
        float PositionToAgentDistance = Position.Distance(OwningAgentProjectedLocation);
        if (PositionToAgentDistance > MaximumPositionDistance || PositionToAgentDistance < MinimumPositionDistance)
            return -1.0f;

        float PositionToAgentDistanceScore = Math::GetMappedRangeValueClamped(FVector2D(FrontQuadrantDistanceTolerance, MaximumPositionDistance), FVector2D(1.0f, 0.0f), PositionToAgentDistance);
        Scores.Add(PositionToAgentDistanceScore);

        // Score the positions higher the closer they are to the Best position.
        float BestToCurrentPositionDistance = Position.Distance(BestPosition);
        float BestPositionDistanceScore = Math::GetMappedRangeValueClamped(FVector2D(FrontQuadrantDistanceTolerance, MaximumPositionDistance), FVector2D(1.0f, 0.0f), BestToCurrentPositionDistance);
        Scores.Add(BestPositionDistanceScore);

        float BestPositionToAgentDistance = BestPosition.Distance(OwningAgentProjectedLocation);
        if (BestToCurrentPositionDistance - BestPositionToAgentDistance >= MinimumPositionDistance &&
            BestToCurrentPositionDistance - BestPositionToAgentDistance < 0.0f &&
            BestPositionToAgentDistance > MinimumPositionDistance)
        {
            Scores.Add(1.0f);
        }
        else
        {
            Scores.Add(-0.1f);
        }

        float FinalScore = 0.0f;
        for (float Score : Scores)
        {
            FinalScore += Score;
        }

        return FinalScore;
    }

    void SetCorrectedPosition(int StructIndex, int VariantIndex, bool bIsValid, FVector2D Position)
    {
        auto& CalculatedPosition = CalculatedPositions[StructIndex];
        switch (VariantIndex)
        {
            case 0:
            {
                CalculatedPosition.CalculatedPositionA.bIsValid = bIsValid;
                CalculatedPosition.CalculatedPositionA.Position = Position;
                break;
            }
            case 1:
            {
                CalculatedPosition.CalculatedPositionB.bIsValid = bIsValid;
                CalculatedPosition.CalculatedPositionB.Position = Position;
            }
        }
    }
}

UCLASS()
class UAICombatPositioning_StaticCircleAroundTarget_NoStrafing : UAICombatPositioning_StaticCircleAroundTarget
{
    UAICombatPositioning_StaticCircleAroundTarget_NoStrafing(UAIState_Combat_G1R InCombat)
    {
        Combat = InCombat;
    }

    default bPreventStrafing = true;
    default MinimumPositionDistance = 150.0f;

    bool IsPositionValid(FVector Position) override
    {
        if (!Super::IsPositionValid(Position))
            return false;

        if (!Combat.Self.IsFacingLocation(Position))
            return false;

        return true;
    }

    bool GetLocationToMoveTo(FVector& OutPosition, float PreferredDistance = -1.0f, bool bPositionInFrontOfTarget = true) override
    {
        if (Super::GetLocationToMoveTo(OutPosition, PreferredDistance, !Combat.IsCurrentRole(ECombatRole::Observer)))
            return true;

        return false;
    }
}