UCLASS()
class UCharacterDefinition_Creature_Golem_IceMini : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Golem_Ice;
	default m_Species = GameplayTag::Species_Creature_Golem_Ice_Mini;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
    
    default m_AbilitiesEffect = UGE_MiniGolem_Ice_AI;
    default m_OnPlayerEffect = UGE_MiniGolem_Ice_Player;
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Golem;

    default m_CueData.Add(GameplayTag::State_Summoned, UCueVisualConfig_Summoned_Golem);

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UIceGolemWeapon, 1, EInventoryTypes::MeleeSlot);
    // default AddToInventory(UItAt_Icegolem_01, 1, EInventoryTypes::MainContainer);
    // default AddToInventory(UItAt_Icegolem_01, 1, EInventoryTypes::MainContainer);
	
	// Other
    default m_CameraConfig = UGolemCamera;

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 100);
	default SetAttributeValue("AttributeSet_Strength.Strength", 50);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 80); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 80);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 400);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 400);
	default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 9999);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 9999);
	// protection[PROT_FLY] = 9999;

	//default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 120.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Golem_IceMini;
    default m_UniqueName = n"Golem_Ice";

	default bPersistent = false;
}


UCLASS()
class UGameplayAbility_CharacterAI_Golem_IceMini : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Golem_MiniIce;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_MiniGolem_Ice);
    // default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Ice_Wait);
}

UCLASS()
class UAIAgentConfig_Golem_IceMini : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Golem_IceMini;
	default m_LocomotionConfig = ULocomotionConfig_Mini_Golem_Ice;
	default m_AnimConfig = UAnimConfig_MiniGolem_Ice;
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem;
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;

}

UCLASS()
class AGolemIceMini : AGolemBase
{
	default DefaultAIAgentConfig = UAIAgentConfig_Golem_IceMini;
}

class USpawnAIAgentDefinition_Mini_GolemIce : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Golem_IceMini;
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Creature/Golem/AIAgentCharacter_GolemIceMini.AIAgentCharacter_GolemIceMini_C'";
}

UCLASS()
class ULocomotionConfig_Mini_Golem_Ice: ULocomotionConfig_Golem
{
	default m_SpeedConfig = USpeedConfig_Test_Mini_Golem_Ice;
};


// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Mini_Golem_Ice: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100); // 30 //50
	default m_Speeds.Add(EWalkSpeed::Running, 85); // 99 //165
	default m_Speeds.Add(EWalkSpeed::Sprinting, 200); //214 //357
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Mini_Golem_Ice: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Mini_Golem_Ice);
};


UCLASS()
class ULocomotionSpeedSettings_Mini_Golem_Ice: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Mini_Golem_Ice);
};


UCLASS()
class USpeedConfig_Mini_Golem_Ice: USpeedConfig_Golem
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Mini_Golem_Ice;
    default m_LookingDirection = ULocomotionSpeedSettings_Mini_Golem_Ice;
    default m_Aiming = ULocomotionSpeedSettings_Mini_Golem_Ice;
}