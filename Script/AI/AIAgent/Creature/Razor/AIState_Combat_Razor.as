UCLASS()
class UAIState_Combat_Razor : UAIState_Combat_Creature_BipedalTherapod
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Razor);

    //float32 TauntCooldown = 5.0f;

    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 10.0f;

    default Config.PositioningValuesSizeMultiplier = 1.1f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.85f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        EnemyTooCloseDistance = 80.0f;
        EnemyCombatDistance = 1200.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
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

    FString GetDisplayName() const override
    {
        return "Razor - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Razor_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Razor - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Razor : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(ChargeAttack);
    ///////////////////

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);
    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Charge")
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Charge", 10.0f)
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(800.0f, 3000.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddAttack(AttackCombo_LeftRight, 4.0f)
                .AddAttack(AttackCombo_RightLeft, 4.0f)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Passive Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddTreeCooldown("Attack_Main", 12.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 6.0f, 12.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(100.0f, 1.5f))
            .AddTreeCooldown("Dodge",1.0f);
    ////////////////////
}


UCLASS()
class UWeaponBehaviorSet_Razor_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Razor : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Razor_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Razor);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Razor_Water);
}