UCLASS()
class AMiniGolemIceRockSpawnerVisual : ACreatureSummonVisual
{
    default m_ConfigClass = USummonIceMiniGolem_IceGolem_SpellConfig::StaticClass();
    default m_SaveGameKey = n"IceGolem_MinigolemSpawner_Activated";

    default m_DefaultSpawnDirection.SetRelativeLocation(FVector(0.f, 160.f, 180.f));

    FVector GetSpawnLocation() override
    {
        return m_DefaultSpawnDirection.GetWorldLocation();
    }
}