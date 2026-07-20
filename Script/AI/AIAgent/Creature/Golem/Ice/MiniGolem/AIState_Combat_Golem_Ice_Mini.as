UCLASS()
class UAIState_Combat_MiniGolem_Ice : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_MiniGolem_Ice);

    //float32 TauntCooldown = 20.0f;

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
        return "Ice Golem - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_MiniGolem_Ice : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 10.0f;

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackSingleLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),);
        // InMinRange = 150.0f,
        // InMaxRange = 540.0f,
        // bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackSingleLeft);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), );
        // InMinRange = 150.0f,
        // InMaxRange = 540.0f,
        // bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackCombo);

    FAttackInfo WaveAttack = FAttackInfo(
        UCM_GolemSpecialAttack_Ice_IceWave(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(WaveAttack);

    // FAttackInfo GrenadeAttack = FAttackInfo(
    //     UCM_Attack_Bottom(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     1200.0f,
    //     450.0f,
    //     bInRequiresPathToTarget = false,
    //     bInMaxRangeOverride = true);
    // default AddAttack(GrenadeAttack);

    FAttackInfo IceboltAttack = FAttackInfo(
        UCM_GolemSpecialAttack_Ice_IceBolt(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1600.0f,
        450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(IceboltAttack);

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Icebolt")
                    .AddAttack(IceboltAttack)
                    .AddTreeCooldown("Icebolt", 7.0f)
                    .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
                    .AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range
    
    // default Behavior_MediumPriority()
    //         .AttackTree(5.0f, "Wave")
    //             .AddAttack(WaveAttack)
    //             .AddTreeCooldown("Wave", 10.0f)
    //             .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
    //             .AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range
    
    default Behavior_MediumPriority()
            .AttackTree(6.0f, "Melee")
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Main", 1.0f);;
    
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_MiniGolem_Ice : UCombatBehaviorSetPackage
{
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Ice_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_MiniGolem_Ice);
}