
UCLASS()
class UCharacterDefinition_Creature_Zombie : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Zombie;
	default m_Species = GameplayTag::Species_Creature_Undead_Zombie;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
	default m_Blood = UCreatureBlood_Black::StaticClass();
    
    default m_AbilitiesEffect = UGE_Zombie_AI::StaticClass();
	default m_OnPlayerEffect = UGE_Zombie_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Zombie::StaticClass();

	 //default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Skeleton::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UZombieWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 20);
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 250); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 80);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 80);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 60);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 60);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 120);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 60);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 100);
	// protection[PROT_FLY] = 30;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 200);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	//default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

    default m_AIAbility = UGameplayAbility_CharacterAI_Zombie::StaticClass();
    default m_UniqueName = n"Zombie";
	
	//default m_CharacterVisualsDefinition = UZombieCharacterVisualsDefinition::StaticClass();
	
    //default m_MutableAsset = "MO_Zombie";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Zombie/mutable/";
}

// UCLASS()
// class UZombieCharacterVisualsDefinition : UArmorVisualsDefinition
// {
	
// }

   