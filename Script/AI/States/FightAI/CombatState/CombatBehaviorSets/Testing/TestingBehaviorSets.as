enum ECombatTestingBehaviorType
{
    None,
    Custom,
    StopBlocking,
    AlwaysBlock,
    ParryRiposte,
    DodgeAttacks,
    DodgeAway,
    Attack_Air_Left,
    Attack_Air_Right,
    Attack_Air_Top,
    Attack_Air_Bottom,
    Attack_Target_Left,
    Attack_Target_Right,
    Attack_Target_Top,
    Attack_Target_Bottom,
    Attack_IfClose_Left,
    Attack_IfClose_Right,
    Attack_IfClose_Top,
    Attack_IfClose_Bottom,
    CastSpell,
    PatrolWaypoints,
    RandomTaunt,
    CircleAroundTarget,
    MAX
}

UCLASS()
class UTestingBehaviorSet : UCombatBehaviorSet
{
    ECombatTestingBehaviorType TestingBehaviorType = ECombatTestingBehaviorType::None;
    FString BehaviorSetName = "";
    FString GetDisplayName() const override
    {
        return BehaviorSetName;
    }

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (Combat.SelectedTestingBehavior == ECombatTestingBehaviorType::None)
            return false;

        if (Combat.SelectedTestingBehavior != TestingBehaviorType)
            return false;

        return true;
    }
}

UCLASS()
class UTestingBehaviorSet_Custom : UTestingBehaviorSet
{
    default BehaviorSetName = "Custom";
    default TestingBehaviorType = ECombatTestingBehaviorType::Custom;

    void SetupConfigValues() override
    {
        Combat.TestConfigValues();
    }
}

UCLASS()
class UTestingBehaviorSet_StopBlocking : UTestingBehaviorSet
{
    default BehaviorSetName = "Stop Blocking";
    default TestingBehaviorType = ECombatTestingBehaviorType::StopBlocking;

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;     
    }

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ExitBlockStance());
}

UCLASS()
class UTestingBehaviorSet_AlwaysBlock : UTestingBehaviorSet
{
    default BehaviorSetName = "Always Block";
    default TestingBehaviorType = ECombatTestingBehaviorType::AlwaysBlock;

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;     
    }

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_EnterBlockStance());
}

UCLASS()
class UTestingBehaviorSet_ParryRiposte : UTestingBehaviorSet
{
    default BehaviorSetName = "Parry & Riposte";
    default TestingBehaviorType = ECombatTestingBehaviorType::ParryRiposte;

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;

        Combat.Config.ReactiveBlockingChance_Master = 1.0f;
        Combat.Config.ReactiveBlockingChance_Trained = 1.0f;
        Combat.Config.ReactToAttackFrontDodgeChance_Trained = 0.0f;
        Combat.Config.ReactToAttackFrontDodgeChance_Master = 0.0f;
    }

    default Behavior_HighPriority()
        .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth());
    
    default Behavior_HighPriority()
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
}

UCLASS()
class UTestingBehaviorSet_DodgeAttacks : UTestingBehaviorSet
{
    default BehaviorSetName = "Dodge Attacks";
    default TestingBehaviorType = ECombatTestingBehaviorType::DodgeAttacks;

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;

        Combat.Config.ReactiveBlockingChance_Master = 0.0f;
        Combat.Config.ReactiveBlockingChance_Trained = 0.0f;
        Combat.Config.ReactToAttackFrontDodgeChance_Untrained = 1.f;
        Combat.Config.ReactToAttackFrontDodgeChance_Trained = 1.0f;
        Combat.Config.ReactToAttackFrontDodgeChance_Master = 1.0f;
        Combat.Config.ReactToAttackFrontDodgeChance = 1.f;
        Combat.Config.ReactToAttackBackDodgeChance_Untrained = 1.f;
        Combat.Config.ReactToAttackBackDodgeChance_Trained = 1.0f;
        Combat.Config.ReactToAttackBackDodgeChance_Master = 1.0f;
        Combat.Config.ReactToAttackBackDodgeChance = 1.f;
    }

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
}

UCLASS()
class UTestingBehaviorSet_DodgeAway : UTestingBehaviorSet
{
    default BehaviorSetName = "Dodge Away";
    default TestingBehaviorType = ECombatTestingBehaviorType::DodgeAway;

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 250.0f;
    }

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenClose());
}

UCLASS()
class UTestingBehaviorSet_Attack_Air_Left : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Air - Left";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Air_Left;

    // ATTACKS /////////
    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    ///////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;                       
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackLeftSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Air_Right : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Air - Right";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Air_Right;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackRightSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Air_Top : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Air - Top";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Air_Top;

    // ATTACKS /////////
    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackTopSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Air_Bottom : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Air - Bottom";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Air_Bottom;

    // ATTACKS /////////
    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackBottomSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Target_Left : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Target - Left";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Target_Left;

    // ATTACKS /////////
        FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        110.0f);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackLeftSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Target_Right : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Target - Right";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Target_Right;

    // ATTACKS /////////
        FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        110.0f);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackRightSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Target_Top : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Target - Top";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Target_Top;

    // ATTACKS /////////
        FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        110.0f);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackTopSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_Target_Bottom : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack Target - Bottom";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_Target_Bottom;

    // ATTACKS /////////
        FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        110.0f);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }
        
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackBottomSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_IfClose_Left : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack If Close - Left";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_IfClose_Left;

    // ATTACKS /////////
        FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        500.0f,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackLeftSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_IfClose_Right : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack If Close - Right";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_IfClose_Right;

    // ATTACKS /////////
        FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        500.0f,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackRightSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_IfClose_Top : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack If Close - Top";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_IfClose_Top;

    // ATTACKS /////////
        FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        500.0f,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackTopSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Attack_IfClose_Bottom : UTestingBehaviorSet
{
    default BehaviorSetName = "Attack If Close - Bottom";
    default TestingBehaviorType = ECombatTestingBehaviorType::Attack_IfClose_Bottom;

    // ATTACKS /////////
        FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        500.0f,
        bInMaxRangeOverride = true);
    ///////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 350.0f;
        Combat.EnemyCombatDistance = 750.0f;
        Combat.EnemyCloseDistance = 400.0f;
    }

    default Behavior_MediumPriority()
        .AttackTree()
            .AddAttack(AttackBottomSingle)
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_CastSpell : UTestingBehaviorSet
{
    default BehaviorSetName = "Cast Selected Spell";
    default TestingBehaviorType = ECombatTestingBehaviorType::CastSpell;
    
    void SetupConfigValues() override
    {
        Combat.bTauntsEnabled = false;

        Combat.Config.PreferredDistance = 750.0f;
        Combat.Positioning.MinimumPositionDistance = 30.0f;
        Combat.EnemyTooCloseDistance = 150.0f;
        Combat.EnemyCloseDistance = 250.0f;
        Combat.EnemyLungeDistance = 700.0f;

        if (Combat.SelectedSpellAction == nullptr)
            return;

        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster) ||
            Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Cone))
        {
            Combat.Config.PreferredDistance = Combat.SelectedSpellAction.SpellConfigFromContainer.SpellConfig.SpellAreaRange * 0.6f;
        }
    }

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_MagicSpellStopCastingAny());

    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_MagicSpellCasting())
            .AddTreeCooldown("Test_Main", 1.5f);
}

UCLASS()
class UTestingBehaviorSet_Waypoints : UTestingBehaviorSet
{
    default BehaviorSetName = "Waypoints";
    default TestingBehaviorType = ECombatTestingBehaviorType::PatrolWaypoints;
    
    void SetupConfigValues() override
    {
    }

    default Behavior_Movement()
        .DoNode(UCBT_Tree_TestWaypointsAandB());
}

UCLASS()
class UTestingBehaviorSet_RandomTaunt : UTestingBehaviorSet
{
    default BehaviorSetName = "Random Taunt";
    default TestingBehaviorType = ECombatTestingBehaviorType::RandomTaunt;
    
    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 200.0f;
    }

    // default Behavior_LowPriority()
    //     .DoNode(UCBT_Tree_TestRandomTauntWhenClose());
}

// UCLASS()
// class UTestingBehaviorSet_RandomTaunt_Concurrent : UTestingBehaviorSet
// {
//     default BehaviorSetName = "Random Concurrent Taunt";
//     default TestingBehaviorType = ECombatTestingBehaviorType::RandomTaunt;
    
//     void SetupConfigValues() override
//     {
//         Combat.EnemyCloseDistance = 400.0f;
//         Combat.Config.PreferredDistance = 300.0f;
//     }

//     default BehaviorSelector()
//         .DoNode(UCBT_Tree_TestRandomTauntWhenClose());
// }

UCLASS()
class UTestingBehaviorSet_CircleAroundTarget : UTestingBehaviorSet
{
    default BehaviorSetName = "Circle around target";
    default TestingBehaviorType = ECombatTestingBehaviorType::CircleAroundTarget;
    
    void SetupConfigValues() override
    {
        Combat.EnemyCloseDistance = 200.0f;
        Combat.Config.PreferredDistance = 350.0f;
    }

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveCircleAroundEnemy());
}