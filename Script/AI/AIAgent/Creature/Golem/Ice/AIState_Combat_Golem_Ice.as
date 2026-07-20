UCLASS()
class UAIState_Combat_Golem_Ice : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Golem_Ice);

    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    //float32 TauntCooldown = 20.0f;
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
        return "Ice Golem - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Ice_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Ice Golem - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Ice : UWeaponBehaviorSet_Melee
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
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        InMinRange = 0.0f,
        InMaxRange = 540.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackSingleLeft);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        InMinRange = 0.0f,
        InMaxRange = 540.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackCombo);

    FAttackInfo WaveAttack = FAttackInfo(
        UCM_GolemSpecialAttack_Ice_IceWave(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        //450.0f,
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

    FAttackInfo IceboltLongRangeAttack = FAttackInfo(
        UCM_GolemSpecialAttack_Ice_IceBolt(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        5600.0f,
        //450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(IceboltLongRangeAttack);

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Icebolt")
                    .AddAttack(IceboltAttack)
                    .AddTreeCooldown("Icebolt", 7.0f)
                    .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
                    .AddRequirement((UCS_IsReachableInMelee()))
                    .AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Wave")
                .AddAttack(WaveAttack)
                .AddTreeCooldown("Wave", 10.0f)
                .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
                .AddRequirement((UCS_IsReachableInMelee()));
                //.AddRequirement(UCS_EnemyFartherThan(100)); // if target is farther than min range

    default Behavior_MediumPriority()
                .AttackTree(4.0f, "Icebolt")
                    .AddAttack(IceboltLongRangeAttack)
                    .AddTreeCooldown("Icebolt", 2.0f)
                    .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
                    .AddRequirement(UCS_Not(UCS_IsReachableInMelee()));
                    //.AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Wave")
                .AddAttack(WaveAttack)
                .AddTreeCooldown("Wave", 3.0f)
                .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
                .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                .AddRequirement(UCS_EnemyCloserThan(1000)); // if target is farther than min range
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Melee")
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Main", 0.5f);;
    
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_Golem_Ice : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Ice_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Ice);
}

// ---------------------





UCLASS()
class UAIState_Combat_Golem_Ice_Wait : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Golem_Ice_Wait);

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

    ///// TESTING /////
    default CustomTestingBehavior.MediumPriorityTree
        .DoNode(UCBT_Tree_Wait());
    
    ////////////////////

    void TestConfigValues() override
    {
        Config.PreferredDistance = 500.0f;
    }

    FString GetDisplayName() const override
    {
        return "Fire Golem - Creature Combat Wait";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Ice_Wait_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    void SetupConfigValues() override
    {
        Combat.Config.PreferredDistance = 1700.0f;
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Ice_Wait : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    ///////////////////

    // BEHAVIORS ///////
    /// MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    
    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 500.0f; //500
        Combat.EnemyLungeDistance = 1800.0f;
        Combat.EnemyCombatDistance = 2500.f;

        // Combat.Config.PreferredDistance = Combat.EnemyCloseDistance;
        Combat.Config.PreferredDistance = 300.0f;
        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::CloserThan;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Golem_Ice_Wait : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Ice_Wait_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Ice_Wait);
}