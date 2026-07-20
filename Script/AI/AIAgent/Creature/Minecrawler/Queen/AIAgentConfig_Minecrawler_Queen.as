
UCLASS()
class UAIAgentConfig_Minecrawler_Queen : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Queen;
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler;
	default m_AnimConfig = UAnimConfig_MCQueen;
	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large;

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class UAIAgentConfig_Minecrawler_QueenPh2 : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Queen_Ph2;
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler;
	default m_AnimConfig = UAnimConfig_MCQueen_Ph2;
	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Queen;

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class UAIAgentConfig_Minecrawler_QueenPh2_Sleeper : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Queen_Ph2_Sleeper;
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler;
	default m_AnimConfig = UAnimConfig_MCQueen_Ph2;
	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large;

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class AMinecrawler_Queen : AMinecrawler
{
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated)
	bool DetachEggSac = false;
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated)
	bool IsInSecondPhase = false;
	    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"MCQueen_Phase1_Completed";

	default bNeverApplyTickOptimizations = true;

	UFUNCTION(BlueprintEvent, NetMulticast)
	void DoDetachEggSac()
	{

	}

	UFUNCTION(BlueprintEvent, NetMulticast)
	void Hide()
	{

	}

	UFUNCTION(BlueprintCallable)
	bool CanSpawnEggSac()
	{
		float32 savedState = 0.0f;
		bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
				return false;
			}
		}
		return true;
	}
	default DefaultAIAgentConfig = UAIAgentConfig_Minecrawler_Queen::StaticClass();
}

UCLASS()
class AMinecrawler_Queen_Ph2 : AMinecrawler
{
	default DefaultAIAgentConfig = UAIAgentConfig_Minecrawler_QueenPh2::StaticClass();
	default DefaultAIAgentConfig = UAIAgentConfig_Minecrawler_QueenPh2_Sleeper::StaticClass();
}