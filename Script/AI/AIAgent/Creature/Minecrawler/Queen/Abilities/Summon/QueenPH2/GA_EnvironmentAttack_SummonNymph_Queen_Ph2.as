class UGA_EnvironmentAttack_SummonNymph_Queen_Ph2 : UGA_EnvironmentAttack_SummonCreatureByTime
{

    default m_spellConfigClass = USpellConfig_SummonNymph_Queen::StaticClass();

    default m_SpawnerActorFilterClass = ASH_QueenNymphSpawnerVisual_Ph2::StaticClass();

    default m_PlayerDetectionActorFilterClass = AEnvironmentAttack_SummonNymph_Queen_Ph2_PlayerDetection::StaticClass();

    bool ValidateSpawners(TArray<AActor> Spawners, FString& ErrorMsg) override
    {
        ErrorMsg = FString("UGA_EnvironmentAttack_SummonNymph_Queen_Ph2: Missing summon creature spawners in World. Must be 4 SH_QueenNymphSpawnerVisual_Ph2");
        return Spawners.Num() != 4;
    }
    bool ValidatePlayerDetectionActor(TArray<AActor> Spawners, FString& ErrorMsg) override
    {
        ErrorMsg = FString("UGA_EnvironmentAttack_SummonNymph_Queen_Ph2: Missing player detection actor in World. Must be a AEnvironmentAttack_SummonNymph_Queen_Ph2_PlayerDetection");
        return Spawners.Num() == 1 && Spawners[0].IsA(m_PlayerDetectionActorFilterClass);
    }
}
