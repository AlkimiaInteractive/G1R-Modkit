UCLASS()
class UAIState_Combat_Sleeper_Lester : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_SleeperTest_Lester);

    float32 TauntCooldown = 5.0f;

    // Cooldown timers local variables

    void DefaultConfigValues() override
    {
        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    FString GetDisplayName() const override
    {
        return "SleeperTest_Lester - Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Melee_Lester : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackCombo_BottomBottomBottom = FAttackInfo(
        UCM_AttackCCombo_BottomBottomBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomBottomBottom);

    FAttackInfo AttackCombo_RightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftTop);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackCombo_RightLeftBorrom = FAttackInfo(
        UCM_AttackSCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftBorrom);

    FAttackInfo AttackCombo_LeftTop = FAttackInfo(
        UCM_AttackSCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTop);

    FAttackInfo FistOfWind = FAttackInfo(
        UCM_Spell_Lester_FistOfWind(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(FistOfWind);

    FAttackInfo FistOfWindLongRange = FAttackInfo(
        UCM_Spell_Lester_FistOfWind(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        500.0f, //1200
        0.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(FistOfWindLongRange);
    ///////////////////
    
    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(0.3f, 7.0f), 0.02f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(), 0.03f)
                    .AddTreeCooldown("Riposte", 3.0f);

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Fist of Wind")
                    .AddAttack(FistOfWind)
                    .AddTreeCooldown("Spell", 7.0f)
                    .AddRequirement(UCS_EnemyCloserThan(350.0f))
                    .AddRequirement(UCS_FacingEnemy());

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Fist of Wind")
                    .AddAttack(FistOfWindLongRange)
                    .AddTreeCooldown("SpellLong", 7.0f)
                    .AddRequirement(UCS_EnemyCloserThan(350.0f))
                    .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                    .AddRequirement(UCS_FacingEnemy());

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackCombo_BottomBottomBottom)
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_RightLeftTop)
                    .AddAttack(AttackCombo_RightLeftBorrom)
                    .AddAttack(AttackCombo_LeftTop)
                    .AddTreeCooldown("M1H_Main", 2.0f);

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
class UCombatBehaviorSetPackage_SleeperTest_Lester : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_UnreachableEnemy_SleeperLester);
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Melee_Lester);
}

UCLASS()
class UCombatBehaviorSet_UnreachableEnemy_SleeperLester : UCombatBehaviorSet
{
    default Roles.Add(ECombatRole::ActiveAttacker);
    default Roles.Add(ECombatRole::PassiveAttacker);
    default bBlockBehaviorSwitchWhenAttackSelected = false;

    TArray<FName> Waypoints;
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_01");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_02");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_03");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_04");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_05");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_06");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_07");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_08");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_09");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_10");
    default Waypoints.Add(n"FP_SD_ISLANDEDGE_LESTER_11");

    // BEHAVIORS ///////
    default Behavior_HighPriority()
                .DoNode(UCBT_Tree_ReactToIncomingRangedAttack());

    default Behavior_LowPriority()
                .DoNode(UCBT_Tree_AggressiveTauntWhenJustGotHit())
                    .AddTreeCooldown("Taunt", 3.0f);

    default Behavior_Movement()
                .DoMove(UCM_MoveTowardsEnemyToPreferredDistance_UntilOutOfTerritory())
                    .AddRequirement(UCS_IsInsideCombatStartTerritory());
    
    default Behavior_Movement()
                .DoMove(UCM_MoveToWaypointClosestToTarget(Waypoints))
                    .AddRequirement(UCS_Not(UCS_IsAtWaypointClosestToTarget(Waypoints)));

    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "Character of interest is nullptr";
            return false;
        }

        if (Combat.IsTargetReachable())
        {
            Reason = "CharacterOfInterest is reachable";
            return false;
        }

        if (!Combat.IsOnNavmesh())
        {
            Reason = "Not on navmesh";
            return false;
        }

        return true;
    }

    FString GetDisplayName() const override
    {
        return Super::GetDisplayName() + f" Lester";
    }
}

UCLASS()
class UCombatBehaviorSet_UnreachableEnemy_SleeperSwampshark : UCombatBehaviorSet
{
    default Roles.Add(ECombatRole::ActiveAttacker);
    default Roles.Add(ECombatRole::PassiveAttacker);
    default bBlockBehaviorSwitchWhenAttackSelected = false;

    TArray<FName> Waypoints;
    default Waypoints.Add(n"FP_SD_SWAMPSHARKLESTER");
    default Waypoints.Add(n"FP_SD_SWAMPSHARKLESTER2");
    default Waypoints.Add(n"FP_SD_SWAMPSHARKLESTER3");
    default Waypoints.Add(n"FP_SD_SWAMPSHARKLESTER4");
    default Waypoints.Add(n"FP_SD_SWAMPSHARKLESTER5");
    default Waypoints.Add(n"FP_SD_SWAMPSHARKLESTER6");

    // BEHAVIORS ///////
    default Behavior_HighPriority()
                .DoNode(UCBT_Tree_ReactToIncomingRangedAttack());

    default Behavior_LowPriority()
                .DoNode(UCBT_Tree_AggressiveTauntWhenJustGotHit())
                    .AddTreeCooldown("Taunt", 3.0f);

    default Behavior_Movement()
                .DoMove(UCM_MoveTowardsEnemyToPreferredDistance_UntilOutOfTerritory())
                    .AddRequirement(UCS_IsInsideCombatStartTerritory());
    
    default Behavior_Movement()
                .DoMove(UCM_MoveToWaypointClosestToTarget(Waypoints))
                    .AddRequirement(UCS_Not(UCS_IsAtWaypointClosestToTarget(Waypoints)));

    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "Character of interest is nullptr";
            return false;
        }

        if (Combat.IsTargetReachable())
        {
            Reason = "CharacterOfInterest is reachable";
            return false;
        }

        if (!Combat.IsOnNavmesh())
        {
            Reason = "Not on navmesh";
            return false;
        }

        return true;
    }

    FString GetDisplayName() const override
    {
        return Super::GetDisplayName() + f" Lester";
    }
}

UCLASS()
class UCS_IsAtWaypointClosestToTarget : UFightAI_CombatSituation
{
    UPROPERTY()
    TArray<FName> Waypoints;

    UCS_IsAtWaypointClosestToTarget(TArray<FName> _Waypoints)
    {
        Waypoints = _Waypoints;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FName ClosestWaypoint;
        float SmallestDistance = MAX_flt;
        
        for (auto Waypoint : Waypoints)
        {
            FVector Location = InteractionSpots::GetLocationByName(Waypoint);
            if (!Combat.AI.CanGotoPosition(Location))
                continue;

            float Distance = Combat.CharacterOfInterest.NavAgentLocation.Distance(Location);
            if (Distance > SmallestDistance)
                continue;

            SmallestDistance = Distance;
            ClosestWaypoint = Waypoint;
        }

        if (ClosestWaypoint.IsNone())
        {
            return false;
        }

        FInteractionSpotHandle InteractionSpot = FInteractionSpotHandle(ClosestWaypoint);
        float Distance = Combat.Self.NavAgentLocation.Distance(InteractionSpot.Transform.Location);
        if (Distance < 50.0f)
        {
            return true;
        }

        return false;
    }
}

UCLASS()
class UCM_MoveToWaypointClosestToTarget : UCM_Movement
{
    UPROPERTY()
    TArray<FName> Waypoints;

    UCM_MoveToWaypointClosestToTarget(TArray<FName> _Waypoints)
    {
        Waypoints = _Waypoints;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        if (!IsValid(AI.CharacterOfInterest))
        {
            EndTaskAsFailure();
            return;
        }
        
        FName ClosestWaypoint;
        float SmallestDistance = MAX_flt;
        
        for (auto Waypoint : Waypoints)
        {
            FVector Location = InteractionSpots::GetLocationByName(Waypoint);
            if (!Combat.AI.CanGotoPosition(Location))
                continue;

            float Distance = Combat.CharacterOfInterest.NavAgentLocation.Distance(Location);
            if (Distance > SmallestDistance)
                continue;

            SmallestDistance = Distance;
            ClosestWaypoint = Waypoint;
        }

        if (ClosestWaypoint.IsNone())
        {
            EndTaskAsFailure();
            return;
        }

        FInteractionSpotHandle InteractionSpot = FInteractionSpotHandle(ClosestWaypoint);
        float Distance = Combat.Self.NavAgentLocation.Distance(InteractionSpot.Transform.Location);
        if (Distance < 50.0f)
        {
            EndTaskAsSuccess();
            return;
        }

        if (!AI.GotoWaypoint(ClosestWaypoint).WasSuccessful())
        {
            EndTaskAsFailure();
            return;
        }
    }
}