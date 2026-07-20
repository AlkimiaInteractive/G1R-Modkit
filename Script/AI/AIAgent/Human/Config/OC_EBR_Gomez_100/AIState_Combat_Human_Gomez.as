UCLASS()
class UAIState_Combat_Human_Gomez : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    /// Behavior Sets
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Observer);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Gomez);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Melee);

    default bTauntsEnabled = true;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        // Distances common to all roles and weapons
        EnemyTooCloseDistance = 5.0f;

        Config.bUseWeaponSkillLevels = true;

        Config.ReactToAttackBackDodgeChance_Master = 0.5f;

        Config.ReactiveBlockingChance_Master = 0.5f;
        Config.ReactToAttackFrontDodgeChance_Master = 0.5f;
    }

    // BEHAVIORS ///////
    /// MAIN ACTIONS //
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    default CommonBehavior_MediumPriority
        .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);
}

UCLASS()
class UWeaponBehaviorSet_Gomez_Main : UWeaponBehaviorSet_Melee_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default BaseRoleSlotSize = 2.0f;
    default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    // Top starter combos
    FAttackInfo AttackCombo_TopBottom = FAttackInfo(
        UCM_AttackCCombo_TopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottom);

    FAttackInfo AttackCombo_TopLeftRight = FAttackInfo(
        UCM_AttackCCombo_TopLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopLeftRight);

    // Left starter combos
    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo AttackCombo_LeftRightBottom = FAttackInfo(
        UCM_AttackCCombo_LeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRightBottom);

    FAttackInfo AttackCombo_RightTopLeft = FAttackInfo(
        UCM_AttackCCombo_RightTopLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightTopLeft);

    // Right starter combos
    FAttackInfo AttackCombo_RightBottom = FAttackInfo(
        UCM_AttackCCombo_RightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightBottom);

    FAttackInfo AttackCombo_RightLeftBottom = FAttackInfo(
        UCM_AttackCCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeftBottom);

    FAttackInfo AttackCombo_LeftTopBottom = FAttackInfo(
        UCM_AttackCCombo_LeftTopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftTopBottom);
    
    // Special attacks
    FAttackInfo AttackAreaFront = FAttackInfo(
        UCM_Attack_Extra01(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 250,
        InMinRange = 100,
        bInMaxRangeOverride = true);
    default AddAttack(AttackAreaFront);

    // FAttackInfo AttackGuardStrike = FAttackInfo(
    //     UCM_Attack_Extra02(), 
    //     EAttackUsageType::Control, 
    //     CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    // default AddAttack(AttackGuardStrike);
    ///////////////////

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamageInSeconds(30.0f, 5.0f), 0.02f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.03f)
                .AddTreeCooldown("Riposte", 3.0f);

    // default Behavior_MediumPriority()
    //         .AttackTree(1.0f, "Guard Strike")
    //             .AddAttack(AttackGuardStrike)
    //             .AddTreeCooldown("Attack_Defensive", 5.0f)
    //             .AddRequirement(UCS_EnemyCloserThan(250.0f))
    //             .AddRequirement(UCS_JustRecoveredFromSuperarmorBreak());

     default Behavior_MediumPriority()
             .AttackTree(2.0f, "Spin Charge")
                 .AddAttack(AttackAreaFront)
                 .AddTreeCooldown("Attack_Special", 10.0f)
                 .AddRequirement(UCS_EnemyFartherThan(200.0f));

     default Behavior_MediumPriority()
             .AttackTree(3.0f, "Top Attacks")
                 .AddAttack(AttackCombo_TopBottom)
                 .AddAttack(AttackCombo_TopLeftRight)
                 .AddTreeCooldown("Attack_Persecutory", 4.0f)
                 .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Main Melee")
                .AddAttack(AttackCombo_LeftRight)
                .AddAttack(AttackCombo_LeftRightBottom)
                .AddAttack(AttackCombo_RightBottom)
                .AddAttack(AttackCombo_RightTopLeft)
                .AddAttack(AttackCombo_LeftTopBottom)
                .AddAttack(AttackCombo_RightLeftBottom)
                .AddTreeCooldown("Attack_Main", 1.0f);
    
    // MOVEMENT
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UWeaponBehaviorSet_Gomez_PassiveEnemy : UCombatBehaviorSet_UseHealingConsumable
{
    default BaseRoleSlotSize = 2.0f;
    default BaseRolePriority = 10.0f;

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamageInSeconds(30.0f, 5.0f), 0.01f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.02f)
                    .AddTreeCooldown("Riposte", 3.0f);
}

UCLASS()
class UWeaponBehaviorSet_Gomez_NotDealingEnoughDamage : UWeaponBehaviorSet_Melee_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default BaseRoleSlotSize = 2.0f;
    default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    // Top starter combos
    FAttackInfo AttackCombo_TopBottom = FAttackInfo(
        UCM_AttackCCombo_TopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottom);

    FAttackInfo AttackCombo_TopLeftRight = FAttackInfo(
        UCM_AttackCCombo_TopLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopLeftRight);

    // Left starter combos
    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo AttackCombo_LeftRightBottom = FAttackInfo(
        UCM_AttackCCombo_LeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRightBottom);

    FAttackInfo AttackCombo_RightTopLeft = FAttackInfo(
        UCM_AttackCCombo_RightTopLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightTopLeft);

    // Right starter combos
    FAttackInfo AttackCombo_RightBottom = FAttackInfo(
        UCM_AttackCCombo_RightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightBottom);

    FAttackInfo AttackCombo_RightLeftBottom = FAttackInfo(
        UCM_AttackCCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeftBottom);

    FAttackInfo AttackCombo_LeftTopBottom = FAttackInfo(
        UCM_AttackCCombo_LeftTopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftTopBottom);
    
    // Special attacks
    FAttackInfo AttackAreaFront = FAttackInfo(
        UCM_Attack_Extra01(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 250,
        InMinRange = 100,
        bInMaxRangeOverride = true);
    default AddAttack(AttackAreaFront);

    // FAttackInfo AttackGuardStrike = FAttackInfo(
    //     UCM_Attack_Extra02(), 
    //     EAttackUsageType::Control, 
    //     CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    // default AddAttack(AttackGuardStrike);
    ///////////////////

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamageInSeconds(30.0f, 5.0f), 0.02f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.03f)
                .AddTreeCooldown("Riposte", 3.0f);

    // default Behavior_MediumPriority()
    //         .AttackTree(1.0f, "Guard Strike")
    //             .AddAttack(AttackGuardStrike)
    //             .AddTreeCooldown("Attack_Defensive", 5.0f)
    //             .AddRequirement(UCS_EnemyCloserThan(250.0f))
    //             .AddRequirement(UCS_JustRecoveredFromSuperarmorBreak());

     default Behavior_MediumPriority()
             .AttackTree(2.0f, "Spin Charge")
                 .AddAttack(AttackAreaFront)
                 .AddTreeCooldown("Attack_Special", 10.0f)
                 .AddRequirement(UCS_EnemyFartherThan(200.0f));

     default Behavior_MediumPriority()
             .AttackTree(3.0f, "Top Attacks")
                 .AddAttack(AttackCombo_TopBottom)
                 .AddAttack(AttackCombo_TopLeftRight)
                 .AddTreeCooldown("Attack_Persecutory", 4.0f)
                 .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Main Melee")
                .AddAttack(AttackCombo_LeftRight)
                .AddAttack(AttackCombo_LeftRightBottom)
                .AddAttack(AttackCombo_RightBottom)
                .AddAttack(AttackCombo_RightTopLeft)
                .AddAttack(AttackCombo_LeftTopBottom)
                .AddAttack(AttackCombo_RightLeftBottom)
                .AddTreeCooldown("Attack_Main", 1.0f);
    
    // MOVEMENT
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.DamageDealtInTheLastSeconds(15.0f) < 30.0f || Combat.Self.GetHealthAttribute() > Combat.Self.GetMaxHealthAttribute() * 0.75f)
            return true;

        Reason = "Already dealing enough damage";
        return false;
    }

    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 180.0f;
        Combat.EnemyLungeDistance = 230.0f;

        Combat.Config.PreferredDistance = 150.0f;

        Combat.Config.bEndCombosOnMiss = false;
        Combat.SetChanceToCloseCombo(3, 1.0f);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Gomez : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Gomez_PassiveEnemy);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Gomez_NotDealingEnoughDamage);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Gomez_Main);
}