UCLASS()
class UAIState_Combat_Harpy : UAIState_Combat_Creature_StrafingFlyer
{
    // default AssessmentModuleClass = nullptr;
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Harpy);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    //float32 TauntCooldown = 5.0f;

    default Config.PositioningValuesSizeMultiplier = 1.0f;

    default RequiredHeightRelativeToTarget_ActiveAttacker     = 100.0f;
    default RequiredHeightRelativeToTarget_PassiveAttacker    = 120.0f;
    default RequiredHeightRelativeToTarget_Observer           = 200.0f;

    default RequiredHeightRelativeToGround_ActiveAttacker     = 100.0f;
    default RequiredHeightRelativeToGround_PassiveAttacker    = 120.0f;
    default RequiredHeightRelativeToGround_Observer           = 200.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        //Config.PreferredDistance = 500;
        EnemyCombatDistance = 1500.0f;
        EnemyCloseDistance = 200;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////

    // default CommonBehavior_HighPriority
    //     .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    FString GetDisplayName() const override
    {
        return "Harpy - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Harpy_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Harpy - Creature Combat";
    }
    
    default TauntCooldown_Base = 1.0f;
    default TauntCooldown_General = 1.0f;

    float ChargeMaxRange = 1200.0f;
    float ChargeMinRange = 1000.0f;
    float ChargeMaxRelativeHeight = 450.0f;
    float ChargeMinRelativeHeight = 360.0f;
    FAttackInfo ChargeAttackObserver = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Charge, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        ChargeMaxRange,
        ChargeMinRange,
        ChargeMaxRelativeHeight,
        ChargeMinRelativeHeight,
        bInRequiresSpecificRelativeHeight = true,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = true);
    default AddAttack(ChargeAttackObserver);

    /*default Behavior_MediumPriority()
        .AttackTree(2.0f, "ChargeOb")
            .AddAttack(ChargeAttackObserver)
            .AddTreeCooldown("ChargeOb", 20.0f);
            //.AddRequirement(UCS_EnemyFartherThan(ChargeMinRange));*/

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer_Flyer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UWeaponBehaviorSet_Harpy : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw_Flying);

    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.0f;
    default TauntCooldown_General = 1.0f;

    // ATTACKS /////////
    float ThrowMaxRange = 900.0f;
    float ThrowMinRange = 270.0f;
    float ThrowMaxRelativeHeight = 500.0f;
    float ThrowMinRelativeHeight = 100.0f;
    FAttackInfo ThrowAttack = FAttackInfo(
        UCM_Attack_Harpy_Ranged(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        ThrowMaxRange,
        ThrowMinRange,
        ThrowMaxRelativeHeight,
        ThrowMinRelativeHeight,
        bInRequiresSpecificRelativeHeight = true,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(ThrowAttack);

    float MeleeMaxRelativeHeight = 70.0f;
    float MeleeMinRelativeHeight = -30.0f;
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
       // InMinRange = 200,
        InMaxRange = 300,
        InMaxRelativeHeight = MeleeMaxRelativeHeight,
        InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false,
        bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        //InMinRange = 200,
        InMaxRange = 300,
        InMaxRelativeHeight = MeleeMaxRelativeHeight,
        InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,
        bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackLeftSingle);

    float ChargeMaxRange = 1200.0f;
    float ChargeMinRange = 400.0f;
    float ChargeMaxRelativeHeight = 450.0f;
    float ChargeMinRelativeHeight = 360.0f;
    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Charge, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        ChargeMaxRange,
        ChargeMinRange,
        ChargeMaxRelativeHeight,
        ChargeMinRelativeHeight,
        bInRequiresSpecificRelativeHeight = true,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = true);
    default AddAttack(ChargeAttack);


    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .AttackTree(2.0f, "Throw Feathers")
            .AddAttack(ThrowAttack)
            .AddTreeCooldown("Throw", 6.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
            //.AddRequirement(UCS_EnemyFartherThan(ThrowMinRange));

    default Behavior_MediumPriority()
        .AttackTree(3.0f, "Charge")
            .AddAttack(ChargeAttack)
            .AddTreeCooldown("Charge", 10.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
            .AddRequirement(UCS_EnemyFartherThan(250));

     default Behavior_MediumPriority()
        .AttackTree(1.0f, "Melee")
            .AddAttack(AttackRightSingle,50.0f)
            .AddAttack(AttackLeftSingle,50.0f)
            .AddRequirement(UCS_EnemyCloserThan(300.0f))
            .AddTreeCooldown("MeleePrio", 15.0f);

    default Behavior_MediumPriority()
        .AttackTree(4.0f, "Melee")
            .AddAttack(AttackRightSingle,50.0f)
            .AddAttack(AttackLeftSingle,50.0f)
            .AddRequirement(UCS_EnemyCloserThan(600.0f))
            .AddTreeCooldown("Melee", 2.5f);

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer_Flyer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Harpy_Grounded : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw_Grounded);

    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.0f;
    default TauntCooldown_General = 1.0f;

    // ATTACKS /////////
    // float ThrowMaxRange = 900.0f;
    // float ThrowMinRange = 400.0f;
    // float ThrowMaxRelativeHeight = 250.0f;
    // float ThrowMinRelativeHeight = 180.0f;
    // FAttackInfo ThrowAttack = FAttackInfo(
    //     UCM_Attack_Harpy_Ranged(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     ThrowMaxRange,
    //     ThrowMinRange,
    //     ThrowMaxRelativeHeight,
    //     ThrowMinRelativeHeight,
    //     bInRequiresSpecificRelativeHeight = true,
    //     bInRequiresPathToTarget = false,
    //     bInMaxRangeOverride = true);
    // default AddAttack(ThrowAttack);

    float MeleeMaxRelativeHeight = 70.0f;
    float MeleeMinRelativeHeight = 30.0f;
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
       // InMinRange = 200,
        // InMaxRange = 300,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        // bInMaxRangeOverride = true,
        // bInRequiresPathToTarget = false,
        // bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
        // //InMinRange = 200,
        // InMaxRange = 300,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        // bInMaxRangeOverride = true,
        // bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackLeftSingle);

    // float ChargeMaxRange = 1200.0f;
    // float ChargeMinRange = 900.0f;
    // float ChargeMaxRelativeHeight = 450.0f;
    // float ChargeMinRelativeHeight = 360.0f;
    // FAttackInfo ChargeAttack = FAttackInfo(
    //     UCM_Attack_Bottom(), 
    //     EAttackUsageType::Charge, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     ChargeMaxRange,
    //     ChargeMinRange,
    //     ChargeMaxRelativeHeight,
    //     ChargeMinRelativeHeight,
    //     bInRequiresSpecificRelativeHeight = true,
    //     bInMaxRangeOverride = true,
    //     bInRequiresPathToTarget = true);
    // default AddAttack(ChargeAttack);


    ///////////////////

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .AttackTree(1.0f, "Throw Feathers")
    //         .AddAttack(ThrowAttack)
    //         .AddTreeCooldown("Throw", 6.0f)
    //         .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    //         //.AddRequirement(UCS_EnemyFartherThan(ThrowMinRange));

    // default Behavior_MediumPriority()
    //     .AttackTree(2.0f, "Charge")
    //         .AddAttack(ChargeAttack)
    //         .AddTreeCooldown("Charge", 10.0f)
    //         .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    //         //.AddRequirement(UCS_EnemyFartherThan(ChargeMinRange));

     default Behavior_MediumPriority()
        .AttackTree(1.0f, "Melee")
            .AddAttack(AttackRightSingle,50.0f)
            .AddAttack(AttackLeftSingle,50.0f)
            .AddRequirement(UCS_EnemyCloserThan(300.0f))
            .AddTreeCooldown("MeleePrio", 15.0f);

    default Behavior_MediumPriority()
        .AttackTree(3.0f, "Melee")
            .AddAttack(AttackRightSingle,50.0f)
            .AddAttack(AttackLeftSingle,50.0f)
            .AddRequirement(UCS_EnemyCloserThan(600.0f))
            .AddTreeCooldown("Melee", 2.5f);

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Harpy : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Harpy_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Harpy);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Harpy_Grounded);
}