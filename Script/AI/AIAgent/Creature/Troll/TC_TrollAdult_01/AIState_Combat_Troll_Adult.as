/** */
UCLASS()
class UAIState_Combat_Troll_Adult : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Troll_Adult);

    default BaseSpeed = EWalkSpeed::Walking;
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    default AgentDefaultBasePriority = 100.0f;

    //float32 TauntCooldown = 6.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 40.0f;
        EnemyCombatDistance = 100000.0f;

        Config.ReactToAttackBackDodgeChance = 0.66f;
        Config.ReactToAttackFrontDodgeChance = 0.80f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_PutDodgesAndAttacksOnCooldownAfterNoticingDamageOnSelfAndNotImmuneSuperArmor(0.5f));
    
    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    FString GetDisplayName() const override
    {
        return "Adult Troll - Creature Combat";
    }
}

//////////////////////////////////////////////////////////
// ADULT - NOT SHRINKED
//////////////////////////////////////////////////////////

UCLASS()
class UWeaponBehaviorSet_Troll_Adult_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Adult Troll - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Troll_Adult : UWeaponBehaviorSet_Melee
{
    //default BaseRolePriority = 5.0f;
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default Roles.Remove(ECombatRole::Observer);

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1.0f;

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (Combat.Self.IsShrunk())
        {
            Reason = "Shrunk";
            return false;
        }

        return Super::ShouldUseBehavior(Reason);
    }

    // Attacks ///////////////
    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_TrollAdult_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRight);

    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_TrollAdult_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_TrollAdult_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottom);

    FAttackInfo AttackRightLeft = FAttackInfo(
        UCM_Attack_TrollAdult_SCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackRightLeft);

    FAttackInfo GrabAndThrowGoblin = FAttackInfo(
        UCM_Attack_TrollAdult_GrabAndThrowGoblin(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        bInRequiresPathToTarget = false);
    default AddAttack(GrabAndThrowGoblin);

    FAttackInfo AttackStone = FAttackInfo(
        UCM_Attack_Top(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        10000.0f,
        600.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackStone);

    // BEHAVIORS ///////
    
    // default Behavior_Movement()
    //     .DoNode(UCBT_MoveToDoSelectedAttack());

    // ------------ TO TEST ANIMATIONS ---------------
    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             // .AddAttack(AttackRight)
    //             .AddAttack(AttackRightLeft)
    //             .SetTreeCooldown("AttackTest", 5.0f);

    // ------------ END TO TEST ANIMATIONS ---------------
    
    default Behavior_MediumPriority()
        .AttackTree(0.0f, "Throw Stone_nogobs")
            .AddAttack(AttackStone)
            .AddTreeCooldown("Attack_Stone_nogob", 10.0f)
            .AddRequirement(UCS_IsReachableInMelee())
            .AddRequirement(UCS_EnemyFartherThan(1000.0f));
    
    default Behavior_MediumPriority()
        .AttackTree(4.0f, "Throw Stone")
            .AddAttack(AttackStone)
            .AddTreeCooldown("Attack_Stone", 5.0f)
            .AddRequirement(UCS_IsReachableInMelee())
            .AddRequirement(UCS_EnemyFartherThan(1000.0f));

    default Behavior_MediumPriority()
    .AttackTree(1.0f, "Attack_Stone_outofrange")
        .AddAttack(AttackStone)
        .AddTreeCooldown("Attack_Stone_outofrange", 1.0f)
        .AddRequirement(UCS_Not(UCS_IsReachableInMelee()));

    /// THROW GOBLIN ATTACK
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Throw Goblin")
                .AddAttack(GrabAndThrowGoblin)
                .AddTreeCooldownActivation("Attack_Stone", 7.5f)
                .AddRequirement(UCS_IsReachableInMelee())
                //.AddRequirement(UCS_Troll_IsGoblinSelected())
                .AddRequirement(UCS_EnemyFartherThan(1200.0f));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Bottom Melee")
                .AddAttack(AttackBottom)
                .AddTreeCooldown("Bottom_Melee", 2.0f)
                .AddRequirement(UCS_IsReachableInMelee())
                //.AddTreeCooldown("Attack_Main", 0.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyCloserThan(1000.0f))
                .AddRequirement(UCS_EnemyFartherThan(400.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackRight)
                .AddAttack(AttackLeft)
                .AddAttack(AttackRightLeft)
                .AddTreeCooldown("Attack_Main", 0.6f)
                .AddRequirement(UCS_IsReachableInMelee())
                // .AddTreeCooldown("Attack_Bottom", 0.4f)
                .AddRequirement(UCS_EnemyCloserThan(1000.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(5.0f, "Passive Melee")
                .AddAttack(AttackRight)
                .AddTreeCooldown("Attack_Main", 5.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));    

    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackStone)
    //             .SetCooldown("Attack_Stone_Active", 4.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker)); // Could add range requirement like goblin

    // default Behavior_MediumPriority()
    //         .AttackTree()
    //             .AddAttack(AttackStone)
    //             .SetCooldown("Attack_Stone_Passive", 10.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////
    
    /// BASE MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_TrollAdult_GoToSelectedGoblin());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

//////////////////////////////////////////////////////////
// ADULT - SHRINKED
//////////////////////////////////////////////////////////

UCLASS()
class UWeaponBehaviorSet_Troll_Adult_Shrinked : UWeaponBehaviorSet_Melee
{
    default BaseRolePriority = 5.0f;
    default BaseRoleSlotSize = 0.7f;
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Combat.Self.IsShrunk())
        {
            Reason = "Shrunk";
            return false;
        }

        return Super::ShouldUseBehavior(Reason);
    }

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
        .AttackTree(1.0f, "Bottom")
            .AddAttack(AttackBottom)
            .AddTreeCooldown("Attack_Persecutory", 5.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
            .AddRequirement(UCS_EnemyFartherThan(120.0f));
            
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Stone")
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
    /// BASE MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////

    void SetupConfigValues() override
    {
        Combat.Config.MeleeAttackCapsuleRadiusMultiplier = 0.85f;
        Combat.Config.PositioningValuesSizeMultiplier = 1.1f;

        Combat.DefaultConfigValues();
        Super::SetupConfigValues();

        Combat.EnemyTooCloseDistance = 130.0f;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Troll_Adult : UCombatBehaviorSetPackage
{
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Troll_Adult_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Troll_Adult);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Troll_Adult_Shrinked);
}