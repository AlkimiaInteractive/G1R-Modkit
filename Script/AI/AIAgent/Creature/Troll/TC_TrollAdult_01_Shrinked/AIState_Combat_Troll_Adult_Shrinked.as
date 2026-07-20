/** */
UCLASS()
class UAIState_Combat_Troll_Adult_Shrinked_Test : UAIState_Combat_Creature
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Troll_Adult_Shrinked_Test);

    // default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::Exact;

    default BaseSpeed = EWalkSpeed::Running;

    float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 40.0f;
        EnemyLungeDistance = 700.0f;
        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.66f;
        Config.ReactToAttackFrontDodgeChance = 0.80f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_PutDodgesAndAttacksOnCooldownAfterNoticingDamageOnSelfAndNotImmuneSuperArmor(0.5f));
    
    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    default CommonBehavior_Movement
        .DoNode(UCBT_Tree_Positioning_Strafer());

    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenClose());

    ///// TESTING /////
    default CustomTestingBehavior.MediumPriorityTree
        .DoNode(UCBT_Tree_Wait());
    
    ////////////////////
    
    void TestConfigValues() override
    {
        
    }

    FString GetDisplayName() const override
    {
        return "Adult Troll - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Troll_Adult_Shrinked_Test_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    void SetupConfigValues() override
    {
        Combat.Config.PreferredDistance = 450.0f;
    }
}

UCLASS()
class UWeaponBehaviorSet_Troll_Adult_Shrinked_Test : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    // Attacks ///////////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Extra03(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        100.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeft);

    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Extra02(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        100.0f, // 138.0f;
        bInMaxRangeOverride = true);
    default AddAttack(AttackRight);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Extra04(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        250.0f, // 400RM*0.3 + 120IP
        bInMaxRangeOverride = true);
    default AddAttack(AttackBottom);

    // FAttackInfo AttackTop = FAttackInfo(
    //     UCM_Attack_Top(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
    //     120.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(AttackTop);

    // FAttackInfo AttackLeftRight = FAttackInfo(
    //     UCM_AttackSCombo_LeftRight(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
    //     120.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(AttackLeftRight);

    FAttackInfo AttackStone = FAttackInfo(
        UCM_Attack_Extra06(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1000.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackStone);
    ////////////////////////////

    // BEHAVIORS ///////    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    // ------------ TO TEST ANIMATIONS ---------------
    // default Behavior_MediumPriority().AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker)
    //     .SetCooldown("Attack_Main", UNodeCooldownCalculation_AttackingMembersInGroup(3.0f, 1.0f))
    //         .AttackTree()
    //             // .AddAttack(AttackRight);
    //             // .AddAttack(AttackLeft);
    //             .AddAttack(AttackLeftRight);

    // default Behavior_MediumPriority().AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker)
    //     .SetCooldown("Attack_Persecutory", UNodeCooldownCalculation_AttackingMembersInGroup(5.0f, 1.0f))
    //         .AttackTree()
    //             .AddAttack(AttackBottom)
    //             .AddRequirement(UCS_EnemyFartherThan(300.0f));

    // ------------ END TO TEST ANIMATIONS ---------------
    
    default Behavior_MediumPriority()
        .AttackTree(2.0f, "Bottom")
            .AddAttack(AttackBottom)
            .AddTreeCooldown("Attack_Persecutory", 5.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
            .AddRequirement(UCS_EnemyFartherThan(120.0f));
            
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Stone")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Active", 4.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(AttackStone.MinRange, MAX_flt));

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Passive", 10.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(AttackStone.MinRange, MAX_flt));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main")
                // .AddAttack(AttackRight)
                // .AddAttack(AttackLeft)
                .AddAttack(AttackLeft)
                .AddAttack(AttackRight)
                .AddTreeCooldown("Attack_Main", 3.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackTop)
    //             .AddTreeCooldown("Attack_Main", 3.5f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
    //             .AddRequirement(UCS_EnemyCloserThan(120.0f));
    
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackRight)
                .AddAttack(AttackLeft)
                .AddTreeCooldown("Attack_Main", 5.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    /// BASE MOVEMENT
    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .SetTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));    

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 150.0f;
        Combat.EnemyCloseDistance = 350.0f;
        Combat.EnemyLungeDistance = 900.0f;

        Combat.Config.PreferredDistance = 270.0f;
        // Combat.Config.PreferredDistance = 500.0f; //To test bottom attack

        Combat.Positioning.MinimumPositionDistance = 150.0f;

        if (Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Combat.Config.PreferredDistance = 350.0f;
            Combat.Positioning.MinimumPositionDistance = 100.0f;
        }
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Troll_Adult_Shrinked_Test : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Troll_Adult_Shrinked_Test_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Troll_Adult_Shrinked_Test);
}

//// TEST --------------///