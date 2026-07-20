UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Warrior : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Warrior;
	default m_Species = GameplayTag::Species_Creature_Minecrawler_Warrior;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Minecrawler_Warrior_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Minecrawler_Warrior_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Minecrawler::StaticClass());

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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 22);
	default SetAttributeValue("AttributeSet_Strength.Strength", 110);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 70);
    default SetAttributeValue("AttributeSet_Health.Health", 350);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 350);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 200);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 65);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 65);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// protection[PROT_FLY] = 30;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 220);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	//Camera
	default m_CameraConfig = UMinecrawlerCamera::StaticClass();

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Warrior::StaticClass();
    default m_UniqueName = n"Minecrawler Warrior";

}

UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Warrior_King : UCharacterDefinition_Creature_Minecrawler_Warrior
{

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;

	default SetAttributeValue("AttributeSet_LevelProgression.Level", 44);
	default SetAttributeValue("AttributeSet_Strength.Strength", 135);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 70);
    default SetAttributeValue("AttributeSet_Health.Health", 550);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 550);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 350);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 350);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 65);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 65);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// protection[PROT_FLY] = 30;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 500);

	default m_CameraConfig = UDemonCamera::StaticClass();

	default AddToInventory(UItAt_Crawler_01::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Crawler_02::StaticClass(), 4, EInventoryTypes::MainContainer);

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Warrior_King::StaticClass();
    default m_UniqueName = n"Minecrawler King";

	default m_AbilitiesEffect = UGE_Minecrawler_Warrior_King_AI::StaticClass();

}

UCLASS()
class UGE_Minecrawler_Warrior_King_AI : UGE_Minecrawler_Warrior_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default AddAbility(UGameplayAbilityEatItem);
	default AddAbility(UGA_BossHealthBar::StaticClass());
	default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}