/** */
UCLASS()
class UAIState_Combat_Demon_Lord : UAIState_Combat_Demon
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Demon_Lord::StaticClass());

    FString GetDisplayName() const override
    {
        return "Fire Demon - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Demon_Lord : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);

    // ATTACKS /////////
    FAttackInfo AttackRightCombo = FAttackInfo(
        UCM_AttackCCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightCombo);

    FAttackInfo AttackLeftCombo = FAttackInfo(
        UCM_AttackCCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftCombo);

    float ChargeMinRange = 500.0f;
    float ChargeMaxRange = 1000.0f;
    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Charge, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1000.0f,
        500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);

    FAttackMoveData SpecialFlamebreathAttack;
    FGameplayTag FlamebreathAttackTag = GameplayTag::Combat_Attack_Extra01;
    float FlamebreathMinRange = 250.0f;
    float FlamebreathMaxRange = 400.0f;
    FAttackInfo AttackFlamethrower = FAttackInfo(
        UCM_Attack_Demon_Lord_Flamethrower(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        400.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackFlamethrower);

    FAttackInfo AttackHellArmsBreach = FAttackInfo(
        UCM_Attack_Demon_Lord_HellArms_Breach(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        InMinRange = 400.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackHellArmsBreach);

    /*float FirewallMinRange = 300.0f;
    float FirewallMaxRange = 650.0f;
    FAttackInfo AttackFireWall = FAttackInfo(
        UCM_Attack_FireDemon_FireWall(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        FirewallMaxRange,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackFireWall);*/
    ///////////////////

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_CancelAttackIfNotInDistanceRangeOrNotFacingEnemy(FlamebreathAttackTag), 0.01f);

    default Behavior_MediumPriority()
            .AttackTree(0.0f, "Flame Start")
                .AddAttack(AttackFlamethrower)
                .AddTreeCooldown("Attack_Flamethrower", 6.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(FlamebreathMinRange, FlamebreathMaxRange));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Arms")
            .AddAttack(AttackHellArmsBreach)
            .AddTreeCooldown("Attack_HellArms", 16.0f)
            .AddRequirement(UCS_EnemyFartherThan(400));

    // default Behavior_MediumPriority()
    //         .AttackTree(2.0f, "Charge")
    //             .AddAttack(ChargeAttack)
    //             .SetTreeCooldown("Attack_Lunge", 3.5f)
    //             .AddRequirement(UCS_EnemyFartherThan(ChargeMinRange));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Melee")
                .AddAttack(AttackLeftCombo)
                .AddAttack(AttackRightCombo)
                .AddTreeCooldown("Attack_Main", 2.5f);

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UCombatBehaviorSetPackage_Demon_Lord : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Demon_Lord::StaticClass());
}