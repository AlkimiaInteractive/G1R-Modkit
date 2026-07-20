/** */
UCLASS()
class UAIState_Combat_CorKalomDemon_Sleeper : UAIState_Combat_Demon
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_CorKalom_Sleeper::StaticClass());

    FString GetDisplayName() const override
    {
        return "Fire Demon - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_CorKalomDemon_Sleeper : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);

    // ATTACKS /////////
    FAttackInfo AttackRightCombo = FAttackInfo(
        UCM_AttackCCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 0.0f);
    default AddAttack(AttackRightCombo);

    FAttackInfo AttackLeftCombo = FAttackInfo(
        UCM_AttackCCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
        //InMinRange = 0.0f);
    default AddAttack(AttackLeftCombo);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        880.0f,
        //400.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);

    FAttackInfo AttackHellArmsBreach = FAttackInfo(
        UCM_Attack_CorKalomDemon_Sleeper_HellArms_Breach(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        //InMinRange = 400.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(AttackHellArmsBreach);

    FAttackInfo AttackExplosion = FAttackInfo(
        UCM_Attack_CorKalomDemon_Sleeper_Explosion(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        400.0f,
        InMinRange = 0,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(AttackExplosion);

    FAttackInfo AttackPyroLaser = FAttackInfo(
        UCM_Attack_Demon_Fire_Laser(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        //5000.0f,
        InMinRange = 900.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);

    FAttackInfo AttackPyroLaserCR = FAttackInfo(
        UCM_Attack_Demon_Fire_Laser(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        //5000.0f,
        InMinRange = 0.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
        
    default AddAttack(AttackPyroLaserCR);

    // FAttackInfo TestTaunt = FAttackInfo(
    //     UCM_Attack_Demon_TauntTest(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet());
    //     // 5000.0f,
    //     // InMinRange = 1000.0f,
    //     // bInMaxRangeOverride = true);
        
    //default AddAttack(AttackFireballL);

    // FAttackInfo AttackFireballR = FAttackInfo(
    //     UCM_Attack_Demon_Fire_Fireball_R(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     5000.0f,
    //     InMinRange = 1000.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(AttackFireballR);
    ///////////////////

    /// NORMAL MOVESET
    default Behavior_MediumPriority()
        .AttackTree(0.0f, "Explosion")
            .AddAttack(AttackExplosion)
            .AddTreeCooldown("Attack_Explosion", 0.0f)
            //.AddRequirement(UCS_IsDamageReceivedInLastSecondsHigherThanPercent(1.0f,10.0f))
            .AddRequirement(UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(2,5.0f))
            .AddRequirement(UCS_EnemyInsideDistanceRange(0, 400));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Explosion")
                .AddAttack(AttackExplosion)
                .AddTreeCooldown("Attack_Explosion", 10.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(0, 400));

     default Behavior_MediumPriority()
        .AttackTree(0.0f, "Laser")
            //.AddAttack(AttackFireballR)
            .AddAttack(AttackPyroLaser)
            .AddTreeCooldown("Attack_Laser", 10.0f)
            .AddRequirement(UCS_EnemyInsideDistanceRange(900, MAX_flt)); // if target is farther than min range

    default Behavior_MediumPriority()
        .AttackTree(2.0f, "Melee")
            .AddAttack(AttackRightCombo)
            .AddAttack(AttackLeftCombo)
            .AddTreeCooldown("Attack_Test", 1.0f)
            .AddRequirement(UCS_EnemyCloserThan(400.0f)); 

    default Behavior_MediumPriority()
        .AttackTree(3.0f, "Arms")
            .AddAttack(AttackHellArmsBreach)
            .AddTreeCooldown("Attack_HellArms", 10.0f)
            .AddRequirement(UCS_EnemyInsideDistanceRange(400, MAX_flt)); // if target is farther than min range

    default Behavior_MediumPriority()
        .AttackTree(4.0f, "Charge")
            .AddAttack(ChargeAttack)
            .AddTreeCooldown("Attack_Charge", 7.0f)
            .AddRequirement(UCS_EnemyInsideDistanceRange(400, 1200)); // if target is farther than min range

     default Behavior_MediumPriority()
        .AttackTree(6.0f, "outnavLaser")
            //.AddAttack(AttackFireballR)
            .AddAttack(AttackPyroLaserCR)
            .AddTreeCooldown("Attack_Laser_outnav", 5.0f)
            .AddRequirement(UCS_EnemyInsideDistanceRange(0, MAX_flt)); // if target is farther than min range

        // default Behavior_MediumPriority()
        // .AttackTree(5.0f, "Armsoutnav")
        //     .AddAttack(AttackHellArmsBreach)
        //     .AddTreeCooldown("Attack_HellArms_outnav", 12.0f)
        //     .AddRequirement(UCS_EnemyInsideDistanceRange(0, MAX_flt)); // if target is farther than min range

    
    /// BASE MOVEMENT
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());

    void SetupConfigValues() override
    {        
        Combat.EnemyTooCloseDistance = 50.0f;
        Combat.EnemyCloseDistance = 600.0f;
        Combat.EnemyLungeDistance = 700.0f;
        Combat.Config.PreferredDistance = 550.0f;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_CorKalom_Sleeper : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_CorKalomDemon_Sleeper::StaticClass());
}

////----- OLD ATTACKS CONFIGS:

// // ATTACKS /////////
//     FAttackInfo AttackHellArmsRing = FAttackInfo(
//         UCM_Attack_FireDemon_HellArms_Ring(), 
//         EAttackUsageType::Control, 
//         CombatScriptRoleSets::GetAttackerRoleSet(), 
//         3000.0f);
//     default AddAttack(AttackHellArmsRing);

//     FAttackInfo AttackRightCombo = FAttackInfo(
//         UCM_AttackCCombo_RightLeftTop(), 
//         EAttackUsageType::Regular, 
//         CombatScriptRoleSets::GetAttackerRoleSet());
//     default AddAttack(AttackRightCombo);

//     FAttackInfo AttackLeftCombo = FAttackInfo(
//         UCM_AttackCCombo_LeftTop(), 
//         EAttackUsageType::Regular, 
//         CombatScriptRoleSets::GetAttackerRoleSet());
//     default AddAttack(AttackLeftCombo);

//     FAttackInfo ChargeAttack = FAttackInfo(
//         UCM_Attack_Bottom(), 
//         EAttackUsageType::Control, 
//         CombatScriptRoleSets::GetAttackerRoleSet(), 
//         1000.0f);
//     default AddAttack(ChargeAttack);

//     FAttackInfo Explosion = FAttackInfo(
//         UCM_Attack_FireDemon_Explosion(), 
//         EAttackUsageType::Control, 
//         CombatScriptRoleSets::GetAttackerRoleSet(), 
//         500.0f);
//     default AddAttack(Explosion);

//     FAttackInfo AttackHellArmsBreach = FAttackInfo(
//         UCM_Attack_FireDemon_HellArms(), 
//         EAttackUsageType::Regular, 
//         CombatScriptRoleSets::GetAttackerRoleSet(), 
//         3000.0f);
//     default AddAttack(AttackHellArmsBreach);

//     FAttackInfo AttackFlamebreath = FAttackInfo(
//         // UCM_Attack_FireDemon_Flamethrower(), 
//         UCM_Attack_Extra02(), 
//         EAttackUsageType::Regular, 
//         CombatScriptRoleSets::GetAttackerRoleSet(), 
//         2000.0f);
//     default AddAttack(AttackFlamebreath);