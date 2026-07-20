UCLASS()
class UDiggableTerrainSubsystem : UScriptWorldSubsystem
{
    UFUNCTION(BlueprintCallable)
    TSet<EPhysicalSurface> GetPhysicalSurfacesUnderLocation(FVector Location, bool bDrawDebug = false) const
    {
        FVector StartLocation = Location + FVector::UpVector * 20.0f;
        FVector EndLocation = Location - FVector::UpVector * 30.0f;
        TArray<AActor> ActorsIgnore;

        EDrawDebugTrace DebugTrace = EDrawDebugTrace::None;

        if (bDrawDebug)
        {
            DebugTrace = EDrawDebugTrace::ForOneFrame;
        }

        TArray<FHitResult> HitResults;
        System::LineTraceMultiByProfile(
            StartLocation,
            EndLocation,
            FName("OverlapAll"),
            false,
            ActorsIgnore,
            DebugTrace,
            HitResults,
            true, FLinearColor::Green, FLinearColor::Red, 50.f);

        TSet<EPhysicalSurface> Surfaces;
        for (auto Hit : HitResults)
        {
            if (Hit.PhysMaterial.SurfaceType == EPhysicalSurface::Default)
                continue;

            Surfaces.Add(Hit.PhysMaterial.SurfaceType);
        }

        return Surfaces;
    }

    UFUNCTION(BlueprintCallable)
    bool IsAllPhysicalSurfaceAtLocationAnyOf(FVector Location, TArray<EPhysicalSurface> RequiredSurfaces) const
    {
        if (RequiredSurfaces.IsEmpty())
            return false;

        auto SurfacesFound = GetPhysicalSurfacesUnderLocation(Location);
        if (SurfacesFound.IsEmpty())
            return false;

        for (auto Surface : SurfacesFound)
        {
            if (!RequiredSurfaces.Contains(Surface))
                return false;
        }

        return true;
    }

    UFUNCTION(BlueprintCallable)
    bool IsLocationDiggableTerrain(FVector Location) const
    {
        TArray<EPhysicalSurface> DiggableTerrains;
        DiggableTerrains.Add(EPhysicalSurface::Grass);
        DiggableTerrains.Add(EPhysicalSurface::Sand);
        DiggableTerrains.Add(EPhysicalSurface::Snow);
        DiggableTerrains.Add(EPhysicalSurface::Mud);
        DiggableTerrains.Add(EPhysicalSurface::Puddle);
        DiggableTerrains.Add(EPhysicalSurface::Stone);
        DiggableTerrains.Add(EPhysicalSurface::Soil);
        DiggableTerrains.Add(EPhysicalSurface::Blood);

        return IsAllPhysicalSurfaceAtLocationAnyOf(Location, DiggableTerrains);
    }
}