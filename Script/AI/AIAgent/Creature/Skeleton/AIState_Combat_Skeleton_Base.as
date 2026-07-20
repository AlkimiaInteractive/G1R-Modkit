UCLASS(Abstract)
class UAIState_Combat_Skeleton_Base : UAIState_Combat_Humanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);

    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.5f;
    default Config.PositioningValuesSizeMultiplier = 1.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Skeleton - Creature Combat";
    }

    bool ShouldStrafe() override
    {
        // Don't strafe when no target or target not visible
        if (!IsValid(CharacterOfInterest) || !Self.Perception.CanSee(CharacterOfInterest))
            return false;

        if (!CharacterState.Character.IsWalkSpeedWalking())
            return false;

        return true;
    }
}

UCLASS(Abstract)
class UWeaponBehaviorSet_Skeleton_Melee_Base : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Orc);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_TwoHand);

    float32 Cooldown_BottomAttack = 5.0f;
    float32 Cooldown_MainMelee = 3.0f;
    float32 Cooldown_Finisher = 3.0f;
    float32 Cooldown_PassiveMelee = 10.0f;

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        300.0f,
        InMinRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackCombo_BottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        300.0f,
        InMinRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_BottomRight);

    FAttackInfo AttackCombo_BottomLeft = FAttackInfo(
        UCM_AttackCCombo_BottomLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        300.0f,
        InMinRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_BottomLeft);
    ///////////////////

    // // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Bottom Attack")
                .AddAttack(AttackBottomSingle, 2.0f)
                .AddAttack(AttackCombo_BottomRight)
                .AddAttack(AttackCombo_BottomLeft)
                .AddTreeCooldown(CooldownID_ChasingAttack, Cooldown_BottomAttack)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(150.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                //.AddAttack(AttackCombo_LeftRight, 2.0f)
                .AddAttack(AttackCombo_RightLeft, 2.0f)
                .AddAttack(AttackCombo_LeftRightLeft)
                .AddTreeCooldown(CooldownID_MainMelee, Cooldown_MainMelee)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));    
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Passive Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddTreeCooldown(CooldownID_PassiveMelee, Cooldown_PassiveMelee)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    //////////////////

    /// MOVEMENT
    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .SetTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));    

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UWeaponBehaviorSet_Skeleton_Melee_Swim : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Swimming);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_WaterWalking);

    float32 Cooldown_BottomAttack = 5.0f;
    float32 Cooldown_MainMelee = 3.0f;
    float32 Cooldown_Finisher = 3.0f;
    float32 Cooldown_PassiveMelee = 10.0f;

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo Water_Attack = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(Water_Attack);
    ///////////////////

    // // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Main Water")
                .AddAttack(Water_Attack)
                .AddTreeCooldown(CooldownID_MainMelee, Cooldown_MainMelee)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));    
    
    //////////////////

    /// MOVEMENT
    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .SetTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));    

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS(Abstract)
class UWeaponBehaviorSet_Skeleton_Bow_Base : UWeaponBehaviorSet_Ranged
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Bow);

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::FartherThan;

        // GROUNDED STRAFER RANGED CONFIG VALUES
        Combat.EnemyTooCloseDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        Combat.EnemyCloseDistance = Combat.Config.PositioningValuesSizeMultiplier * 400.0f;
        Combat.EnemyLungeDistance = Combat.Config.PositioningValuesSizeMultiplier * 500.0f;
        Combat.EnemyCombatDistance = Combat.Config.PositioningValuesSizeMultiplier * 3000.0f;

        Combat.Positioning.MinimumPositionDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        
        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Combat.Positioning.MinimumPositionDistance = 30.0f;
            Combat.Config.PreferredDistance = Combat.Config.PositioningValuesSizeMultiplier * 550.0f;
        }
        else if (Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Combat.Positioning.MinimumPositionDistance = 150.0f;
            Combat.Config.PreferredDistance = Combat.Config.PositioningValuesSizeMultiplier * 650.0f;
        }
    }

    // ATTACKS /////////
    FAttackInfo AimedShotsMultiple = FAttackInfo(
        UCM_AimedShots(2.0f, 3), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 200.0f,
        InMaxRange = 3000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AimedShotsMultiple);

    FAttackInfo AimedShotsSingle = FAttackInfo(
        UCM_AimedShots(2.0f, 1), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 200.0f,
        InMaxRange = 3000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AimedShotsSingle);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Multiple Aimed Shots")
                    .AddAttack(AimedShotsMultiple)
                    .AddTreeCooldown("AimedShot", UNodeCooldownCalculation_WeaponSkillLevel(3.0f))
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Single Shot")
                    .AddAttack(AimedShotsSingle)
                    .AddTreeCooldown("AimedShot", UNodeCooldownCalculation_WeaponSkillLevel(5.0f))
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    ///// MOVEMENT /////
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UWeaponBehaviorSet_Skeleton_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    FString GetDisplayName() const override
    {
        return "Skeleton - Creature Combat";
    }

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 0.01f)
    //             .SetTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}