/** */
UCLASS()
class UAIState_Combat_Zombie : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Zombie);

    //float32 TauntCooldown = 5.0f;

    default FarSpeed = EWalkSpeed::Walking;
    default BaseSpeed = EWalkSpeed::Walking;

    // Cooldown timers local variables

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Zombie - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Zombie_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Zombie - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Zombie : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);

    default BaseRoleSlotSize = 0.6f;

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRight);
    ///////////////////

    // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Main Melee")
                .AddAttack(AttackCombo_RightLeft)
                .AddAttack(AttackCombo_LeftRight)
                .AddTreeCooldown("Attack_Main", 4.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Passive Melee")
                .AddAttack(AttackRightSingle)
                .AddAttack(AttackLeftSingle)
                .AddTreeCooldown("Attack_Main_Passive", 3.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));


    //To test specific anims
    // default Behavior_MediumPriority().AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker)
    //     .SetCooldown("Test_Attack", UNodeCooldownCalculation_AttackingMembersInGroup(5.0f, 1.0f))
    //         .AttackTree()
    //             // .AddAttack(AttackRightSingle);
    //             .AddAttack(AttackLeftSingle);
    //             // .AddAttack(AttackCombo_RightLeft);
    //             // .AddAttack(AttackCombo_LeftRight)
    //             .AddRequirement(UCS_EnemyCloserThan(250.0f));

    // default Behavior_MediumPriority().AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker)
    //     .SetCooldown("Test_Dodge", UNodeCooldownCalculation_AttackingMembersInGroup(5.0f, 1.0f))
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenClose());
    ////////////////////

    /// MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(200.0f));

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose());
}

UCLASS()
class UCombatBehaviorSetPackage_Zombie : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Zombie_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Zombie);
}