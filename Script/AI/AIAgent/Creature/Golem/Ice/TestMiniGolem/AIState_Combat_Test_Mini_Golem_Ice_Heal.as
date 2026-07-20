/*UCLASS()
class UAIState_Combat_Test_Mini_Golem_Ice_Heal : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy::StaticClass());
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackageTest_Mini_Golem_Ice_Heal::StaticClass());

    float32 TauntCooldown = 5.0f;

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
    //         .DoNode(UCBT_Tree_PutDodgesAndAttacksOnCooldownAfterNoticingDamageOnSelfAndNotImmuneSuperArmor(0.5f));
    
    // default CommonBehavior_MediumPriority
    //         .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    default CommonBehavior_Movement
            .DoNode(UCBT_Tree_CalculatePreferredPositionAndMoveToItIfTooFarFromTarget());


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
        return "Test Mini Golem Heal Combat";
    }
}

UCLASS()
class UWeaponBehaviorSetTest_Mini_Golem_Ice_Heal_Observer : UCombatBehaviorSet_Observer
{
    void SetupConfigValues() override
    {
        Combat.Config.PreferredDistance = 1700.0f;
    }
}

UCLASS()
class UWeaponBehaviorSetTest_Mini_Golem_Ice_Heal : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 0.01f; //5
    default BaseRolePriority = 10.0f; //10

    // ATTACKS /////////
    FAttackInfo HealIceGolem = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        250.0f,
        bInMaxRangeOverride = true);
    default AddAttack(HealIceGolem);

    // FAttackInfo MeleeAttackSingleLeft = FAttackInfo(
    //     UCM_Attack_Left(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     400.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(MeleeAttackSingleLeft);

    FAttackInfo MeleeAttackSingleRight = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        400.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackSingleRight);

    // FAttackInfo MeleeAttackCombo = FAttackInfo(
    //     UCM_AttackSCombo_LeftRight(), 
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(), 
    //     400.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(MeleeAttackCombo);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1700.0f,
        450.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_Movement()
        .DoNode(UCBT_MoveToDoSelectedAttack());

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(HealIceGolem)
                .AddRequirement(UCS_MiniIceGolem_CurrentTargetIsIceGolem());
    
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Charge", 5.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(800.0f, 3000.0f))
                .AddRequirement(UCS_Not(UCS_MiniIceGolem_CurrentTargetIsIceGolem()));    

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(MeleeAttackSingleRight)
                //.AddAttack(MeleeAttackSingleLeft)
                //.AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Main", 5.0f)
                .AddRequirement(UCS_Not(UCS_MiniIceGolem_CurrentTargetIsIceGolem()));

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
}

UCLASS()
class UCombatBehaviorSetPackageTest_Mini_Golem_Ice_Heal : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSetTest_Mini_Golem_Ice_Heal_Observer::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSetTest_Mini_Golem_Ice_Heal::StaticClass());
}/*