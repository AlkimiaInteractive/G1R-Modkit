
UCLASS()
class UCharacterDefinition_Creature_XT_XardasDemon : UCharacterDefinition_Creature_Demon_Lesser
{
    default m_UniqueName = n"XT_XardasDemon";
	default m_AIAbility = UGameplayAbility_CharacterAI_XT_XardasDemon::StaticClass();
	default m_AbilitiesEffect = UGE_Demon_Lesser_AI_Xardas::StaticClass();
	default m_InitialGuildEffect = UGE_Guild_Human_SummonedDemon::StaticClass();
}

UCLASS()
class USpawnAIAgentDefinition_XT_XardasDemon : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_XT_XardasDemon::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Demon/AIAgentCharacter_DemonLesser.AIAgentCharacter_DemonLesser_C'";
}