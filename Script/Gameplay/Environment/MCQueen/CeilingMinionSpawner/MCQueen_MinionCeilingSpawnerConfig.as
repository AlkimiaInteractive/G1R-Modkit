UCLASS()
class UMCQueen_MinionCeilingSpawnerConfig : UGothicBaseConfig
{
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_MinionClass = USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass();

    UPROPERTY()
    float m_MinTime = 4.f;
    UPROPERTY()
    float m_MaxTime = 8.f;

}