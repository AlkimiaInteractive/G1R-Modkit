


UCLASS()
class UCharacterDefinition_Creature_Meatbug : UCharacterDefinition_Creature
{
	default bHideHealthBar = true;
	default m_CanAttack = false;
	default m_CharacterType = GameplayTag::AIAgent_Creature_Meatbug;
	default m_Species = GameplayTag::Species_Creature_Meatbug;

	default SetAttributeValue("AttributeSet_Health.Health", 10);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10);
	default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 10);
	
    default m_Blood = UCreatureBlood_Yellow::StaticClass();
	default m_AbilitiesEffect = UGE_Meatbug_AI::StaticClass();
	default m_OnPlayerEffect = UGE_Meatbug_Player::StaticClass();
    
	default m_CameraConfig = UMeatbugCamera::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Meatbug::StaticClass());

    default AddToInventory(UItAt_Meatbug_01::StaticClass(), 1, EInventoryTypes::MainContainer);

	default m_AIAbility = UGameplayAbility_CharacterAI_Meatbug::StaticClass();
    default m_UniqueName = n"Meatbug";
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Meatbug::StaticClass();
}