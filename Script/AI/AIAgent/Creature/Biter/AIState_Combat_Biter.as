UCLASS()
class UAIState_Combat_Biter : UAIState_Combat_Creature_BipedalTherapod
{    
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Biter);

    //float32 TauntCooldown = 5.0f;

    default Config.PositioningValuesSizeMultiplier = 1.5f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.2f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 80.0f;

        Config.ReactToAttackBackDodgeChance = 0.2f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack()); 
    ////////////////////
    bool CanSprint() override
    {
        return true;
    }

    FString GetDisplayName() const override
    {
        return "Biter - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Biter_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Biter - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Biter : UWeaponBehaviorSet_Melee
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    // ATTACKS ////////
    FAttackInfo AttackBiteLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        300.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,);
    default AddAttack(AttackBiteLeft);

    FAttackInfo AttackBiteRight = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
         300.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,);
    default AddAttack(AttackBiteRight);

    FAttackInfo AttackBiteSComboRightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
                 300.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,);
    default AddAttack(AttackBiteSComboRightLeft);

    FAttackInfo AttackBiteSComboLeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
                 300.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,);
    default AddAttack(AttackBiteSComboLeftRight);

    FAttackInfo ChargeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 600.0f,
        InMinRange = 400.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChargeAttack);       
    ////////////////

    //float32 TauntCooldown = 5.0f;

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Charge")
                .AddAttack(ChargeAttack)
                .AddTreeCooldown("Attack_Charge", 7.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(400.0f,600.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackBiteLeft)
                .AddAttack(AttackBiteRight)
                .AddAttack(AttackBiteSComboRightLeft, 3.0f)
                .AddAttack(AttackBiteSComboLeftRight, 3.0f)
                .AddTreeCooldown("Attack_Main", 1.5f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Passive Melee")
                .AddAttack(AttackBiteLeft)
                .AddAttack(AttackBiteRight)
                .AddTreeCooldown("Attack_Passive", 12.0f)
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
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Biter_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Biter : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Biter_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Biter);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Biter_Water);
}