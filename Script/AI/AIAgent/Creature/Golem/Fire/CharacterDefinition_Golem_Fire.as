UCLASS()
class UFireGolem_Blood : UCharacterBloodSettings
{
	default m_BloodColor = FLinearColor(0.584078,0.184475,0.009721,1.000000);
	default m_CanDecompose = false;
	default m_HasBlood = false;
}

UCLASS()
class UCharacterDefinition_Creature_Golem_Fire : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Golem_Fire;
	default m_Species = GameplayTag::Species_Creature_Golem_Fire;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
	default m_Blood = UFireGolem_Blood::StaticClass();
    
    default m_AbilitiesEffect = UGE_Golem_Fire_AI::StaticClass();
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
	default SetAttributeValue("AttributeSet_Strength.Strength", 60);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 400); //150);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 400); //150);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 600); //100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 600); //100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 9999);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 9999);
	// protection[PROT_FLY] = 9999;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Golem_Fire::StaticClass();
    default m_UniqueName = n"Golem_Fire";
}