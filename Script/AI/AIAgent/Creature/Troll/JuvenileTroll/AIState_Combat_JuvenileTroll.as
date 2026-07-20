UCLASS()
class UAIState_Combat_Troll_Juvenile : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_TrollJuvenile);

    default BaseSpeed = EWalkSpeed::Walking;
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    //float32 TauntCooldown = 6.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 40.0f;
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

    FString GetDisplayName() const override
    {
        return "Juvenile Troll - Creature Combat";
    }
}

//////////////////////////////////////////////////////////
// ADULT - NOT SHRINKED
//////////////////////////////////////////////////////////

UCLASS()
class UWeaponBehaviorSet_TrollJuvenile_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Juvenile Troll - Creature Combat";
    }

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;
}

UCLASS()
class UWeaponBehaviorSet_TrollJuvenile : UWeaponBehaviorSet_Melee
{
    default BaseRolePriority = 5.0f;
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default Roles.Remove(ECombatRole::Observer);

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

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
        CombatScriptRoleSets::GetAttackerRoleSet(),
        200.0f,
        InMinRange = 0,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRight);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_TrollAdult_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 400.0f,
        InMinRange = 0,
        bInMaxRangeOverride = true);
    default AddAttack(AttackBottom);

    FAttackInfo AttackRightLeft = FAttackInfo(
        UCM_Attack_TrollAdult_SCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        200.0f,
        InMinRange = 0,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightLeft);

    // FAttackInfo GoToGoblin = FAttackInfo(
    //     UCM_Attack_TrollAdult_GoToGoblin(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     250.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(GoToGoblin);

    // FAttackInfo GrabAndThrowGoblin = FAttackInfo(
    //     UCM_Attack_TrollAdult_GrabAndThrowGoblin(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(),
    //     bInRequiresPathToTarget = false);
    // default AddAttack(GrabAndThrowGoblin);
    ////////////////////////////

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
    
    /// THROW GOBLIN ATTACK
    // default Behavior_MediumPriority()
    //         .AttackTree(1.0f, "Throw Goblin")
    //             .AddAttack(GrabAndThrowGoblin)
    //             .AddRequirement(UCS_Troll_IsGoblinSelected());

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Bottom Melee")
                .AddAttack(AttackBottom)
                  .AddTreeCooldown("Attack_Bottom", 3.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(400.0f));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackRight)
                .AddAttack(AttackRightLeft)
                .AddTreeCooldown("Attack_Main", 1.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
               // .AddRequirement(UCS_EnemyInsideDistanceRange(0, 400));


    // default Behavior_MediumPriority()
    //     .AttackTree(4.0f, "Grab Goblin")
    //         .AddAttack(GoToGoblin)
    //         .SetTreeCooldown("Attack_GoToGoblin", 5.0f)
    //         .AddRequirement(UCS_EnemyFartherThan(600.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(5.0f, "Passive Melee")
                .AddAttack(AttackRight)
                .AddTreeCooldown("Attack_Main", 5.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
                //.AddRequirement(UCS_EnemyInsideDistanceRange(0, 400));

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
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_TrollJuvenile : UCombatBehaviorSetPackage
{
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TrollJuvenile_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TrollJuvenile);
}