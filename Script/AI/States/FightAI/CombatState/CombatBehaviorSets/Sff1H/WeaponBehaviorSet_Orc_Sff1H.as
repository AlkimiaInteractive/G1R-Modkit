UCLASS()
class UAIState_Combat_Orc_Sff1H : UAIState_Combat_Orc_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Orc_Sff1H::StaticClass());

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 700.0f;
        EnemyCombatDistance = 1200.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    FString GetDisplayName() const override
    {
        return "Combat - Orc Shaman - Sff1H";
    }

    // default CommonBehavior_Movement
    //     .DoNode(UCBT_MoveToDoSelectedAttack());
}


UCLASS()
class UWeaponBehaviorSet_Orc_Sff1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);

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
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightTop);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottom);


    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackBottom)
                .AddTreeCooldown("Attack", 6.0f)
                .AddRequirement(UCS_EnemyCloserThan(200.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                //.AddAttack(AttackRightTop)
                .AddAttack(AttackLeftBottom)
                .AddAttack(AttackLeftRightLeft)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackLeft)
    //             .AddAttack(AttackLeftRightLeft)
    //             .AddTreeCooldown("Attack_Main", 4.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());

    // default Behavior_MediumPriority()
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(130.0f,10.0f)
    //         .AddTreeCooldown("Dodge", 2.0f));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Orc_Sff1H : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_Sff1H::StaticClass());
}