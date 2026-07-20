
UCLASS()
class UCharacterDefinition_Creature_Troll_Adult_Shrinked : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Troll_Normal;
	default m_Species = GameplayTag::Species_Creature_Troll_Adult;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Troll_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Troll_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Troll::StaticClass();

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UTrollWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	// Other
    default m_CameraConfig = UTrollCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 200);
	default SetAttributeValue("AttributeSet_Strength.Strength", 100);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 20);
    default SetAttributeValue("AttributeSet_Health.Health", 600); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);
	// protection[PROT_FLY] = 9999;

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	//default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);

	default m_AIAbility = UGameplayAbility_CharacterAI_Troll_Adult_Shrinked::StaticClass();

	default m_UniqueName = n"TC_TrollAdult_Shrinked_Test";

	//
}