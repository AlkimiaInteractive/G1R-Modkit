UCLASS()
class UAIState_Combat_Golem_Fire : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Golem_Fire);

    
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    //float32 TauntCooldown = 5.0f;
    default FarSpeed = EWalkSpeed::Walking;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.10f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

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
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Fire Golem - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Fire_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    
}

UCLASS()
class UWeaponBehaviorSet_Golem_Fire : UWeaponBehaviorSet_Melee
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
        530.0f,
        0.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackSingle);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        530.0f,
        0.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackCombo);

    FAttackInfo GroundBreak = FAttackInfo(
        // UCM_Attack_Top(), 
        UCM_GolemSpecialAttack_Fire_BreakFloor2(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        0.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(GroundBreak);

    FAttackInfo GrenadeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2500.0f, //1200
        450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(GrenadeAttack);

    FAttackInfo GrenadeAttackLongRange = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        3500.0f, //1200
        0.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(GrenadeAttackLongRange);
    ///////////////////

    // BEHAVIORS ///////    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());
    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "GroundBreak")
                .AddAttack(GroundBreak)
                .AddTreeCooldown("Attack_AoE", 7.0f)
                .AddRequirement((UCS_IsReachableInMelee()))
                .AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range

    default Behavior_MediumPriority()
        .AttackTree(1.0f, "Grenade")
            .AddAttack(GrenadeAttack)
            .AddTreeCooldown("Attack_Grenade", 5.0f)
            .AddRequirement((UCS_IsReachableInMelee()))
            .AddRequirement(UCS_EnemyFartherThan(850)); // if target is farther than min range

    default Behavior_MediumPriority()
        .AttackTree(1.0f, "Grenade")
            .AddAttack(GrenadeAttackLongRange)
            .AddTreeCooldown("Attack_Grenade_Long", 2.0f)
            .AddRequirement(UCS_Not(UCS_IsReachableInMelee()));
            //.AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range
    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "GroundBreak")
                .AddAttack(GroundBreak)
                .AddTreeCooldown("Attack_AoE", 3.0f)
                .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                .AddRequirement(UCS_EnemyCloserThan(1000)); // if target is farther than min range

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Melee")
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Melee", 0.5f);
    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "0RangeGroundBreak")
                .AddAttack(GroundBreak)
                .AddTreeCooldown("Attack_AoE", 7.0f)
                .AddRequirement((UCS_IsReachableInMelee()));
                //.AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range

    /// BASE MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_Golem_Fire : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Fire_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Fire);
}