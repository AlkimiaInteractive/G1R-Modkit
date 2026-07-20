UCLASS()
class UAIState_Combat_ShadowBeast : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Shadowbeast);
    
    //float32 TauntCooldown = 5.0f;

    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 0.5f;

    default Config.PositioningValuesSizeMultiplier = 2.5f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 400.0f;
        EnemyCombatDistance = 2000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    bool CanSprint() override
    {
        return true;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    void TestConfigValues() override
    {
        EnemyTooCloseDistance = 40.0f;
        EnemyLungeDistance = 700.0f;
        EnemyCombatDistance = 1000.0f;
        
    }

    FString GetDisplayName() const override
    {
        return "Shadow Beast - Creature Combat";
    }
}

UCLASS()
class UAIState_Combat_ShadowBeastPrime : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_ShadowbeastPrime);
    
    //float32 TauntCooldown = 5.0f;

    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 0.5f;

    default Config.PositioningValuesSizeMultiplier = 2.5f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 400.0f;
        EnemyCombatDistance = 2000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    void TestConfigValues() override
    {
        EnemyTooCloseDistance = 40.0f;
        EnemyLungeDistance = 700.0f;
        EnemyCombatDistance = 1000.0f;
        
    }

    FString GetDisplayName() const override
    {
        return "Shadow Beast - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Shadowbeast_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Shadow Beast - Creature Combat";
    }

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1600.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);

      default Behavior_MediumPriority()
            .AttackTree(1.0f, "Charge")
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Charge", 10.0f)
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(400.0f, 3000.0f));

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Shadowbeast : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Remove(ECombatRole::PassiveAttacker);
    default BaseRoleSlotSize = 1.2f;
    default BaseRolePriority = 10.0f;

    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
        //610,
        //bInMaxRangeOverride = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
        // 610.0f,
        // bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
        // 610,
        // bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
        // 610.0f,
        // bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo DefensiveAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        324.0f,
        bInMaxRangeOverride = true);
    default AddAttack(DefensiveAttack);

    FAttackInfo AreaAttack = FAttackInfo(
        UCM_Attack_Extra01(),
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        300.0f, //264.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Back,
        bInMaxRangeOverride = true);
    default AddAttack(AreaAttack);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        900.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Front,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);

    FAttackInfo StompAttack = FAttackInfo(
        UCM_Attack_Extra02(),
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        180.0f, //264.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInMaxRangeOverride = true);
    default AddAttack(StompAttack);
    ///////////////////

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose());

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.1f));

    // default Behavior_MediumPriority()
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 1.5f))
    //             .AddTreeCooldown("Dodge",1.0f);

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Back Attack")
                .AddAttack(AreaAttack)
                .AddTreeCooldown("Attack_Defensive_Backwards", 5.0f)
                .AddRequirement(UCS_EnemyCloserThan(300.0f))
                .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Back));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Defensive Attack")
                .AddAttack(DefensiveAttack)
                .AddTreeCooldown("Attack_Defensive", 5.0f)
                .AddRequirement(UCS_EnemyCloserThan(300.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Stomp Attack")
                .AddAttack(StompAttack)
                .AddTreeCooldown("Attack_Stomp", 10.0f)
                .AddRequirement(UCS_EnemyCloserThan(200.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Charge")
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Charge", 15.0f)
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Front))
                .AddRequirement(UCS_EnemyInsideDistanceRange(800.0f, 3000.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddAttack(AttackCombo_RightLeft, 3.0f)
                .AddAttack(AttackCombo_LeftRight, 3.0f)
                .AddTreeCooldown("Attack_Main", 3.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(250.0f, 1.5f))
                .AddTreeCooldown("Dodge",4.0f);

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveAwayFromTargetUntilDistance(500.0f))
    //             .AddTreeCooldown("MoveAway", 8.0f, 12.0f);

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy(5,700))
    //             .AddTreeCooldown("RunAroundEnemy", 2.0f);
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_ShadowbeastPrime : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    default Roles.Remove(ECombatRole::PassiveAttacker);
    default BaseRoleSlotSize = 5.0f;
    default BaseRolePriority = 10.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        500,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        500,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo DefensiveAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        324.0f,
        bInMaxRangeOverride = true);
    default AddAttack(DefensiveAttack);

    FAttackInfo AreaAttack = FAttackInfo(
        UCM_Attack_Extra01(),
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        274.0f, //264.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::NotFront,
        bInMaxRangeOverride = true);
    default AddAttack(AreaAttack);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        900.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);

    FAttackInfo StompAttack = FAttackInfo(
        UCM_Attack_Extra02(),
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        274.0f, //264.0f,
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
        bInMaxRangeOverride = true);
    default AddAttack(StompAttack);
    ///////////////////

    //float32 TauntCooldown = 5.0f;

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose());

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.1f));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Back Attack")
                .AddAttack(AreaAttack)
                .AddTreeCooldown("Attack_Defensive_Backwards", 5.0f)
                .AddRequirement(UCS_EnemyCloserThan(300.0f))
                .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::NotFront));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Defensive Attack")
                .AddAttack(DefensiveAttack)
                .AddTreeCooldown("Attack_Defensive", 5.0f)
                .AddRequirement(UCS_EnemyCloserThan(300.0f));

    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Stomp Attack")
                .AddAttack(StompAttack)
                .AddTreeCooldown("Attack_Stomp", 7.5f)
                .AddRequirement(UCS_EnemyCloserThan(200.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Charge")
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Charge", 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(800.0f, 3000.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddAttack(AttackCombo_RightLeft, 3.0f)
                .AddAttack(AttackCombo_LeftRight, 3.0f)
                .AddTreeCooldown("Attack_Main", 1.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Shadowbeast_Water : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Swimming);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_WaterWalking);
    
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.5f;
    default TauntCooldown_General = 1.5f;

   FAttackInfo Water_Attack = FAttackInfo(
         UCM_Attack_Left(), 
         EAttackUsageType::Regular, 
         CombatScriptRoleSets::GetAttackerRoleSet(),
         InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
         
     default AddAttack(Water_Attack);

    // BEHAVIORS ///////
    
        default Behavior_MediumPriority()
            .AttackTree(1, "Water")
                .AddAttack(Water_Attack)
                .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Any))
                .AddTreeCooldown("Attack_Main", 3.0f);
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));


    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// BASE MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 60.0f;
        Combat.EnemyCloseDistance = 170.0f;
        Combat.EnemyLungeDistance = 350.0f;

        Combat.Positioning.MinimumPositionDistance = 150.0f;
        
        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker) && Combat.CharacterOfInterest != nullptr)
        {
            Combat.Config.PreferredDistance = 350.0f;
        }
        else
        {
            Combat.Config.PreferredDistance = 450.0f;
        }
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Shadowbeast : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Shadowbeast_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Shadowbeast);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Shadowbeast_Water);
}

UCLASS()
class UCombatBehaviorSetPackage_ShadowbeastPrime : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Shadowbeast_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_ShadowbeastPrime);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Shadowbeast_Water);
}