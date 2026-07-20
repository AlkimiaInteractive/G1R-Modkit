UCLASS()
class UAIState_Combat_Scavenger_Young : UAIState_Combat_Creature_BipedalTherapod
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Scavenger_Young);

    //float32 TauntCooldown = 5.0f;

    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 4.0f;

    default Config.PositioningValuesSizeMultiplier = 0.75f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        EnemyTooCloseDistance = 50.0f;
        Config.CooldownJustGotHit = 10.0f;

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
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Young Scavenger - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Scavenger_Young_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    FString GetDisplayName() const override
    {
        return "Medium Scavenger - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Scavenger_Young : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default BaseRoleSlotSize = 0.5f;
    default BaseRolePriority = 0.0f;

    default TauntCooldown_Base = 1.5f;
    default TauntCooldown_General = 1.5f;

    // ATTACKS /////////
    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        /*InMaxRange = 80,
        bInMaxRangeOverride = true,*/);
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackBottomCombo = FAttackInfo(
        UCM_AttackCCombo_BottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomCombo);
    ///////////////////

    // // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Defensive Attack")
                .AddAttack(AttackTopSingle)
                .AddTreeCooldown("Attack_TooClose_Active", 4.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                //.AddRequirement(UCS_Not(UCS_AttackSelected()));
                /*.AddRequirement(UCS_EnemyCloserThan(85.0f)*/

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackBottomSingle)
                //.AddAttack(AttackBottomCombo)
                .AddTreeCooldown("Attack_Main", 2.5f);
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Passive Melee")
                .AddAttack(AttackTopSingle)
                .AddTreeCooldown("Attack_TooClose_Passive", 4.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
                /*.AddRequirement(UCS_EnemyCloserThan(80.0f)*/

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

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 20.0f;
        Combat.EnemyCloseDistance = 100.0f;
        Combat.EnemyLungeDistance = 300.0f;

        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Combat.Config.PreferredDistance = 100.0f;
        }
        else if (Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Combat.Config.PreferredDistance = 300.0f;
        }
    }
}


UCLASS()
class UWeaponBehaviorSet_Scavenger_Young_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Scavenger_Young : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Scavenger_Young_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Scavenger_Young);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Scavenger_Young_Water);
}