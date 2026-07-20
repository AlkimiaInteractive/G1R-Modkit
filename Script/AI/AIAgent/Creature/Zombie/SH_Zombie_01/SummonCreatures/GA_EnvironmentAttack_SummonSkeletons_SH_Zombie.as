class UGA_EnvironmentAttack_SummonSkeletons_SH_Zombie : UGA_EnvironmentAttack_SummonCreatureByTime
{

    default m_spellConfigClass = USpellConfig_SummonSkeletons_SH_Zombie::StaticClass();

    default m_SpawnerActorFilterClass = ASH_ZombieSkeletonSpawnerVisual::StaticClass();
    default m_PlayerDetectionActorFilterClass = AEnvironmentAttack_SummonSkeletons_SH_Zombie_PlayerDetection::StaticClass();

    bool ValidateSpawners(TArray<AActor> Spawners, FString& ErrorMsg) override
    {
        ErrorMsg = FString("UGA_EnvironmentAttack_SummonSkeletons_SH_Zombie: Missing summon creature spawners in World. Must be 4 SH_ZombieSkeletonSpawnerVisual");
        return Spawners.Num() != 4;
    }

    bool ValidatePlayerDetectionActor(TArray<AActor> Spawners, FString& ErrorMsg) override
    {
        ErrorMsg = FString("UGA_EnvironmentAttack_SummonSkeletons_SH_Zombie: Missing player detection actor in World. Must be a AEnvironmentAttack_SummonSkeletons_SH_Zombie_PlayerDetection");
        return Spawners.Num() == 1 && Spawners[0].IsA(m_PlayerDetectionActorFilterClass);
    }
}