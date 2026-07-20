UCLASS()
class UAIState_Combat_Minecrawler_Queen : UAIState_Combat_Creature_Strafer
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler_Queen);
    //default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);

    default AgentDefaultBasePriority = 100.0f;

    //float32 TauntCooldown = 6.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 80.0f;
        EnemyCombatDistance = 5000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.01f;
        Config.ReactToAttackFrontDodgeChance = 0.01f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////

    // ///// TESTING /////
    // default CustomTestingBehavior.MediumPriorityTree
    //     .DoNode(UCBT_Tree_Wait());
    
    ////////////////////

    void TestConfigValues() override
    {
    }

    FString GetDisplayName() const override
    {
        return "Minecrawler Queen - Creature Combat";
    }
}


UCLASS()
class UAIState_Combat_Minecrawler_QueenPh2 : UAIState_Combat_Creature_Strafer
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler_QueenPh2);

    // default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 80.0f;
        EnemyCombatDistance = 5000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.01f;
        Config.ReactToAttackFrontDodgeChance = 0.01f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////

    // ///// TESTING /////
    // default CustomTestingBehavior.MediumPriorityTree
    //     .DoNode(UCBT_Tree_Wait());
    
    ////////////////////

    void TestConfigValues() override
    {
    }

    FString GetDisplayName() const override
    {
        return "Minecrawler Queen - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Queen_Phase1 : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    // default BaseRoleSlotSize = 0.01f;
    // default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    FAttackInfo AttackMeleeFront = FAttackInfo(
        UCM_Attack_Right(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        InMaxRange = 600.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(AttackMeleeFront);

    FAttackInfo AttackRightSide = FAttackInfo(
        UCM_Attack_Bottom(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 600.0f,
        bInRequiresPathToTarget = false,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightSide);

    FAttackInfo AttackLeftSide = FAttackInfo(
        UCM_Attack_Top(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 600.0f,
        bInRequiresPathToTarget = false,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSide);

    FAttackInfo AttackSpit = FAttackInfo(
        UCM_Attack_Left(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        6000.0f,
        bInRequiresPathToTarget = false,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInMaxRangeOverride = true);
    default AddAttack(AttackSpit);
    ///////////////////

    // default Behavior_MediumPriority()
    //     //.DoNode(UCBT_Tree_Wait());
    //         .SetTreeCooldown("DoAttack", 2.0f);

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "LeftSide")
                    // .AddAttack(AttackRightSide)
                    .AddAttack(AttackLeftSide)
                    .AddTreeCooldown("ProtectEgg_Left", 4.0f)
                    .AddRequirement(UCS_EnemyInsideDistanceRange(0.0f, 600.0f))
                    .AddRequirement(UCS_CharacterOfInterestHasTag(GameplayTag::State_CloseTo_MCQueenEgg_Melee_Right));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "RightSide")
                    // .AddAttack(AttackLeftSide)
                    .AddAttack(AttackRightSide)
                    .AddTreeCooldown("ProtectEgg_Right", 4.0f)
                    .AddRequirement(UCS_EnemyInsideDistanceRange(0.0f, 600.0f))
                    .AddRequirement(UCS_CharacterOfInterestHasTag(GameplayTag::State_CloseTo_MCQueenEgg_Melee_Left));

    default Behavior_MediumPriority()
                .AttackTree(4.0f, "Front")
                    .AddAttack(AttackMeleeFront)
                    .AddTreeCooldown("Attack_Right", 4.0f)
                    .AddRequirement(UCS_Not(UCS_CharacterOfInterestHasTag(GameplayTag::State_CloseTo_MCQueenEgg_Melee_Right)))
                    .AddRequirement(UCS_Not(UCS_CharacterOfInterestHasTag(GameplayTag::State_CloseTo_MCQueenEgg_Melee_Left)))
                    .AddRequirement(UCS_EnemyInsideDistanceRange(0.0f, 550.0f));


    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Attack_ThrowEgg_AgainstRange")
                    .AddAttack(AttackSpit)
                    .AddTreeCooldown("Attack_ThrowEgg_AgainstRange", 2.0f)
                    .AddRequirement(UCS_EnemyInsideDistanceRange(400.0f, 10000.0f));
        
    // default Behavior_MediumPriority()
    //             .AttackTree(5.0f, "Attack_ThrowEgg_Defensive")
    //                 .AddAttack(AttackSpit)
    //                 .SetTreeCooldown("Attack_ThrowEgg_AgainstRange", 2.0f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_Wait());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 470.0f; //585.0f;
        Combat.EnemyLungeDistance = 700.0f;
        Combat.EnemyCombatDistance = 10000.0f;

        Combat.Config.PreferredDistance = 300.0f;
    }
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Queen_Phase2 : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
    
    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    default Roles.Add(ECombatRole::ActiveAttacker);
    // default BaseRoleSlotSize = 0.01f;
    // default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    FAttackInfo AttackCombo = FAttackInfo(
        UCM_AttackSCombo_RightLeftRight(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 400,
        InMaxRange = 1000,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Front,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo);

    // FAttackInfo LeftClose = FAttackInfo(
    //     UCM_AttackSCombo_Left(),
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet());
    // default AddAttack(LeftClose);

    FAttackInfo AttackStomp = FAttackInfo(
        UCM_Attack_Bottom(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
    default AddAttack(AttackStomp);

    FAttackInfo AttackStompBack = FAttackInfo(
        UCM_Attack_Bottom(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        400.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        // bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(AttackStompBack);

    // FAttackInfo AttackLeftSide = FAttackInfo(
    //     UCM_Attack_Top(),
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(),
    //     5000.0f,
    //     InAttackDirectionRequirement = EAttackDirectionRequirement::NotFront,
    //     bInRequiresPathToTarget = false,
    //     bInMaxRangeOverride = true);
    // default AddAttack(AttackLeftSide);

    FAttackInfo AttackSpit = FAttackInfo(
        UCM_Attack_Left(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        5000.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Front,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackSpit);
    ///////////////////

    default Behavior_MediumPriority()
        .AttackTree(2.0f,"Combo")
            .AddAttack(AttackCombo)
            .AddTreeCooldown("Attack_Combo", 2.0f)
            .AddTreeCooldown("Attack_spit", 1.0f)
            .AddRequirement(UCS_IsReachableInMelee())
            //.AddRequirement(UCS_EnemyInsideDistanceRange(200, 1200));
            .AddRequirement(UCS_EnemyFartherThan(400));
    
    default Behavior_MediumPriority()
        .AttackTree(3.0f,"Spit")
            .AddAttack(AttackSpit)
            .AddTreeCooldown("Attack_spit", 3.0f)
            .AddRequirement(UCS_IsReachableInMelee())
            .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Front));

    default Behavior_MediumPriority()
        .AttackTree(3.0f,"Spit")
            .AddAttack(AttackSpit)
            .AddTreeCooldown("Attack_spit", 2.0f)
            .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
            .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Front));

    default Behavior_MediumPriority()
    .AttackTree(1.0f,"StompBack")
        .AddAttack(AttackStompBack)
        .AddTreeCooldown("AttackStompBack", 7.0f)
        .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Any))
        .AddRequirement(UCS_EnemyCloserThan(400.0f));
   
    default Behavior_MediumPriority()
        .AttackTree(1.0f,"Stomp")
            .AddAttack(AttackStomp)
            .AddTreeCooldown("AttackStomp", 5.0f)
            .AddRequirement(UCS_EnemyCloserThan(400.0f));
    
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    ////////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 1000.0f;
        Combat.EnemyLungeDistance = 1400.0f;
        Combat.EnemyCombatDistance = 10000.0f;

        Combat.Config.PreferredDistance = 300.0f;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Minecrawler_Queen : UCombatBehaviorSetPackage
{
//     default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Queen_Observer);
     default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Queen_Phase1);
     //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Queen_Phase2); 
}

UCLASS()
class UCombatBehaviorSetPackage_Minecrawler_QueenPh2 : UCombatBehaviorSetPackage
{
//     default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Queen_Observer);
     //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Queen_Phase1);
     default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Queen_Phase2); 
}