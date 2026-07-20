
UCLASS()
class UCharacterDefinition_Creature_Skeleton_Mage : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Mage;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Mage;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
	default m_Blood = UCreatureBlood_None::StaticClass();
    
    default m_AbilitiesEffect = UGE_Skeleton_Mage_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Skeleton_Mage_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_SkeletonMage::StaticClass();

    // Inventory
    FGameplayTagContainer MeleeSlotItemCategories;
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);

	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

	default AddToInventory(USkeletonMageWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);


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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 8); //80);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 80);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 500);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//
    
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton_Mage::StaticClass();
    default m_UniqueName = n"SkeletonMage";

	UPROPERTY()
    UClass m_TeleportSpotFilterClass = ASkeletonMageTeleportSpotVisual::StaticClass();

}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_Mage1 : UCharacterDefinition_Creature_Skeleton_Mage
{
	default m_TeleportSpotFilterClass = ASkeletonMageTeleportSpotVisual_Mage_001::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_Mage2 : UCharacterDefinition_Creature_Skeleton_Mage
{
	default m_TeleportSpotFilterClass = ASkeletonMageTeleportSpotVisual_Mage_002::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_Mage3 : UCharacterDefinition_Creature_Skeleton_Mage
{
	default m_TeleportSpotFilterClass = ASkeletonMageTeleportSpotVisual_Mage_003::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_Mage5 : UCharacterDefinition_Creature_Skeleton_Mage
{
	default m_TeleportSpotFilterClass = ASkeletonMageTeleportSpotVisual_Mage_005::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Skeleton_Mage4 : UCharacterDefinition_Creature_Skeleton_Mage
{
	default m_TeleportSpotFilterClass = ASkeletonMageTeleportSpotVisual_Mage_004::StaticClass();
	default AddToInventory(UItWr_Book_Chromanin_01::StaticClass(), 1, EInventoryTypes::MainContainer);
}