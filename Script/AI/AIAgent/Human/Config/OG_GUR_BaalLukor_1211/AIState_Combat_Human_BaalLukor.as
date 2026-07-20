UCLASS()
class UAIState_Combat_Human_BaalLukor : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    /// Behavior Sets
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Items);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Observer);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_BaalLukor);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Melee);

    default bTauntsEnabled = true;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        // Distances common to all roles and weapons
        EnemyTooCloseDistance = 5.0f;
        EnemyCombatDistance = 750.0f;

        Config.bUseWeaponSkillLevels = true;

        Config.ReactToAttackBackDodgeChance_Master = 0.5f;

        Config.ReactiveBlockingChance_Master = 0.33f;
        Config.ReactToAttackFrontDodgeChance_Master = 0.5f;
    }

    // BEHAVIORS ///////
    /// MAIN ACTIONS //
    default CommonBehavior_MediumPriority
        .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);    

    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
}

UCLASS()
class UWeaponBehaviorSet_BaalLukor_Main : UWeaponBehaviorSet_Melee_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default BaseRoleSlotSize = 2.0f;
    default BaseRolePriority = 10.0f;

// ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackCombo_RightLeftRight = FAttackInfo(
        UCM_AttackSCombo_RightLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftRight);

    FAttackInfo AttackCombo_RightLeftBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftBottom);

    FAttackInfo AttackCombo_LeftTopBottom = FAttackInfo(
        UCM_AttackSCombo_LeftTopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTopBottom);

    FAttackInfo AttackCombo_TopBottom = FAttackInfo(
        UCM_AttackSCombo_TopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottom);

    FAttackInfo AttackCombo_TopRightLeft = FAttackInfo(
        UCM_AttackSCombo_TopRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopRightLeft);

    FAttackInfo AttackCombo_RightTopLeft = FAttackInfo(
        UCM_AttackSCombo_RightTopLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightTopLeft);

    FAttackInfo AttackCombo_RightTopRight = FAttackInfo(
        UCM_AttackSCombo_RightTopRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightTopRight);

    FAttackInfo AttackCombo_TopRightTop = FAttackInfo(
        UCM_AttackSCombo_TopRightTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightTopRight);

    FAttackInfo AttackCombo_TopLeftTop = FAttackInfo(
        UCM_AttackSCombo_TopLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopLeftTop);

    FAttackInfo AttackCombo_RightBottom = FAttackInfo(
        UCM_AttackSCombo_RightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightBottom);
    ///////////////////

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(0.3f, 7.0f), 0.02f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.03f)
                    .AddTreeCooldown("Riposte", 3.0f);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Top Attack")
                    .AddAttack(AttackCombo_TopRightLeft)
                    .AddAttack(AttackCombo_TopBottom)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 4.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_RightLeftRight)
                    .AddAttack(AttackCombo_LeftTopBottom)
                    .AddAttack(AttackCombo_RightLeftBottom)
                    .AddAttack(AttackCombo_RightTopLeft)
                    .AddAttack(AttackCombo_RightTopRight)
                    .AddAttack(AttackCombo_TopRightTop)
                    .AddAttack(AttackCombo_TopLeftTop)
                    .AddAttack(AttackCombo_RightBottom)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
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

        return true;
    }
}

UCLASS()
class UCombatBehaviorSet_BaalLukor_Magic : UCombatBehaviorSet_Human_Magic
{
    
}

UCLASS()
class UCombatBehaviorSetPackage_BaalLukor : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_BaalLukor_Main::StaticClass());
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_BaalLukor_Magic::StaticClass());
}