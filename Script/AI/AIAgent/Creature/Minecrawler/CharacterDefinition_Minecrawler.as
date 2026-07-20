
UCLASS()
class UCharacterDefinition_Creature_Minecrawler : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Normal;
	default m_Species = GameplayTag::Species_Creature_Minecrawler;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;

	default m_Blood = UCreatureBlood_Blue::StaticClass();

    default m_AbilitiesEffect = UGE_Minecrawler_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Minecrawler_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Minecrawler::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    default AddToInventory(UMinecrawlerLeg::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Crawler_01::StaticClass(), 1, EInventoryTypes::MainContainer);

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 13);
	default SetAttributeValue("AttributeSet_Strength.Strength", 75);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 90); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 90);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 50);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 50);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 10);
	// protection[PROT_FLY] = 0;

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 130);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	//Camera
	default m_CameraConfig = UMinecrawlerCamera::StaticClass();

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler::StaticClass();
    default m_UniqueName = n"Minecrawler";
}

UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Named : UCharacterDefinition_Creature_Minecrawler
{
    default m_UniqueName = n"MinecrawlerNamed";
}
