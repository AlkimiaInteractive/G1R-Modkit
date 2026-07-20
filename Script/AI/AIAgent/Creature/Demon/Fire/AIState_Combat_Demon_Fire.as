/** */
UCLASS()
class UAIState_Combat_Demon_Fire : UAIState_Combat_Demon
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Demon_Fire::StaticClass());

    FString GetDisplayName() const override
    {
        return "Fire Demon - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Demon_Fire : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

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
        EAttackUsageType::Control, 
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
        UCM_Attack_FireDemon_Flamethrower(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        400.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackFlamethrower);

    float FirewallMinRange = 300.0f;
    float FirewallMaxRange = 650.0f;
    FAttackInfo AttackFireWall = FAttackInfo(
        UCM_Attack_FireDemon_FireWall(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        FirewallMaxRange,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackFireWall);
    ///////////////////

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_CancelAttackIfNotInDistanceRangeOrNotFacingEnemy(FlamebreathAttackTag), 0.01f);

   default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 1.5f))
                .AddTreeCooldown("Dodge",2.0f);

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Flamethrower")
                .AddAttack(AttackFlamethrower)
                .AddTreeCooldown("Attack_Flamethrower", 12.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(FlamebreathMinRange, FlamebreathMaxRange));
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Firewall")
                .AddAttack(AttackFireWall)
                .AddTreeCooldown("Attack_FireWall", 15.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(FirewallMinRange, FirewallMaxRange)); // If target is far away but inside AOE
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Charge")
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Lunge", 6.0f)
                .AddRequirement(UCS_EnemyFartherThan(ChargeMinRange));
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Main Melee")
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
class UCombatBehaviorSetPackage_Demon_Fire : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Demon_Fire::StaticClass());
}