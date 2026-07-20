UCLASS()
class UAIState_Combat_Sleeper_Gorn : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_SleeperTest_Gorn::StaticClass());

    float32 TauntCooldown = 5.0f;

    // Cooldown timers local variables

    void DefaultConfigValues() override
    {
        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    default CommonBehavior_MediumPriority
        .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);

    FString GetDisplayName() const override
    {
        return "SleeperTest_Gorn - Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Melee_Gorn : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);

    // ATTACKS /////////
    FAttackInfo SleeperAreaAttack = FAttackInfo(
        UCM_Attack_Extra01(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        5000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(SleeperAreaAttack);

    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackCombo_LeftTop = FAttackInfo(
        UCM_AttackCCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTop);

    FAttackInfo AttackCombo_RightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftTop);

    FAttackInfo AttackCombo_LeftRightBottom = FAttackInfo(
        UCM_AttackSCombo_LeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightBottom);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackCombo_LeftRightLeftTop = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeftTop);

    FAttackInfo AttackCombo_RightLeftRightBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeftTop);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomSingle);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(0.3f, 7.0f), 0.02f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.03f)
                    .AddTreeCooldown("Riposte", 3.0f);
                    
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Electrified Area Attack")
                    .AddAttack(SleeperAreaAttack)
                    .AddTreeCooldown("SleeperAreaAttack", 7.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_SelfHasTag(GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn));
                    // .AddRequirement(UCS_EnemyInsideDistanceRange(10.0f, 5000.0f)); //To test

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Bottom Attack")
                    .AddAttack(AttackBottomSingle)
                    .AddTreeCooldown("Persecutory", 5.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(250.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Main Melee")
                    .AddAttack(AttackTopSingle)
                    .AddAttack(AttackCombo_LeftTop)
                    .AddAttack(AttackCombo_RightLeftTop)
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_LeftRightBottom)
                    .AddAttack(AttackCombo_LeftRightLeftTop)
                    .AddAttack(AttackCombo_RightLeftRightBottom)
                    .AddTreeCooldown("Main", 3.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_SleeperTest_Gorn : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Melee_Gorn);
}
