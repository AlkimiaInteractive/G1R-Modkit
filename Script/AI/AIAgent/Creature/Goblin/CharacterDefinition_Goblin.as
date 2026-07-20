
UCLASS()
class UCharacterDefinition_Creature_Goblin : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Goblin_Normal;
	default m_Species = GameplayTag::Species_Creature_Goblin;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
	default m_Blood = UCreatureBlood_Green::StaticClass();
    
    default m_AbilitiesEffect = UGE_Goblin_Green_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Goblin_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Goblin::StaticClass();

    // Inventory
	FGameplayTagContainer MeleeSlotItemCategories;
	default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);
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

	default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
	default SetAttributeValue("AttributeSet_Health.Health", 10000); //70, 40
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10000); //70, 40
	default SetAttributeValue("AttributeSet_Strength.Strength", 20); 

	default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//
	
	default m_AIAbility = UGameplayAbility_CharacterAI_Goblin_Green::StaticClass();
    default m_UniqueName = n"Goblin_Green";

    //default m_MutableAsset = "MO_Goblin";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Goblin/mutable/";
}