UCLASS()
class UAIState_Combat_Snapper : UAIState_Combat_Creature_BipedalTherapod
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Snapper);

    //float32 TauntCooldown = 5.0f;
    float32 DodgeAfterAttackChance = 0.8f;

    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 10.0f;

    default Config.PositioningValuesSizeMultiplier = 1.5f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.2f;
    default Config.DodgeAfterAttackChance = DodgeAfterAttackChance;

    // default BaseSpeed = EWalkSpeed::Running;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 120.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;

        Config.DodgeAfterAttackChance = DodgeAfterAttackChance;
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

    FString GetDisplayName() const override
    {
        return "Snapper - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Snapper_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Razor - Creature Combat";
    }
    
    FAttackInfo AttackTop = FAttackInfo(
    UCM_Attack_Top(), 
    EAttackUsageType::Regular, 
    CombatScriptRoleSets::GetAttackerRoleSet(),       
        InMaxRange = 800.0f,
        InMinRange = 500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackTop);

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Main Melee Obs")
                .AddAttack(AttackTop)
                .AddTreeCooldown("Attack_Main_obs", 20.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(0.0f,800.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::Observer));

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenClose());
}

UCLASS()
class UWeaponBehaviorSet_Snapper : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default BaseRoleSlotSize = 1.25f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 200.0f,
        // InMinRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackTop = FAttackInfo(
    UCM_Attack_Top(), 
    EAttackUsageType::Regular, 
    CombatScriptRoleSets::GetAttackerRoleSet(),       
        InMaxRange = 400.0f,
        InMinRange = 100.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackTop);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),       
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),       
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),       
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),       
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 200.0f, 
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
    default AddAttack(AttackBottomSingle);
    ///////////////////

    // BEHAVIORS /////// 

    default Behavior_MediumPriority()
        .AttackTree(1.0f, "Main Melee jump")
            .AddAttack(AttackTop)
            .AddTreeCooldown("Attack_Jump", 8.0f)
            .AddRequirement(UCS_EnemyFartherThan(300.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Defensive Attack")
                .AddAttack(AttackBottomSingle)
                .AddTreeCooldown("Attack_Defensive", 5.0f)
                .AddRequirement(UCS_EnemyCloserThan(150.0f));
    
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(100.0f, 1.5f))
                .AddTreeCooldown("Dodge",1.5f);

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackRightSingle)
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackCombo_LeftRightLeft, 10.0f)
                .AddAttack(AttackCombo_LeftRight, 2.0f)
                .AddAttack(AttackCombo_RightLeft, 2.0f)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_Not(UCS_AttackSelected()))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));     
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddTreeCooldown("Attack_Passive", 7.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(350.0f));
    ////////////////////
    
    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.EnemyTooCloseDistance = 180.0f;
    }
}

UCLASS()
class UWeaponBehaviorSet_Snapper_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Snapper : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Snapper_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Snapper);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Snapper_Water);
}