UCLASS()
class UWeaponBehaviorSet_Orc_Fists : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Fist);

    // Attacks ///////////////  
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRight);

    FAttackInfo AttackLeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRight);

    FAttackInfo AttackRightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeft);

     FAttackInfo AttackTopRight = FAttackInfo(
        UCM_AttackSCombo_TopRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackTopRight);

    FAttackInfo AttackLeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRightLeft);

    FAttackInfo AttackLeftRightTop = FAttackInfo(
        UCM_AttackSCombo_LeftRightTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRightTop);

    FAttackInfo AttackRightLeftBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeftBottom);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Extra02(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottom);


    // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(130.0f,10.0f)
            .AddTreeCooldown("Dodge", 3.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackBottom)
                .AddTreeCooldown("Attack", 4.0f)
                .AddRequirement(UCS_EnemyFartherThan(300.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackLeftRight)
                .AddAttack(AttackRightLeft)
                // .AddAttack(AttackTopRight)
                .AddAttack(AttackLeftRightLeft)
                .AddAttack(AttackRightLeftBottom)
                .AddAttack(AttackLeftRightTop)
                .AddTreeCooldown("Attack_Main", 1.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackLeft)
    //             .AddAttack(AttackRight)
    //             .AddTreeCooldown("Attack_Main", 4.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}