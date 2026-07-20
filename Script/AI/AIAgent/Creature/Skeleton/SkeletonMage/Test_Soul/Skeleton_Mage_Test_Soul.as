class USpawnAIAgentDefinition_Test_SkMage_Test_Soul : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Test_SkMage_Test_Soul;
    default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/SoulTest/AIAgentCharacter_Test_SkMage_Soul.AIAgentCharacter_Test_SkMage_Soul_C'";
}

UCLASS()
class UAIAgentConfig_Test_SkMage_Test_Soul : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_SkMage_Test_Soul;
    default m_LocomotionConfig = ULocomotionConfig_SkMage_Test_Soul;
	default m_AnimConfig = UAnimConfig_Test_SkMage_Soul;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class ULocomotionConfig_SkMage_Test_Soul: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_SKMage_Test_Soul;
	default m_GroundConfig = UGroundConfig_Creature;
	default m_LandingConfig = ULandingConfig_Creature;
	default m_AirConfig = UAirConfig_Creature;
	default m_LookConfig = ULookConfig_Creature;
	
	default m_JumpConfig = UJumpConfig_Skeleton;
	default m_WaterConfig = UWaterConfig_Skeleton;
	default m_SwimConfig = USwimConfig_Skeleton;
	default m_RagdollConfig = URagdollConfig_Skeleton;
	default m_ClimbingConfig = UClimbingConfig_Skeleton;
};

////------- SPEED CHANGED

// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Calm_SKMage_Test_Soul: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 90);
	default m_Speeds.Add(EWalkSpeed::Running, 100);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 110);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_SKMage_Test_Soul: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Calm_SKMage_Test_Soul);
};

UCLASS()
class ULocomotionSpeedSettings_SKMage_Test_Soul: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_SKMage_Test_Soul);
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Ground_SKMage_Test_Soul);
};

UCLASS()
class USpeedConfig_SKMage_Test_Soul: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_SKMage_Test_Soul;
    default m_LookingDirection = ULocomotionSpeedSettings_SKMage_Test_Soul;
    default m_Aiming = ULocomotionSpeedSettings_SKMage_Test_Soul;
}


//// ----- SPEED CHANGED END


UCLASS()
class UCharacterDefinition_SkMage_Test_Soul : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Skeleton_Normal;
	default m_Species = GameplayTag::Species_Creature_Undead_Skeleton_Normal;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
    
    default m_AbilitiesEffect = UGE_Skeleton_AI;
    default m_OnPlayerEffect = UGE_Skeleton_Player;
	// default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton;
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Omniperception;

    // Inventory
    // FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);
	// default AddToInventory(UTestSkMage_SoulWeapon, 1, EInventoryTypes::MeleeSlot);


	// Other
    default m_CameraConfig = UDefaultCamera;

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
    default SetAttributeValue("AttributeSet_Health.Health", 1); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//
    
    default m_UniqueName = n"AISkMage_Test_Soul";
    default m_AIAbility = UGameplayAbility_SkMage_Test_Soul;
}

UCLASS()
class UTestSkMage_SoulWeapon : UMeleeWeaponBase_Creature
{
    default m_Name = "Skeleton_Weapon";
    default m_OnEquipEffect = UGE_Skeleton_Equip;

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 30); // 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 20.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

// --- AnimConfig
UCLASS()
class UAttackMeleeConfig_Test_SkMage_Soul_Attack : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/SoulTest/PH_Test_SkMage_Soul_Attack_Montage.PH_Test_SkMage_Soul_Attack_Montage'";
   
	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;
}
UCLASS()
class UComboAttackConfig_Test_SkMage_Soul_Attack : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Test_SkMage_Soul_Attack;
    default m_GA_Attack = UGA_AttackMelee;
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Test_SkMage_Soul : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/SoulTest/Test_SkMage_Soul_AnimBP.Test_SkMage_Soul_AnimBP_C'";
	
   // TURNS
   default m_TurnsData = UTurnsData_Skeleton;
   //

    // HITS
    default m_HitsData = UHitData_Skeleton;
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Test_SkMage_Soul_Combat : UWeaponMeleeItemAnimConfig
{
    // default m_SocketName = n"weapon_r";
    // default m_SocketDrawName = n"weapon_r";
    
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/SoulTest/Test_SkMage_Soul_AnimBP_Combat.Test_SkMage_Soul_AnimBP_Combat_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Skeleton;
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Skeleton;

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Test_SkMage_Soul_Attack;
    //

	// HITS
    default m_HitsData = UHitData_Skeleton;
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Skeleton;
    //
}

UCLASS()
class UAnimConfig_Test_SkMage_Soul : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature;

	default m_IKConfig = UIKConfig_Biped_Generic;

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Test_SkMage_Soul);

    default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Test_SkMage_Soul_Combat);
}

// --- AnimCongif End

UCLASS()
class UGameplayAbility_SkMage_Test_Soul : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutineSkMage_Test_Soul;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_SkMage_Test_Soul);
}

class UDailyRoutineSkMage_Test_Soul : UAIState_DailyRoutine_Creature
{
}

//// ------------------------------------------------------------------------------------


UCLASS()
class UAIState_Combat_SkMage_Test_Soul : UAIState_Combat_Creature
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_SkMage_Test_Soul);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 80.0f;
        EnemyCombatDistance = 5000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.01f;
        Config.ReactToAttackFrontDodgeChance = 0.01f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////

    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_Positioning());

    ///// TESTING /////
    default CustomTestingBehavior.MediumPriorityTree
        .DoNode(UCBT_Tree_Wait());
    
    ////////////////////

    void TestConfigValues() override
    {
    }

    FString GetDisplayName() const override
    {
        return "SKMage_Test_Soul";
    }
}

UCLASS()
class UWeaponBehaviorSet_SkMage_Test_Soul_Observer : UCombatBehaviorSet_Observer
{
    void SetupConfigValues() override
    {
        Combat.Config.PreferredDistance = 500.0f;
    }
}

UCLASS()
class UWeaponBehaviorSet_SkMage_Test_Soul : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    // default Roles.Remove(ECombatRole::PassiveAttacker);
    default BaseRoleSlotSize = 0.01f;
    // default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    FAttackInfo AttackSpecial = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        40.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackSpecial);
    ///////////////////

    // BEHAVIORS ///////    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    // default Behavior_MediumPriority()
    //             .AttackTree()
    //                 .AddAttack(AttackSpecial)
    //                 .SetTreeCooldown("Attack", 1.0f);

    /// BASE MOVEMENT
    default Behavior_Movement()
            .DoNode(UCBT_Tree_CalculatePreferredPositionAndMoveToItIfTooFarFromTarget());
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(50.0f))
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 500.0f;
        Combat.EnemyLungeDistance = 700.0f;

        Combat.Config.PreferredDistance = 10.0f;
        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::CloserThan;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_SkMage_Test_Soul : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_SkMage_Test_Soul_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_SkMage_Test_Soul);
}