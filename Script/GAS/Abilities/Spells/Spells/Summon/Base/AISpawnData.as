
USTRUCT(Blueprintable)
struct FAISpawnData
{
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<USpawnAIAgentDefinition> m_SpawnAIAgentDefinition;
	
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_Amount = 1;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<UAIState_DailyRoutine> m_DailyRoutine;
};
