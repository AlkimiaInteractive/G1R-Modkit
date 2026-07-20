/** */
UCLASS()
class UAIState_Combat_Skeleton_Mage : UAIState_Combat_Creature_StrafingFlyer
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Skeleton_Mage);

    default Config.PositioningValuesSizeMultiplier = 1.0f;

    float32 TauntCooldown = 5.0f;

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
        return "Skeleton Mage - Creature Combat";
    }
}

// UCLASS()
// class UWeaponBehaviorSet_Skeleton_Mage_Observer : UCombatBehaviorSet_Observer
// {
//     FString GetDisplayName() const override
//     {
//         return "Skeleton Mage - Creature Combat";
//     }

//     void SetupConfigValues() override
//     {
//         Super::SetupConfigValues();

//         Combat.EnemyTooCloseDistance = 180.0f;
//     }

//     default Behavior_Movement()
//             .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
//                 .SetTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

//     default Behavior_Movement()
//             .DoNode(UCBT_Tree_Positioning_Strafer());
// }

UCLASS()
class UWeaponBehaviorSet_Skeleton_Mage : UWeaponBehaviorSet_Melee
{
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default Roles.Remove(ECombatRole::Observer);
    
    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

    // ATTACKS /////////

    //Magic Beam
    FAttackInfo AttackMagicBeam = FAttackInfo(
        UCM_SkeletonMageSpecialAttack_MagicBeam(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        1200.0f,
        200.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackMagicBeam);

    //Soul Harvest
    FAttackInfo AttackSoulHarvest = FAttackInfo(
        UCM_SkeletonMageSpecialAttack_SoulHarvest(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        2000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackSoulHarvest);

    //Summon Skeletons v1
    FAttackInfo AttackSummonSkeletons = FAttackInfo(
        UCM_SkeletonMageSpecialAttack_SummonSkeletons(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        1200.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackSummonSkeletons);

    FAttackInfo TeleportMove = FAttackInfo(
        UCM_SkeletonMageSpecialAttack_Teleport(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        5000.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(TeleportMove);

    // ///////////////////

    // // BEHAVIORS ///////

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Summon")
                    .AddAttack(AttackSummonSkeletons) //Summon Skeletons
                    .AddTreeCooldown("SummonSkeletons", 20.0f)
                    .AddRequirement(UCS_Test_SkeletonMage_CanSpawnNewSkeletons()); 

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Harvest")
                    .AddAttack(AttackSoulHarvest) //Soul Harvest
                    .AddTreeCooldown("SoulHarvest", 15.0f)
                    .AddRequirement(UCS_Test_SkeletonMage_CanSpawnNewSouls());

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "TP")
                    .AddAttack(TeleportMove) //TP
                    .AddRequirement(UCS_EnemyCloserThan(150.0f))
                    .AddTreeCooldown("TP", 20.0f);

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Beam")
                    .AddAttack(AttackMagicBeam) //Magic Beam
                    .AddTreeCooldown("MagicBeam", 5.0f);

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
    // ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 10.0f;
        Combat.EnemyCloseDistance = 800.0f;
        Combat.EnemyLungeDistance = 900.0f;

        Combat.Config.PreferredDistance = 500.0f;
        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::FartherThan;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Skeleton_Mage : UCombatBehaviorSetPackage
{
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Mage_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Mage);
}