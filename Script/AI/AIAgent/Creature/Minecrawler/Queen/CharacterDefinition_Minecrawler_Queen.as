
UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Queen : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Queen;
    default m_Species = GameplayTag::Species_Creature_Minecrawler_Queen;

	default m_HealthBarAttachToSocket = n"HealthBar";
	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
	default m_Blood = UCreatureBlood_Blue::StaticClass();
    
    default m_AbilitiesEffect = UGE_Minecrawler_Queen_AI;
    default m_OnPlayerEffect = UGE_Minecrawler_Queen_Player;
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler_Queen;

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 13);
	default SetAttributeValue("AttributeSet_Strength.Strength", 65); //65
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 800); //90);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 800); //90);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 4000); //60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 4000); //60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// protection[PROT_FLY] = 1000;

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Queen;
    default m_UniqueName = n"Minecrawler_Queen";

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	//Camera
	default m_CameraConfig = UMinecrawlerQueenPh1Camera::StaticClass();
	
	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 2);

    default AddToInventory(UMCQueen_Legs, 1, EInventoryTypes::MeleeSlot);
	//default AddToInventory(UMCQueen_Legs_Phase2, 1, EInventoryTypes::MeleeSlot);
	//default AddToInventory(UItAt_Crawler_01, 1, EInventoryTypes::MainContainer);
	//default AddToInventory(UItAt_Minecrawlerqueen_01, 1, EInventoryTypes::MainContainer);
}