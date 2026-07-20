UCLASS()
class UCharacterDefinition_Creature_JuvenileTroll : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Troll_Juvenille;
	default m_Species = GameplayTag::Species_Creature_Troll;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_JuvenileTroll_AI::StaticClass();
    default m_OnPlayerEffect = UGE_JuvenileTroll_Player::StaticClass();

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UTrollWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Troll_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Troll_02::StaticClass(), 1, EInventoryTypes::MainContainer);
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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 100);
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 800); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 800);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 220);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 220);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 80);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 70);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// protection[PROT_FLY] = 9999;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	default m_AIAbility = UGameplayAbility_CharacterAI_TrollJuvenile::StaticClass();

	default m_UniqueName = n"Juvenile Troll";
}