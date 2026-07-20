
UCLASS()
class UCharacterDefinition_Creature_Skeleton_Scout : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Scout;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Scout;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
	default m_Blood = UCreatureBlood_None::StaticClass();
    
    default m_AbilitiesEffect = UGE_Skeleton_Warrior_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Skeleton_Warrior_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton::StaticClass();
	default m_Personality = UGothicCharacterPersonality_Archer;

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // TODO: ADJUST FOR WARRIOR
    // Inventory
	FGameplayTagContainer MeleeSlotItemCategories;
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

	FGameplayTagContainer RangedSlotItemCategories;
	default RangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Bow);
	default CreateInventory(EInventoryTypes::RangedSlot, RangedSlotItemCategories, 1);

	default AddToInventory(UItMw_1H_Sword_Scythe_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	// default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1, EInventoryTypes::RangedSlot);
	default AddToInventory(UItAm_Arrow::StaticClass(), 20, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

	default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());

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
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
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
    
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton_Scout::StaticClass();
    default m_UniqueName = n"Skeleton Scout";

	//default m_CharacterVisualsDefinition = USkeletonScoutCharacterVisualsDefinition::StaticClass();
	
    //default m_MutableAsset = "MO_Skeleton";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Skeleton/mutable/";
}

// UCLASS()
// class USkeletonScoutCharacterVisualsDefinition : UArmorVisualsDefinition
// {
//     UPROPERTY()
//     FString Chest = "Chest";
	
// 	UPROPERTY()
//     FString Helmet = "Helmet_01";

// 	UPROPERTY()
//     FString R_Shoulder = "R_Shoulder_01";

// 	UPROPERTY()
//     FString LShoulder = "L_Shoulder_01";

// 	// UFUNCTION(BlueprintOverride)
// 	// void Initialize()
//     // {
// 	// 	switch (Math::Rand() % 2)
// 	// 	{
// 	// 	case 0:
// 	// 		Chest = "Chest";
// 	// 		break;
// 	// 	case 1:
// 	// 		Chest = "StrapChest";
// 	// 		break;
// 	// 	}

// 	// 	switch (Math::Rand() % 3)
// 	// 	{
// 	// 	case 0:
// 	// 		Helmet = "Helmet_01";
// 	// 		break;
// 	// 	case 1:
// 	// 		Helmet = "Helmet_02";
// 	// 		break;
// 	// 	case 3:
// 	// 		Helmet = "None";
// 	// 		break;
// 	// 	}

// 	// 	switch (Math::Rand() % 3)
// 	// 	{
// 	// 	case 0:
// 	// 		R_Shoulder = "R_Shoulder_01";
// 	// 		break;
// 	// 	case 1:
// 	// 		R_Shoulder = "R_Shoulder_02";
// 	// 		break;
// 	// 	case 2:
// 	// 		R_Shoulder = "R_Shoulder_03";
// 	// 		break;
// 	// 	}

// 	// 	switch (Math::Rand() % 4)
// 	// 	{
// 	// 	case 0:
// 	// 		LShoulder = "L_Shoulder_01";
// 	// 		break;
// 	// 	case 1:
// 	// 		LShoulder = "L_Shoulder_02";
// 	// 		break;
// 	// 	case 2:
// 	// 		LShoulder = "L_Shoulder_03";
// 	// 		break;
// 	// 	case 3:
// 	// 		LShoulder = "None";
// 	// 		break;
// 	// 	}
//     // }

// }