class UGA_EnvironmentAttack_SummonSkeletons_Unhilqt : UGA_EnvironmentAttack_SummonCreatureByTime
{

    default m_spellConfigClass = USpellConfig_SummonSkeletons_VarragUnhilqt::StaticClass();

    default m_SpawnerActorFilterClass = AUnhilqtSkeletonSpawnerVisual::StaticClass();
    default m_PlayerDetectionActorFilterClass = AEnvironmentAttack_SummonSkeletons_Unhilqt_PlayerDetection::StaticClass();

    bool ValidateSpawners(TArray<AActor> Spawners, FString& ErrorMsg) override
    {
        ErrorMsg = FString("UGA_EnvironmentAttack_SummonSkeletons_Unhilqt: Missing summon creature spawners in World. Must be 4 AUnhilqtSkeletonSpawnerVisual");
        return Spawners.Num() != 4;
    }

    bool ValidatePlayerDetectionActor(TArray<AActor> Spawners, FString& ErrorMsg) override
    {
        ErrorMsg = FString("UGA_EnvironmentAttack_SummonSkeletons_Unhilqt: Missing player detection actor in World. Must be a AEnvironmentAttack_SummonSkeletons_Unhilqt_PlayerDetection");
        return Spawners.Num() == 1 && Spawners[0].IsA(m_PlayerDetectionActorFilterClass);
    }
}