UCLASS()
class USummonIceMiniGolemSpawnPlaceHelper : UCircleSummonSpawnPlaceHelper
{
    default m_MinFloorHeight = -200.f;
	default m_MaxFloorHeight = 50.f;
    UPROPERTY()
    AActor m_Owner;

    bool IsAnIgnoringActor(AActor Actor) const override
    {
        if(IsASpawnRock(Actor))
            return true;

        return Super::IsAnIgnoringActor(Actor);
    }

    bool IsASpawnRock(AActor Actor) const
    {
        auto spawningRock = Cast<AMiniGolemIceRockSpawnerVisual>(Actor);
        return spawningRock != nullptr;
    }

    bool IsPositionReachable(FVector PathStart, FVector PathEnd) override
    {
        //@DE - No need to check 
        return true;
    }
}