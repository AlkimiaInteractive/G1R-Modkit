UCLASS()
class UWeaponBehaviorSet_Orc_S1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);

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

    FAttackInfo AttackLeftBottom = FAttackInfo(
        UCM_AttackSCombo_LeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftBottom);

    FAttackInfo AttackRightTop = FAttackInfo(
        UCM_AttackSCombo_RightTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightTop);

    FAttackInfo AttackRightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeftTop);

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

    FAttackInfo AttackSpc_B_R02 = FAttackInfo(
        UCM_AttackSCombo_BottomRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackSpc_B_R02);


    // BEHAVIORS ///////
    default Behavior_MediumPriority()
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
                .AddAttack(AttackSpc_B_R02)
                .AddTreeCooldown("Attack", 9.0f)
                .AddRequirement(UCS_EnemyCloserThan(700.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackRightLeftTop)
                .AddAttack(AttackLeftBottom)
                .AddAttack(AttackRightTop)
                .AddAttack(AttackLeftRightLeft)
                .AddTreeCooldown("Attack_Main", 2.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackLeft)
    //             .AddAttack(AttackLeftRightLeft)
    //             .AddAttack(AttackLeftRightLeft)
    //             .AddTreeCooldown("Attack_Main", 4.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // MOVEMENT
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_Positioning_Strafer())
    //     .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}