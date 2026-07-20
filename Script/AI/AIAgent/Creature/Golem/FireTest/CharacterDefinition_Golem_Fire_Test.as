UCLASS()
class USpawnAIAgentDefinition_GolemFire_Test : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_Golem_Fire_Test::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Golem/AIAgentCharacter_GolemFire.AIAgentCharacter_GolemFire_C'";
}

UCLASS()
class UAIAgentConfig_Golem_Fire_Test : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Golem_Fire_Test::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Golem_Fire::StaticClass();
	default m_AnimConfig = UAnimConfig_Golem_Fire::StaticClass();


	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem::StaticClass();
	

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class UCharacterDefinition_Creature_Golem_Fire_Test : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Golem_Fire;
	default m_Species = GameplayTag::Species_Creature_Golem;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Golem_Fire_AI_Test_CanFreeze::StaticClass();
    default m_OnPlayerEffect = UGE_Golem_Fire_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Golem::StaticClass();

    default m_CueData.Add(GameplayTag::State_Summoned, UCueVisualConfig_Summoned_Golem::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UFireGolemWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItAt_Firegolem_01::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Firegolem_02::StaticClass(), 1, EInventoryTypes::MainContainer);
	

	// Other
    default m_CameraConfig = UGolemCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 5.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 100);
	default SetAttributeValue("AttributeSet_Strength.Strength", 50);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 300); //150);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300); //150);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100000); //100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100000); //100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 9999);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 1);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 18);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 1);
	// protection[PROT_FLY] = 9999;

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Golem_Fire_Test::StaticClass();
    default m_UniqueName = n"Golem_Fire";
}

UCLASS()
class UGameplayAbility_CharacterAI_Golem_Fire_Test : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Golem_Fire_Test::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Fire_Test::StaticClass());
}

class UDailyRoutine_Golem_Fire_Test : UAIState_DailyRoutine_Creature
{
}