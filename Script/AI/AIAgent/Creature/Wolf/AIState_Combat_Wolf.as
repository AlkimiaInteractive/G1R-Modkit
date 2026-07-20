/** */
UCLASS()
class UAIState_Combat_Wolf : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Wolf);

    default Config.PositioningValuesSizeMultiplier = 1.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        
        Config.CooldownJustGotHit = 10.0f;
        Config.ReactToAttackBackDodgeChance = 0.2f;
        Config.ReactToAttackFrontDodgeChance = 0.25f;
    }

    bool CanSprint() override
    {
        return true;
    }

    bool ShouldAttack() override
    {
        if (CharacterOfInterest == nullptr)
            return false;

        if (!CharacterOfInterest.HasDrawnTorch())
            return true;

        if (CharacterOfInterest.IsFacingOtherCharacterDirectly(Self))
            return false;

        return true;
    }

    float CalculateCurrentChanceToDodgeAnAttack(USensedIncommingAttack Attack) const override
    {
        float DodgeChance = Super::CalculateCurrentChanceToDodgeAnAttack(Attack);

        if (Attack.Instigator.HasDrawnTorch())
            return 2.0f * DodgeChance;

        return DodgeChance;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Wolf - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Wolf_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Wolf - Observer Combat";
    }
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromAttackVectors(), 0.01f);
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_FeignRetreat())
            .AddRequirement(UCS_EnemyClose())
            .AddTreeCooldown("FeignRetreat", 2.0f, 5.0f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 1.0f)
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Wolf : UWeaponBehaviorSet_Melee
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
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackBottomSingle2 = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomSingle2);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 120.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeft);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromAttackVectors(), 0.01f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(170.0f, 1.5f))
            .AddTreeCooldown("Dodge",2.0f);

    default Behavior_MediumPriority()
        .AttackTree(1,"bottom2")
            //.AddAttack(AttackTopSingle)
            .AddAttack(AttackBottomSingle2)
            .AddTreeCooldown("Attack_Main", 6.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
            .AddRequirement(UCS_EnemyInsideDistanceRange(500, 700));

    // default Behavior_MediumPriority()
    //     .AttackTree(2,"combo")
    //         //.AddAttack(AttackTopSingle)
    //         .AddAttack(AttackCombo_RightLeft)
    //         .AddTreeCooldown("Attack_Main", 4.0f)
    //         .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
    //         .AddRequirement(UCS_EnemyCloserThan(250));
    
    default Behavior_MediumPriority()
            .AttackTree(3,"bottom")
                //.AddAttack(AttackTopSingle)
                .AddAttack(AttackBottomSingle)
                .AddTreeCooldown("Attack_Main", 6.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(350, 500));

    default Behavior_MediumPriority()
            .AttackTree(4, "closerange")
                .AddAttack(AttackLeftSingle)
                .AddTreeCooldown("Attack_close", 1.5f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(0, 350));
    
    default Behavior_MediumPriority()
            .AttackTree(5, "passive")
                .AddAttack(AttackBottomSingle2)
                .AddAttack(AttackBottomSingle)
                .AddTreeCooldown("Attack_Main", 15.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(500, MAX_flt))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_FeignRetreat())
    //         .AddRequirement(UCS_And(UCS_EnemyTooClose(), UCS_Not(UCS_CanMoveAwayFromEnemy())));

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_FeignRetreat())
    //         .AddRequirement(UCS_Or(UCS_LastMoveWasAttack(), UCS_LastMoveWasDodge()))
    //         .AddTreeCooldown("FeintRetreat", 8.0f, 12.0f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
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
class UWeaponBehaviorSet_Wolf_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Wolf : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Wolf_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Wolf);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Wolf_Water);
}

UCLASS()
class UCombatBehaviorSetPackage_Wolf_Alpha : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Wolf_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Wolf_Alpha);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Wolf_Water);
}

UCLASS()
class UAIState_Combat_Wolf_Alpha : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Wolf);

    default Config.PositioningValuesSizeMultiplier = 1.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        
        Config.CooldownJustGotHit = 10.0f;
        Config.ReactToAttackBackDodgeChance = 0.2f;
        Config.ReactToAttackFrontDodgeChance = 0.25f;
    }

    bool CanSprint() override
    {
        return true;
    }

    bool ShouldAttack() override
    {
        if (CharacterOfInterest == nullptr)
            return false;

        if (!CharacterOfInterest.HasDrawnTorch())
            return true;

        if (CharacterOfInterest.IsFacingOtherCharacterDirectly(Self))
            return false;

        return true;
    }

    float CalculateCurrentChanceToDodgeAnAttack(USensedIncommingAttack Attack) const override
    {
        float DodgeChance = Super::CalculateCurrentChanceToDodgeAnAttack(Attack);

        if (Attack.Instigator.HasDrawnTorch())
            return 2.0f * DodgeChance;

        return DodgeChance;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Wolf - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Wolf_Alpha : UWeaponBehaviorSet_Melee
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
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackBottomSingle2 = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomSingle2);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 120.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackCombo_RightLeft);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromAttackVectors(), 0.01f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(170.0f, 1.5f))
            .AddTreeCooldown("Dodge",2.0f);

    default Behavior_MediumPriority()
        .AttackTree(1,"bottom2")
            //.AddAttack(AttackTopSingle)
            .AddAttack(AttackBottomSingle2)
            .AddTreeCooldown("Attack_Main", 6.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
            .AddRequirement(UCS_EnemyInsideDistanceRange(500, 800));

    // default Behavior_MediumPriority()
    //     .AttackTree(2,"combo")
    //         //.AddAttack(AttackTopSingle)
    //         .AddAttack(AttackCombo_RightLeft)
    //         .AddTreeCooldown("Attack_Main", 4.0f)
    //         .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
    //         .AddRequirement(UCS_EnemyCloserThan(250));
    
    default Behavior_MediumPriority()
            .AttackTree(3,"bottom")
                //.AddAttack(AttackTopSingle)
                .AddAttack(AttackBottomSingle)
                .AddTreeCooldown("Attack_Main", 6.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(250, 500));

    default Behavior_MediumPriority()
            .AttackTree(4, "closerange")
                .AddAttack(AttackLeftSingle)
                .AddTreeCooldown("Attack_close", 1.5f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(0, 250));
    
    default Behavior_MediumPriority()
            .AttackTree(5, "passive")
                .AddAttack(AttackBottomSingle2)
                .AddAttack(AttackBottomSingle)
                .AddTreeCooldown("Attack_Main", 15.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(600, MAX_flt))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_FeignRetreat())
    //         .AddRequirement(UCS_And(UCS_EnemyTooClose(), UCS_Not(UCS_CanMoveAwayFromEnemy())));

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_FeignRetreat())
    //         .AddRequirement(UCS_Or(UCS_LastMoveWasAttack(), UCS_LastMoveWasDodge()))
    //         .AddTreeCooldown("FeintRetreat", 8.0f, 12.0f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
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

