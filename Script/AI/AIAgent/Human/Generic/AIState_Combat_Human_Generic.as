/** */
UCLASS()
class UAIState_Combat_Human_Generic : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    /// Behavior Sets
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Items);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Observer);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Swimming);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Melee);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Magic);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Archery);

    default bTauntsEnabled = true;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        Config.bUseWeaponSkillLevels = true;

        EnemyTooCloseDistance = 5.0f;
        EnemyCombatDistance = 750.0f;

        Config.ReactToAttackBackDodgeChance_Untrained = 0.0f;
        Config.ReactToAttackFrontDodgeChance_Untrained = 0.1f;
        Config.ReactToAttackBackDodgeChance_Trained = 0.2f;

        Config.ReactiveBlockingChance_Trained = 0.2f;
        Config.ReactToAttackFrontDodgeChance_Trained = 0.33f;

        Config.ReactToAttackBackDodgeChance_Master = 0.3f;

        Config.ReactiveBlockingChance_Master = 0.33f;
        Config.ReactToAttackFrontDodgeChance_Master = 0.5f;        
    }

    FAttackInfo AttackSmashMeatbug = FAttackInfo(
        UCM_Attack_SmashMeatbug(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 300.0f,
        bInMaxRangeOverride = true);

    // BEHAVIORS ///////
    /// MAIN ACTIONS //
    default CommonBehavior_MediumPriority
        .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);

    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    default CommonBehavior_MediumPriority
                .AttackTree(0.0001f, "Smash_Meatbug")
                    .AddAttack(AttackSmashMeatbug)
                    .AddTreeCooldown("Smash_Meatbug", 2.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSet_Human_Observer : UCombatBehaviorSet_Observer
{
    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.ReactiveBlockingChance_Trained = 0.0f;
        Combat.Config.ReactiveBlockingChance_Master = 0.0f;
    }

    // BEHAVIORS ///////
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}

UCLASS()
class UCombatBehaviorSet_Human_Observer_Ranged : UCombatBehaviorSet_Human_Observer
{
    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::FartherThan;

        // GROUNDED STRAFER BASE CONFIG VALUES
        Combat.EnemyTooCloseDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        Combat.EnemyCloseDistance = Combat.Config.PositioningValuesSizeMultiplier * 400.0f;
        Combat.EnemyLungeDistance = Combat.Config.PositioningValuesSizeMultiplier * 500.0f;
        Combat.EnemyCombatDistance = Combat.Config.PositioningValuesSizeMultiplier * 3000.0f;

        Combat.Positioning.MinimumPositionDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        
        Combat.Config.PreferredDistance = Combat.Config.PositioningValuesSizeMultiplier * 800.0f;

        Combat.Config.ReactiveBlockingChance_Trained = 0.0f;
        Combat.Config.ReactiveBlockingChance_Master = 0.0f;
    }

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.Self.HasDrawnRangedWeapon())
            return true;

        Reason = "Has not drawn ranged weapon";
        return false;
    }
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Observer : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Observer_Ranged);
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Observer);
}