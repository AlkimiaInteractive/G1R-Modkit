UCLASS()
class UAIState_Combat_Swampshark : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Swampshark);

    //float32 TauntCooldown = 5.0f;

    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 90.0f;
        EnemyCombatDistance = 1000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Swampshark - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Swampshark_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;
    FString GetDisplayName() const override
    {
        return "Swampshark - Creature Combat";
    }
    
    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Swampshark : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any
        );
    default AddAttack(AttackLeft);

    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any
        );
    default AddAttack(AttackRight);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Main Melee")
                .AddAttack(AttackLeft)
                .AddAttack(AttackRight)
                .AddTreeCooldown("Attack_Main", 3.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
    
    void SetupConfigValues() override
    {
        Super::SetupConfigValues();
        
        Combat.EnemyTooCloseDistance = 180.0f;
    }
}

/*UCLASS()
class UWeaponBehaviorSet_Swampshark_Water : UWeaponBehaviorSet_Melee
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
}*/

UCLASS()
class UCombatBehaviorSetPackage_Swampshark : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Swampshark_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Swampshark);
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Swampshark_Water);
}


UCLASS()
class UCombatBehaviorSetPackage_Swampshark_Sleeper : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_UnreachableEnemy_SleeperSwampshark);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Swampshark);
    //default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Swampshark_Water);
}

UCLASS()
class UAIState_Combat_Swampshark_Sleeper : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    //default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSet_UnreachableEnemy_SleeperSwampshark);
    //default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Swampshark_Sleeper);

    //float32 TauntCooldown = 5.0f;

    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 90.0f;
        EnemyCombatDistance = 1000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Swampshark - Creature Combat";
    }
}