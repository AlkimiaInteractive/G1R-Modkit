UCLASS()
class UWeaponBehaviorSet_Orc_M1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_TwoHand);

    // Attacks ///////////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackLeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRightLeft);

    FAttackInfo AttackLeftTop = FAttackInfo(
        UCM_AttackSCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftTop);

    FAttackInfo AttackRightBottom = FAttackInfo(
        UCM_AttackSCombo_RightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightBottom);

    FAttackInfo AttackRightLeftBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeftBottom);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottom);

    FAttackInfo AttackTop = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackTop);

    FAttackInfo AttackSpc_B_B02 = FAttackInfo(
        UCM_AttackSCombo_BottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackSpc_B_B02);


    // BEHAVIORS ///////
    default Behavior_LowPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(130.0f,10.0f)
            .AddTreeCooldown("Dodge", 2.0f));
            
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackBottom)
                .AddAttack(AttackTop)
                .AddTreeCooldown("Attack_bot", 2.5f)
                .AddRequirement(UCS_EnemyCloserThan(200.0f));
    
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackSpc_B_B02)
                .AddTreeCooldown("Attack", 9.0f)
                .AddRequirement(UCS_EnemyCloserThan(700.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackLeftTop)
                .AddAttack(AttackRightBottom)
                .AddAttack(AttackRightLeftBottom)
                .AddAttack(AttackLeftRightLeft)
                .AddTreeCooldown("Attack_Main", 3.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackLeft)
    //             .AddAttack(AttackLeftRightLeft)
    //             .AddAttack(AttackLeftRightLeft)
    //             .AddTreeCooldown("Attack_Main", 4.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}