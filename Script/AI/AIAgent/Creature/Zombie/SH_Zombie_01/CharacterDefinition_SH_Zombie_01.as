
UCLASS()
class UGE_SH_Zombie_01 : UGE_Zombie_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Filter_Damage_FocusStoneMachine);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NeverDisengage);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Heal_OnlyWasteMana); 
	
    default AddAbility(UGA_EnvironmentAttack_SummonSkeletons_SH_Zombie::StaticClass());
}

UCLASS()
class UCharacterDefinition_SH_Zombie_01 : UCharacterDefinition_Creature_Zombie
{
    default m_UniqueName = n"SH_Zombie_01";
	default m_CharacterType = GameplayTag::AIAgent_Creature_Zombie_Guardian;
	default m_AbilitiesEffect = UGE_SH_Zombie_01::StaticClass();

	default SetAttributeValue("AttributeSet_Health.Health", 268); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 268);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 0);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 0);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_SH_Zombie_01::StaticClass();
	default m_AIAbility = UGameplayAbility_CharacterAI_Zombie_SH::StaticClass();
}

UCLASS()
class UCharacterVisualsDefinition_SH_Zombie_01: UArmorVisualsDefinition_Zombie
{
    default m_PreBakedName = "SH_Zombie_01";
    default m_HasPreBakedSK = true;
}

UCLASS()
class USpawnAIAgentDefinition_SH_Zombie_01 : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_SH_Zombie_01::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Zombie/AIAgentCharacter_Zombie.AIAgentCharacter_Zombie_C'";
}