UCLASS()
class UAIState_Combat_Test_Mini_Golem_Ice : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    //default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy::StaticClass());
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackageTest_Mini_Golem_Ice::StaticClass());

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

    default bTauntsEnabled = false;
    // BEHAVIORS ///////
    ///// COMMON /////
    // default CommonBehavior_MediumPriority
    //         .DoNode(UCBT_Tree_PutDodgesAndAttacksOnCooldownAfterNoticingDamageOnSelfAndNotImmuneSuperArmor(0.5f));

    // default CommonBehavior_MediumPriority
    //         .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    FString GetDisplayName() const override
    {
        return "Test Mini Golem Combat";
    }
}

UCLASS()
class UWeaponBehaviorSetTest_Mini_Golem_Ice_Observer : UCombatBehaviorSet_Observer
{
    void SetupConfigValues() override
    {
        Combat.Config.PreferredDistance = 1700.0f;
    }
}

UCLASS()
class UWeaponBehaviorSetTest_Mini_Golem_Ice : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 0.01f; //5
    default BaseRolePriority = 10.0f; //10

    // ATTACKS /////////
    FAttackInfo MeleeAttackSingleLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackSingleLeft);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackCombo);

    FAttackInfo IceboltAttack = FAttackInfo(
        UCM_GolemSpecialAttack_Ice_IceBolt(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1600.0f,
        450.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(IceboltAttack);

    ///////////////////

    // BEHAVIORS ///////
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Icebolt")
                .AddAttack(IceboltAttack)
                .AddTreeCooldown("Icebolt", 7.0f)
                .AddRequirement(UCS_Not(UCS_EnemyFrozen()))
                .AddRequirement(UCS_EnemyFartherThan(450)); // if target is farther than min range

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Melee")
                // .AddAttack(MeleeAttackSingleLeft)
                // .AddAttack(MeleeAttackSingleLeft)
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Main", 2.0f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
}

UCLASS()
class UCombatBehaviorSetPackageTest_Mini_Golem_Ice : UCombatBehaviorSetPackage
{
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSetTest_Mini_Golem_Ice_Observer::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSetTest_Mini_Golem_Ice::StaticClass());
}