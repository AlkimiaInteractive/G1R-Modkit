UCLASS(Abstract)
class UCharacterDefinition_Creature_Skeleton_Base : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Normal;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Normal;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
    default m_Blood = UCreatureBlood_None::StaticClass();

    default m_AbilitiesEffect = UGE_Skeleton_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Skeleton_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton::StaticClass();

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // Inventory
	FGameplayTagContainer MeleeSlotItemCategories;
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);

	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 25);
	default SetAttributeValue("AttributeSet_Strength.Strength", 90);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
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

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 250);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//
    
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton::StaticClass();
    default m_UniqueName = n"Skeleton";
	
	//default m_CharacterVisualsDefinition = USkeletonCharacterVisualsDefinition::StaticClass();
    //default m_MutableAsset = "MO_Skeleton";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Skeleton/mutable/";
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton : UCharacterDefinition_Creature_Skeleton_Base
{
	default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_Creature_SkMageSummonedSkeleton : UCharacterDefinition_Creature_Skeleton
{    
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default m_AbilitiesEffect = UGE_SkMageSummonedSkeleton_AI::StaticClass();
    default m_OnPlayerEffect = UGE_SkMageSummonedSkeleton_Player::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_XardasServant : UCharacterDefinition_Creature_Skeleton_Base
{
	default m_InitialGuildEffect = UGE_Guild_Human_SummonedDemon::StaticClass();

	default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1);
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_Summon : UCharacterDefinition_Creature
{
	default m_Blood = UCreatureBlood_None::StaticClass();
	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Normal;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Normal;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
    
    default m_AbilitiesEffect = UGE_Skeleton_AI_Summon::StaticClass();
    default m_OnPlayerEffect = UGE_Skeleton_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton::StaticClass();

    //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // Inventory
	FGameplayTagContainer MeleeSlotItemCategories;
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);

	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

	default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 25);
	default SetAttributeValue("AttributeSet_Strength.Strength", 80);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
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
    
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton::StaticClass();
    default m_UniqueName = n"Skeleton";
	
	//default m_CharacterVisualsDefinition = USkeletonCharacterVisualsDefinition::StaticClass();
    //default m_MutableAsset = "MO_Skeleton";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Skeleton/mutable/";
}

UCLASS()
class UCharacterDefinition_Creature_VUnhilqtSkeleton : UCharacterDefinition_Creature_Skeleton_Warrior
{    
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 30);
	//default SetAttributeValue("AttributeSet_Strength.Strength", 80);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 10); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
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
	default m_AbilitiesEffect = UGE_Skeleton_AI_Summon::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_SH_ZombieSkeleton : UCharacterDefinition_Creature_Skeleton
{    
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 25);
	//default SetAttributeValue("AttributeSet_Strength.Strength", 80);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 100); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 35);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

	default m_AbilitiesEffect = UGE_SH_Skeleton_AI::StaticClass();
}


// UCLASS()
// class USkeletonCharacterVisualsDefinition : UArmorVisualsDefinition
// {
//     UPROPERTY()
//     FString Chest = "None";
	
// 	UPROPERTY()
//     FString Helmet = "None";

// 	UPROPERTY()
//     FString R_Shoulder = "None";

// 	UPROPERTY()
//     FString LShoulder = "None";

// }