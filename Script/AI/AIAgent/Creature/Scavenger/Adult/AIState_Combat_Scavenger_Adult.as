UCLASS()
class UAIState_Combat_Scavenger_Adult : UAIState_Combat_Creature_BipedalTherapod
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Scavenger_Adult);

    //float32 TauntCooldown = 5.0f;

    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 10.0f;

    default Config.PositioningValuesSizeMultiplier = 1.1f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.9f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 100.0f;
        Config.CooldownJustGotHit = 10.0f;
        Positioning.SafeZonePadding = 120.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;
    }

    bool CanSprint() override
    {
        return true;
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    FString GetDisplayName() const override
    {
        return "Adult Scavenger - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Scavenger_Adult_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    FString GetDisplayName() const override
    {
        return "Adult Scavenger - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Scavenger_Adult : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.5f;
    default TauntCooldown_General = 1.5f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 150.0f,
        // InMinRange = 0.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 150.0f,
        // InMinRange = 0.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSingle);

    FAttackInfo DefensiveAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        /*InMaxRange = 110.0f,
        bInMaxRangeOverride = true*/);
    default AddAttack(DefensiveAttack);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackLeftBottomCombo = FAttackInfo(
        UCM_AttackCCombo_LeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 150.0f,
        // InMinRange = 0.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftBottomCombo);
    ///////////////////

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);
    
    default Behavior_MediumPriority()
        .AttackTree(1.0f, "Bottom Attack")
            .AddAttack(AttackBottomSingle, 2.0f)
            .AddTreeCooldown("Attack_Persecutory", 4.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
            .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Defensive Attack")
                .AddAttack(DefensiveAttack)
                .AddTreeCooldown("Attack_Defensive", 5.0f)
                .AddRequirement(UCS_Not(UCS_AttackSelected()))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee Jump Combo")
                .AddAttack(AttackLeftBottomCombo)
                .AddTreeCooldown("Attack_Main", 3.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackRightSingle)
                .AddAttack(AttackLeftSingle)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyCloserThan(250.0f));
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(AttackBottomSingle)
                .AddTreeCooldown("Attack_Main", 12.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    /// MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.EnemyTooCloseDistance = 180.0f;
    }
}


UCLASS()
class UWeaponBehaviorSet_Scavenger_Adult_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Scavenger_Adult : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Scavenger_Adult_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Scavenger_Adult);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Scavenger_Adult_Water);
}