UCLASS()
class UIceGolem_Blood : UCharacterBloodSettings
{
	default m_BloodColor = FLinearColor(0.366253,0.590619,0.479320,1.000000);
	default m_CanDecompose = false;
	default m_HasBlood = false;
}

UCLASS()
class UCharacterDefinition_Creature_Golem_Ice : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Golem_Ice;
	default m_Species = GameplayTag::Species_Creature_Golem_Ice;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
	default m_Blood = UIceGolem_Blood::StaticClass();
    
    default m_AbilitiesEffect = UGE_Golem_Ice_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Golem_Ice_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Golem::StaticClass();

    default m_CueData.Add(GameplayTag::State_Summoned, UCueVisualConfig_Summoned_Golem::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UIceGolemWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventory(UItAt_Icegolem_01::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Icegolem_02::StaticClass(), 1, EInventoryTypes::MainContainer);
	
	// Other
    default m_CameraConfig = UGolemCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 100);
	default SetAttributeValue("AttributeSet_Strength.Strength", 60);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 500); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 600);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 600);
	default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 9999);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);
	// protection[PROT_FLY] = 9999;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 120.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Golem_Ice::StaticClass();
    default m_UniqueName = n"Golem_Ice";
}
