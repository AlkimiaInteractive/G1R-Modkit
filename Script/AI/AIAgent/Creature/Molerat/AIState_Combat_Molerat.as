UCLASS()
class UAIState_Combat_Molerat : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Molerat);

    //float32 TauntCooldown = 3.0f;

    default Config.PositioningValuesSizeMultiplier = 0.8f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        MovementSpeedChangeDistanceToCollisionRadiusRatio = 4.0f;

        EnemyTooCloseDistance = 70.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.0f;
        Config.ReactToAttackFrontDodgeChance = 0.20f;
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
        return "Molerat - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Molerat_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Molerat - Creature Combat";
    }

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Molerat : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default TauntCooldown_Base = 3.0f;   
    default TauntCooldown_General = 3.0f;

    default BaseRoleSlotSize = 0.6f;
    default BaseRolePriority = 0.2f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackTop = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 120.0f,
        InMaxRange = 150.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackTop);

    FAttackInfo MeleeAttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackLeft);

    FAttackInfo DigChargeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMinRange = 400.0f,
        InMaxRange = 600.0f,
        bInMaxRangeOverride = true);
    default AddAttack(DigChargeAttack);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.2f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);
    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Dig Charge")
                .AddAttack(DigChargeAttack)
                .AddTreeCooldown("Attack_Charge", 7.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(400.0f, 600.0f))
                .AddRequirement(UCS_CanPerformDigAttackTowardsTarget());

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Short Range Bite")
                .AddAttack(MeleeAttackLeft)
                .AddTreeCooldown(CooldownID_MainMelee, 2.5f)
                .AddRequirement(UCS_EnemyCloserThan(100.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f,"Long Range Bite")
                .AddAttack(MeleeAttackTop)
                .AddTreeCooldown(CooldownID_MainMelee, 2.0f)
                .AddRequirement(UCS_EnemyFartherThan(100.0f)) 
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(MeleeAttackTop)
                .AddTreeCooldown(CooldownID_PassiveMelee, 7.0f)
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
class UWeaponBehaviorSet_Molerat_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Molerat : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Molerat_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Molerat);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Molerat_Water);
}