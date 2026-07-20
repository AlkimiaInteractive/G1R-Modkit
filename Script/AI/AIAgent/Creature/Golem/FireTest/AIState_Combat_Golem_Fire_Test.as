UCLASS()
class UAIState_Combat_Golem_Fire_Test : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Golem_Fire_Test);

    float32 TauntCooldown = 5.0f;

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

    FString GetDisplayName() const override
    {
        return "Fire Golem - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Fire_Test_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    
}

UCLASS()
class UWeaponBehaviorSet_Golem_Fire_Test : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 5.0f;
    default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        530.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackSingle);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        530.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackCombo);

    FAttackInfo GroundBreak = FAttackInfo(
        // UCM_Attack_Top(), 
        UCM_GolemSpecialAttack_Fire_BreakFloor2(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(GroundBreak);

    FAttackInfo GrenadeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(GrenadeAttack);
    ///////////////////

    // BEHAVIORS ///////    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(GrenadeAttack)
                .AddTreeCooldown("Attack_Grenade", 3.5f)
                .AddRequirement(UCS_EnemyFartherThan(300.0f));
    
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(GroundBreak)
                .AddTreeCooldown("Attack_AoE", 3.5f)
                .AddRequirement(UCS_EnemyFartherThan(300.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Melee", 3.0f)
                .AddRequirement(UCS_EnemyCloserThan(300.0f));

    /// BASE MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_Golem_Fire_Test : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Fire_Test_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Fire_Test);
}