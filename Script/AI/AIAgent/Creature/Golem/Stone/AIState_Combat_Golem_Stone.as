UCLASS()
class UAIState_Combat_Golem_Stone : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Golem_Stone);

    //float32 TauntCooldown = 5.0f;
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.10f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    default FarSpeed = EWalkSpeed::Walking;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 80.0f;
        EnemyCombatDistance = 5000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_PutDodgesAndAttacksOnCooldownAfterNoticingDamageOnSelfAndNotImmuneSuperArmor(0.5f));
    
    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Stone Golem - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Stone_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Stone Golem - Observer";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Stone : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 5.0f;
    default BaseRolePriority = 10.0f;

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 0.0f,
        InMaxRange = 550.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackSingle);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),);
        // InMinRange = 300.0f,
        // InMaxRange = 550.0f,
        // bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackCombo);

    FAttackInfo StoneWave = FAttackInfo(
        UCM_GolemSpecialAttack_Stone_StoneWave(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        00.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(StoneWave);

    FAttackInfo GrenadeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        00.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(GrenadeAttack);

    FAttackInfo LongRangeGrenadeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2500.0f,
        //600.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(LongRangeGrenadeAttack);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        1200.0f, 
        600.0f, 
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);

    FAttackInfo TeleportMove = FAttackInfo(
        UCM_GolemSpecialAttack_Stone_Teleport(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        5000.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(TeleportMove);
    ///////////////////

    // BEHAVIORS ///////
    // default Behavior_Movement()
    //     .DoNode(UCBT_MoveToDoSelectedAttack());

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Teleport")
                .AddAttack(TeleportMove)   
                .AddTreeCooldown("Teleport", 10.0f)
                .AddRequirement(UCS_EnemyCloserThan(200.0f));
                //.AddRequirement(UCS_JustRecoveredFromSuperarmorBreak());

    default Behavior_MediumPriority()
        .AttackTree(2.0f, "Melee")
            // .AddAttack(MeleeAttackSingle)
            .AddAttack(MeleeAttackCombo)
            .AddRequirement(UCS_EnemyCloserThan(150.0f))
            .AddTreeCooldown("Attack_Main", 1.5f);

    default Behavior_MediumPriority()
        .AttackTree(3.0f, "Grenade")
            .AddAttack(GrenadeAttack)
            .AddTreeCooldown("Attack_Grenade", 7.0f)
            .AddRequirement(UCS_IsReachableInMelee())
            .AddRequirement(UCS_EnemyFartherThan(500.0f));

    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Wave")
                .AddAttack(StoneWave)
                .AddTreeCooldown("Attack_Wave", 9.0f)
                .AddRequirement(UCS_IsReachableInMelee());
                //.AddRequirement(UCS_EnemyFartherThan(300.0f));

    default Behavior_MediumPriority()
            .AttackTree(5.0f, "Melee")
                // .AddAttack(MeleeAttackSingle)
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Main", 0.5f);

    default Behavior_MediumPriority()
        .AttackTree(6.0f, "Wave")
            .AddAttack(StoneWave)
            .AddTreeCooldown("Attack_Wave", 2.0f)
            .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
            .AddRequirement(UCS_EnemyFartherThan(300.0f))
            .AddRequirement(UCS_EnemyCloserThan(1000.0f));

    default Behavior_MediumPriority()
        .AttackTree(6.0f, "Grenade")
            .AddAttack(LongRangeGrenadeAttack)
            .AddTreeCooldown("Attack_Grenade", 2.0f)
            .AddRequirement(UCS_EnemyFartherThan(300.0f))
            .AddRequirement(UCS_Not(UCS_IsReachableInMelee()));
            //.AddRequirement(UCS_EnemyFartherThan(500.0f));

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Golem_Stone : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Stone_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Stone);
}
