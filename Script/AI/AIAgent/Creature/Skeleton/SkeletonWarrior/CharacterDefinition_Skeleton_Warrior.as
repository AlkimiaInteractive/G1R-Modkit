
UCLASS()
class UCharacterDefinition_Creature_Skeleton_Warrior : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Warrior;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Warrior;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
	default m_Blood = UCreatureBlood_None::StaticClass();
    
    default m_AbilitiesEffect = UGE_Skeleton_Warrior_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Skeleton_Warrior_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton::StaticClass();

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // TODO: ADJUST FOR WARRIOR
    // Inventory
	FGameplayTagContainer MeleeSlotItemCategories;
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

	default AddToInventory(UItMw_1H_Mace_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

		// Other
    default m_CameraConfig = USkeletonCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 30);
	default SetAttributeValue("AttributeSet_Strength.Strength", 130);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 130);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 130);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 35);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 300);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//
    
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton_Warrior::StaticClass();
    default m_UniqueName = n"SkeletonWarrior";

	//default m_CharacterVisualsDefinition = USkeletonWarriorCharacterVisualsDefinition::StaticClass();
	
    //default m_MutableAsset = "MO_Skeleton";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Skeleton/mutable/";
}


UCLASS()
class UCharacterDefinition_Creature_Skeleton_Warrior_Summon : UCharacterDefinition_Creature
{
	default m_Blood = UCreatureBlood_None::StaticClass();

	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Warrior;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Warrior;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
    
    default m_AbilitiesEffect = UGE_Skeleton_AI_Summon::StaticClass();
    default m_OnPlayerEffect = UGE_Skeleton_Warrior_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton::StaticClass();

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // TODO: ADJUST FOR WARRIOR
    // Inventory
	FGameplayTagContainer MeleeSlotItemCategories;
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

	default AddToInventory(UItMw_1H_Mace_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

	// Other
    default m_CameraConfig = UDefaultCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 30);
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 130);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 130);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 35);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//
    
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton_Warrior::StaticClass();
    default m_UniqueName = n"SkeletonWarrior";

	//default m_CharacterVisualsDefinition = USkeletonWarriorCharacterVisualsDefinition::StaticClass();
	
    //default m_MutableAsset = "MO_Skeleton";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Skeleton/mutable/";
}