
UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Temple : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Temple;
    default m_Species = GameplayTag::Species_Creature_Minecrawler;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Minecrawler_Temple_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Minecrawler_Temple_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler::StaticClass();

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    default AddToInventory(UMinecrawlerLeg::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Crawler_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Crawler_02::StaticClass(), 2, EInventoryTypes::MainContainer);

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 25);
	default SetAttributeValue("AttributeSet_Strength.Strength", 150);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 600); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 250);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 250);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 70);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 70);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 60);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 40);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 250);
	// protection[PROT_FLY] = 70;

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	//Camera
	default m_CameraConfig = UMinecrawlerCamera::StaticClass();

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Temple::StaticClass();
    default m_UniqueName = n"MinecrawlerTemple";
}

UCLASS()
class UCharacterVisualsDefinition_Minecrawler_Temple_Sleeper : UArmorVisualsDefinition
{
	default m_TagsToAdd.AddTag(GameplayTag::Visuals_DeathDissolve);
}


UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Temple_Sleeper : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Temple;
    default m_Species = GameplayTag::Species_Creature_Minecrawler;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Minecrawler_Temple_Sleeper_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Minecrawler_Temple_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler::StaticClass();

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    default AddToInventory(UMinecrawlerLeg::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Crawler_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Crawler_02::StaticClass(), 2, EInventoryTypes::MainContainer);

	default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Harpy_Sleeper::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 25);
	default SetAttributeValue("AttributeSet_Strength.Strength", 160);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 120);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 70);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 70);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 65);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// protection[PROT_FLY] = 70;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	//Camera
	default m_CameraConfig = UMinecrawlerCamera::StaticClass();

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Temple::StaticClass();
    default m_UniqueName = n"MinecrawlerTemple";
}