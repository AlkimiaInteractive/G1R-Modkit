UCLASS()
class UAIState_Combat_Sleeper_Diego : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Sleeper_Diego::StaticClass());

    //float32 TauntCooldown = 999999.0f;

    // Cooldown timers local variables

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        EnemyCombatDistance = 30000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;

        Config.bActiveAttackerCanTaunt = false;
        Config.bPassiveAttackerCanTaunt = false;
    }
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Sleeper_Diego - Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Diego_Observer : UCombatBehaviorSet_Observer
{
    void SetupConfigValues() override
    {
        Super::SetupConfigValues(); 
    }
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Melee_Diego : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackCombo_RightLeftRight = FAttackInfo(
        UCM_AttackSCombo_RightLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftRight);

    FAttackInfo AttackCombo_RightLeftBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftBottom);

    FAttackInfo AttackCombo_LeftTopBottom = FAttackInfo(
        UCM_AttackSCombo_LeftTopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTopBottom);

    FAttackInfo AttackCombo_TopBottom = FAttackInfo(
        UCM_AttackSCombo_TopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottom);

    FAttackInfo AttackCombo_TopRightLeft = FAttackInfo(
        UCM_AttackSCombo_TopRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopRightLeft);

    FAttackInfo AttackCombo_RightTopLeft = FAttackInfo(
        UCM_AttackSCombo_RightTopLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightTopLeft);

    FAttackInfo AttackCombo_RightTopRight = FAttackInfo(
        UCM_AttackSCombo_RightTopRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightTopRight);

    FAttackInfo AttackCombo_TopRightTop = FAttackInfo(
        UCM_AttackSCombo_TopRightTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightTopRight);

    FAttackInfo AttackCombo_TopLeftTop = FAttackInfo(
        UCM_AttackSCombo_TopLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopLeftTop);

    FAttackInfo AttackCombo_RightBottom = FAttackInfo(
        UCM_AttackSCombo_RightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightBottom);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_HighPriority()
                .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack())
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport))); // Prevent attack reaction when ready to teleport

    /// STOP BLOCKING AND TELEPORT
    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_ExitBlockStance()), 0.001f)
                    .AddRequirement(UCS_InBlockStance())
                    .AddRequirement(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport));
    
    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_Spell_Diego_Teleport_Sword()), 0.002f)
                    .AddRequirement(UCS_Not(UCS_InBlockStance()))
                    .AddRequirement(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport));
    //////////

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(0.3f, 7.0f), 0.02f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.03f)
                    .AddTreeCooldown("Riposte", 3.0f);

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Top Attack")
                    .AddAttack(AttackCombo_TopRightLeft)
                    .AddAttack(AttackCombo_TopBottom)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 4.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_RightLeftRight)
                    .AddAttack(AttackCombo_LeftTopBottom)
                    .AddAttack(AttackCombo_RightLeftBottom)
                    .AddAttack(AttackCombo_RightTopLeft)
                    .AddAttack(AttackCombo_RightTopRight)
                    .AddAttack(AttackCombo_TopRightTop)
                    .AddAttack(AttackCombo_TopLeftTop)
                    .AddAttack(AttackCombo_RightBottom)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f)
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport)));

    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer())
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport)));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Sleeper_Diego : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Observer_Ranged::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Melee_Diego::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Archery_Diego::StaticClass());
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Archery_Diego : UWeaponBehaviorSet_Ranged_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Bow);

    // ATTACKS /////////
    FAttackInfo QuickShot = FAttackInfo(
        UCM_QuickShot(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 0.0f,
        InMaxRange = 400.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(QuickShot);

    FAttackInfo AimedShotsMultiple = FAttackInfo(
        //UCM_AimedShots(2.0f, 3), 
        UCM_AimedShots(0.01f,0.5, 3), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 200.0f,
        InMaxRange = 30000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AimedShotsMultiple);

    FAttackInfo AimedShotsSingle = FAttackInfo(
        // UCM_AimedShots(2.0f, 1), 
        UCM_AimedShots(1.0f, 0.5f,1.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 200.0f,
        InMaxRange = 30000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AimedShotsSingle);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_Spell_Diego_Teleport_Bow()), 0.00001f)
                    .AddRequirement(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport));

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Multiple Aimed Shots")
                    .AddAttack(AimedShotsMultiple)
                    .AddTreeCooldown("AimedShot", 1.0f)
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport)))
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Single Shot")
                    .AddAttack(AimedShotsSingle)
                    .AddTreeCooldown("AimedShot", 0.0f)
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_CanDoTeleport)));
                    //.AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    ///// MOVEMENT /////
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::FartherThan;

        // GROUNDED STRAFER RANGED CONFIG VALUES
        Combat.EnemyTooCloseDistance = 150.0f;
        Combat.EnemyCloseDistance = 400.0f;
        Combat.EnemyLungeDistance = 500.0f;
        Combat.EnemyCombatDistance  = 100000.0f;

        Combat.Positioning.MinimumPositionDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        
        Combat.Positioning.MinimumPositionDistance = 30.0f;
        Combat.Config.PreferredDistance = 550.0f;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Sleeper_Archery_Diego : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Archery_Diego::StaticClass());
}

UCLASS()
class UCM_Spell_Diego_Teleport_Bow : UCM_CastSpellOnce
{
    default bRequireToken = false;
    default _SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Bow;
    default bMaxRangeOverride = true;
    default MaxRange = 200000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Combat.ResetSelectedAttack();
        Super::DoTask();  
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        return Super::IsMoveAllowed(Reason);
    }

    bool IsSelectable(FString& Reason) override
    {
        return Super::IsSelectable(Reason);
    }
}

UCLASS()
class UCM_Spell_Diego_Teleport_Sword : UCM_CastSpellOnce
{
    default bRequireToken = false;
    default _SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Sword;
    default bMaxRangeOverride = true;
    default MaxRange = 200000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Combat.ResetSelectedAttack();
        Super::DoTask();  
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        return Super::IsMoveAllowed(Reason);
    }

    bool IsSelectable(FString& Reason) override
    {
        return Super::IsSelectable(Reason);
    }
}