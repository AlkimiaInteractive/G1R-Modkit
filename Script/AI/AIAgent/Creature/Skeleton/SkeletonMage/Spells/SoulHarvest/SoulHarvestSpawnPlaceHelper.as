UCLASS()
class USoulHarvestSpawnPlaceHelper : UCircleSummonSpawnPlaceHelper
{
    default m_MinFloorHeight = -200.f;
	default m_MaxFloorHeight = 50.f;
    UPROPERTY()
    AActor m_Owner;

    bool IsAnIgnoringActor(AActor Actor) const override
    {
        return Super::IsAnIgnoringActor(Actor);
    }

    bool IsPositionReachable(FVector PathStart, FVector PathEnd) override
    {
        //@DE - No need to check 
        return true;
    }
}