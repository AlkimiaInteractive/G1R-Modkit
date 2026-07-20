struct FWeightedCombatMoveContainer
{
    TArray<FWeightedCombatMove> WeightedCombatMoves;

    void AddCombatMove(UAITask_CombatMove CombatMove, float32 Weight = 1.0f)
    {
        WeightedCombatMoves.Add(FWeightedCombatMove(CombatMove, Weight));
    }

    void AddCombatMove(FWeightedCombatMove WeightedCombatMove)
    {
        WeightedCombatMoves.Add(WeightedCombatMove);
    }

    FWeightedCombatMoveContainer GetMerged(FWeightedCombatMoveContainer OtherContainer)
    {
        FWeightedCombatMoveContainer ReturnContainer;
        for (auto WeightedCombatMove : WeightedCombatMoves)
        {
            ReturnContainer.AddCombatMove(WeightedCombatMove);
        }
        for (auto WeightedCombatMove : OtherContainer.WeightedCombatMoves)
        {
            ReturnContainer.AddCombatMove(WeightedCombatMove);
        }

        return ReturnContainer;
    }

    void Reset()
    {
        WeightedCombatMoves.Reset();
    }
}

struct FWeightedCombatMove
{
    FWeightedCombatMove(UAITask_CombatMove InCombatMove, float32 InWeight)
    {
        CombatMove = InCombatMove;
        Weight = InWeight;
    }

    UAITask_CombatMove CombatMove = nullptr;
    float32 Weight;
    
}

struct FAttackMoveDataContainer
{
    TArray<FAttackMoveData> AttackMoves;

    void AddCombatMove(FAttackMoveData AttackMoveData)
    {
        AttackMoves.Add(AttackMoveData);
    }

    FAttackMoveDataContainer GetMerged(FAttackMoveDataContainer OtherContainer)
    {
        FAttackMoveDataContainer ReturnContainer;
        for (auto AttackMoveData : AttackMoves)
        {
            ReturnContainer.AddCombatMove(AttackMoveData);
        }
        for (auto AttackMoveData : OtherContainer.AttackMoves)
        {
            ReturnContainer.AddCombatMove(AttackMoveData);
        }

        return ReturnContainer;
    }

    void Reset()
    {
        AttackMoves.Reset();
    }
}

enum EAttackUsageType
{
    None,
    Regular,
    Charge,
    Control,
    MAX
}

enum EAttackDirectionRequirement
{
    None,
    Any,
    Front,
    Back,
    NotFront,
    NotBack,
    MAX
}

struct FAttackInfo
{
    FAttackInfo(UCM_Attack InAttackMove, EAttackUsageType InUsageType, TSet<ECombatRole> InAllowedRoles, float InMaxRange = MAX_flt, float InMinRange = 0.0f, float InMaxRelativeHeight = 0.0f, float InMinRelativeHeight = 0.0f, FGameplayTag InRequiredWeaponTag = FGameplayTag(), TSubclassOf<UWeaponDefinition> InRequiredWeaponClass = nullptr, EAttackDirectionRequirement InAttackDirectionRequirement = EAttackDirectionRequirement::Front, bool bInRequiresPathToTarget = true, bool bInRequiresSpecificRelativeHeight = false, bool bInMaxRangeOverride = false)
    {
        AttackMove = InAttackMove;
        MaxRange = InMaxRange;
        MinRange = InMinRange;
        MaxRelativeHeight = InMaxRelativeHeight;
        MinRelativeHeight = InMinRelativeHeight;
        RequiredWeaponTag = InRequiredWeaponTag;
        RequiredWeaponClass = InRequiredWeaponClass;
        UsageType = InUsageType;
        AllowedRoles = InAllowedRoles;
        AttackDirectionRequirement = InAttackDirectionRequirement;
        bMaxRangeOverride = bInMaxRangeOverride;
        bRequiresPathToTarget = bInRequiresPathToTarget;
        bRequiresSpecificRelativeHeight = bInRequiresSpecificRelativeHeight;
    }

    UCM_Attack AttackMove;
    FGameplayTag RequiredWeaponTag = FGameplayTag();
    TSubclassOf<UWeaponDefinition> RequiredWeaponClass;
    float MaxRange = MAX_flt;
    float MinRange = 0.0f;
    float MinRelativeHeight = 0.0f;
    float MaxRelativeHeight = 0.0f;
    EAttackUsageType UsageType;
    TSet<ECombatRole> AllowedRoles;
    EAttackDirectionRequirement AttackDirectionRequirement = EAttackDirectionRequirement::Front;
    bool bMaxRangeOverride = false;
    bool bRequiresPathToTarget = true;
    bool bRequiresSpecificRelativeHeight = false;

    FAttackMoveData GetAttackMoveData(float32 Weight = 1.0f) const
    {
        return FAttackMoveData(FAttackInfo(this), Weight);
    }

    bool IsRangedAttack() const
    {
        return !bRequiresPathToTarget;
    }
}

struct FAttackMoveData
{
    FAttackMoveData(UCM_Attack InAttackMove, float32 InWeight, EAttackUsageType InUsageType = EAttackUsageType::Regular, float InMaxRange = MAX_flt, float InMinRange = 0.0f, float InMaxRelativeHeight = 0.0f, float InMinRelativeHeight = 0.0f, FGameplayTag InRequiredWeaponTag = FGameplayTag(), TSubclassOf<UWeaponDefinition> InRequiredWeaponClass = nullptr, EAttackDirectionRequirement InAttackDirectionRequirement = EAttackDirectionRequirement::None, bool bInRequiresPathToTarget = true, bool bInRequiresSpecificRelativeHeight = false, bool bInMaxRangeOverride = false)
    {
        InAttackMove.MaxRange = InMaxRange;
        InAttackMove.MinRange = InMinRange;
        InAttackMove.MaxRelativeHeight = InMaxRelativeHeight;
        InAttackMove.MinRelativeHeight = InMinRelativeHeight;
        InAttackMove.RequiredWeaponTag = InRequiredWeaponTag;
        InAttackMove.RequiredWeaponClass = InRequiredWeaponClass;
        InAttackMove.AttackDirectionRequirement = InAttackDirectionRequirement;
        InAttackMove.UsageType = InUsageType;
        InAttackMove.bRequiresPathToCharacterOfInterest = bInRequiresPathToTarget;
        InAttackMove.bMaxRangeOverride = bInMaxRangeOverride;
        InAttackMove.bRequiresSpecificRelativeHeight = bInRequiresSpecificRelativeHeight;
        WeightedCombatMove = FWeightedCombatMove(InAttackMove, InWeight);
    }

    FAttackMoveData(FAttackInfo AttackInfo, float32 InWeight)
    {        
        UCM_Attack AttackMove = AttackInfo.AttackMove;
        AttackMove.MaxRange = AttackInfo.MaxRange;
        AttackMove.MinRange = AttackInfo.MinRange;
        AttackMove.MaxRelativeHeight = AttackInfo.MaxRelativeHeight;
        AttackMove.MinRelativeHeight = AttackInfo.MinRelativeHeight;
        AttackMove.RequiredWeaponTag = AttackInfo.RequiredWeaponTag;
        AttackMove.RequiredWeaponClass = AttackInfo.RequiredWeaponClass;
        AttackMove.AttackDirectionRequirement = AttackInfo.AttackDirectionRequirement;
        AttackMove.bRequiresPathToCharacterOfInterest = AttackInfo.bRequiresPathToTarget;
        AttackMove.UsageType = AttackInfo.UsageType;
        AttackMove.bMaxRangeOverride = AttackInfo.bMaxRangeOverride;
        AttackMove.bRequiresSpecificRelativeHeight = AttackInfo.bRequiresSpecificRelativeHeight;
        WeightedCombatMove = FWeightedCombatMove(AttackMove, InWeight);
    }

    FWeightedCombatMove WeightedCombatMove;

    UAITask_CombatMove GetCombatMove() const property
    {
        return WeightedCombatMove.CombatMove;
    }

    float32 GetWeight() const property
    {
        return WeightedCombatMove.Weight;
    }
    
    FGameplayTag GetRequiredWeaponTag() const property
    {
        return Cast<UCM_Attack>(WeightedCombatMove.CombatMove).RequiredWeaponTag;
    }

    TSubclassOf<UWeaponDefinition> GetRequiredWeaponClass() const property
    {
        return Cast<UCM_Attack>(WeightedCombatMove.CombatMove).RequiredWeaponClass;
    }

    float GetMaxRange() const property
    {
        return Cast<UCM_Attack>(WeightedCombatMove.CombatMove).MaxRange;
    }

    float GetMinRange() const property
    {
        return Cast<UCM_Attack>(WeightedCombatMove.CombatMove).MinRange;
    }
}

//////////////////////////////////////////////////////////////
//     MOVEMENT
//////////////////////////////////////////////////////////////

UCLASS()
class UCM_Movement : UAITask_CombatMove
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Movement);

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_MeleeAttack);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_Interact);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_ExecuteCharacter);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_WallClimbing);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Milten_Brazier);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_CanDoTeleport);

    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::State_BeingDraw);
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::AICombatMove_ConsumeItem);
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::State_Block);
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::Debuff_Milten_Brazier);
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::State_CanDoTeleport);

    default bCanBeInterruptedByEverything = true;
    //default bIsBlockedByBlockStateTag = false;

    default IsTickingTask = true;
    
    UPROPERTY()
    EWalkSpeed WalkSpeed = EWalkSpeed::Walking;

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Movement);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        SetCustomPathfollowingSetting(PathFollowingSettings);
    }

    FGothicPathfollowSettings GetPathFollowingSettings() const property
    {
        return Combat.SetupCombatPathfollowingSettings(GetName().ToString());
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_Movement::IsMoveAllowed"));

        if (!UAITask_CombatMove::IsMoveAllowed(Reason))
            return false;

        if (!Combat.ShouldMove())
        {
            Reason = "Should not move right now.";
            return false;
        }

        auto CombatDataModule = DataModule::GetCombatDataModule(Combat.Self);
        if (Combat.Self.HasGameplayTag(GameplayTag::State_Taunt) && 
            IsValid(CombatDataModule) && 
            CombatDataModule.GetLastTauntTags().HasTag(GameplayTag::Action_Taunt_InPlace))
        {
            Reason = "Can't move during current taunt.";
            return false;
        }

        if (IsValid(Combat.CurrentActionCombatMove) && !Combat.CurrentActionCombatMove.CanWalkDuringCombatMove())
        {
            Reason = "Can't move during current main action.";
            return false;
        }

        if (Combat.Self.IsDoingMagic())
        {
            Reason = "Can't move while doing magic.";
            return false;
        }

        if (!Combat.Self.CanMove())
        {
            Reason = "Movement is locked.";
            return false;
        }

        if (Combat.Self.IsParalized())
        {
            Reason = "Character impaired";
            return false;
        }

        if (!Combat.Self.CanWalk())
        {
            Reason = "Character can't move around.";
            return false;
        }

        return true;
    }

    void OnMoveEnded() override
    {
        Super::OnMoveEnded();
        
        StopFollowingActorWhenCombatMoveEnds();
        HandleFailureToMoveCounter();

        if (!IsValid(AI))
            return;

        if (!IsValid(Combat))
            return;

         Combat.SetWalkSpeed(EWalkSpeed::Walking);
    }

    void StopFollowingActorWhenCombatMoveEnds()
    {
        if (!IsValid(AI) || !IsValid(Combat))
            return;

        if (!AI.IsFollowingActor(Combat.CharacterOfInterest))
            return;
            
        AI.StopFollowingActor(Combat.CharacterOfInterest);
    }

    void HandleFailureToMoveCounter()
    {
        if (!IsValid(Combat))
            return;

        if (TaskResult == EGenericTaskResult::Failed)
        {
            Combat.FailureToMoveCounter++;
            return;
        }
        
        Combat.FailureToMoveCounter = 0;
    }

    bool IsLocationReachableWithoutStrafing(FVector Location) const
    {
        if (Combat.Self.IsFacingLocation(Location))
            return true;

        if (Combat.Self.GetTurningRadius() * 2.0f > Combat.Self.GetFeetLocation().Distance(Location))
            return false;

        return true;
    }

    bool GoToLocation(FVector Location)
    {
        if (Combat.Self.CanStrafe())
        {
            CancelTauntsIfNecessary();
            if (AI.GotoPosition(Location).WasSuccessful())
                return true;

            return false;
        }

        if (!IsLocationReachableWithoutStrafing(Location))
        {
            return false;
        }

        CancelTauntsIfNecessary();
        if (AI.GotoPosition(Location, 30.0f).WasSuccessful())
            return true;

        return false;
    }

    void SetWalkSpeedBasedOnDistance(FVector TargetLocation, float ReachDistance)
    {
        WalkSpeed = Combat.BaseSpeed;

        float FarDistance = Combat.Self.SimpleCollisionRadius * Combat.MovementSpeedChangeDistanceToCollisionRadiusRatio;

        float32 PathDistance;
        bool bIsClose = UNavigationSystemV1::DoesPathExistWithinLengthLimit(Combat.Self, Combat.Self.ActorLocation, TargetLocation, FarDistance + ReachDistance, PathDistance);

        if (!bIsClose)
        {
            WalkSpeed = Combat.FarSpeed;
        }

        if (Combat.Self.Velocity.Size2D() > Combat.Self.MovementComponent.MaxSpeed * 0.2f && Combat.Self.GothicMovementComponent.RequestedWalkSpeed == Combat.FarSpeed)
            return;

        if (Combat.Self.GothicMovementComponent.RequestedWalkSpeed == WalkSpeed)
            return;

        Combat.SetWalkSpeed(WalkSpeed);
    }

    void SetMovementSpeed(FVector TargetLocation)
    {
        if (Combat.CanSprint() && // Can sprint
                (Combat.Self.NavAgentLocation.Distance(TargetLocation) > 750.0f))
        {
            Combat.SetWalkSpeed(EWalkSpeed::Sprinting);
        }
        else
        {
            SetWalkSpeedBasedOnDistance(TargetLocation, 30.0f);
        }
    }

    void SetMovementSpeed(AGothicCharacter TargetCharacter, FVector TargetLocation)
    {
        if (Combat.CanSprint() && // Can sprint
                (Combat.Self.NavAgentLocation.Distance(TargetLocation) > 750.0f || // And enemy is very far away
                 (Combat.CharacterOfInterest.IsWalkSpeedSprinting() && Combat.CharacterOfInterest.IsFacingAwayFromOtherCharacter(Combat.Self)))) // Or is sprinting away
        {
            Combat.SetWalkSpeed(EWalkSpeed::Sprinting);
        }
        else
        {
            SetWalkSpeedBasedOnDistance(TargetLocation, 30.0f);
        }
    }

    UFUNCTION()
    void CancelTauntsIfNecessary()
    {
        // Cancel taunts if necessary
        if (!Combat.bCanDoTauntsWhileMoving && Combat.IsDoingMoveWithTag(GameplayTag::Action_Taunt) && IsValid(Combat.BehaviorController))
        {
            Combat.BehaviorController.CancelAllCurrentActions();
        }
    }

    UFUNCTION()
    bool IsMovingTowardsAttackSegment()
    {
        FVector Velocity = Combat.AI.Character.MovementComponent.Velocity;
        if (Velocity.Size() < 0.1f)
            return false;

        float TimeHorizonSeconds = 1.0f;

        auto AvailableGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Attackers);

        for (auto Group : AvailableGroups)
        {
            auto AttackerGroup = Cast<UAIGroup_Attackers>(Group);
            if (!IsValid(AttackerGroup))
                continue;

            if (AttackerGroup.WillCharacterMoveBlockAnyAttackVector(Combat.Self, TimeHorizonSeconds))
                return true;
        }

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        if (IsMovingTowardsAttackSegment())
        {
            // DebugScript::DrawLine(AI.Character.FeetLocation, AI.Character.ActorLocation + FVector::UpVector * 200.f, FColor::Purple, 10.f, 3.f);
            AI.AIController.StopMovement();
            EndTaskAsFailure();
        }
    }
}

/** Move away from other Non Enemy nearby characters */
UCLASS(Abstract)
class UCM_SpreadOut_Base : UCM_Movement
{
    /** Minimal distance that Self should have to any other character */
    float MinDistanceBetweenCollisions = 10.f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask(); 

        TArray<AGothicCharacter> NearbyCharacters;
        if (!AreOtherCharactersNearby(NearbyCharacters))
        {
           EndTaskAsFailure();
           return;
        }

        FVector GoToLocation;
        if (!UCharacterPersonalSpaceSubsystem::TryFindSpreadOutLocationWithinGroup(Self, NearbyCharacters,
         GetMoveDistance(Self), GetMinMoveDistance(Self), GoToLocation))
        {
            //DebugScript::DrawLine(Self.NavAgentLocation, Self.NavAgentLocation + FVector::UpVector * 200, FColor::Red, 8.f, 1.f);
            EndTaskAsFailure();
            return;
        }

        Combat.SetWalkSpeed(EWalkSpeed::Running);
        ApplyPathfollowSettingsForMovingNearOthers();

        AI.GotoPosition(GoToLocation, GetReachDistance(Self));
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker))
            return false;

         if (Combat.GetController() == nullptr)
            return false;

        if (Combat.GetController().MoveStatus == EPathFollowingStatus::Moving)
            return false;

        TArray<AGothicCharacter> NearbyCharacters;
        if (AreOtherCharactersNearby(NearbyCharacters))
        {
            return true;
        }
        
        return false;
    }

    /** Copy of Self.AreOtherCharactersNearby, because we need to use the individual move distance of nearby characters as internal parameter */
    bool AreOtherCharactersNearby(TArray<AGothicCharacter>& NearbyCharacters) const
    {
        auto NASS = UNearbyActorsSubsystem::Get();

        // expects that there is no other Agent that has more than 4 times my size
        TArray<AActor> OtherCharacters = NASS.FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), Combat.Self.ActorLocation, GetSearchNearbyCharactersRadius());
        OtherCharacters.Remove(Combat.Self);

        for (auto& Actor : OtherCharacters)
        {
            AGothicCharacter OtherCharacter = Cast<AGothicCharacter>(Actor);
            
            if (OtherCharacter.IsDead() || OtherCharacter.IsDefeated())
                continue;

            float Threshold = GetConsiderCharacterAsCloseEnoughRadius(OtherCharacter);
            if (OtherCharacter.ActorLocation.Dist2D(Combat.Self.ActorLocation) < Threshold)
            {
                NearbyCharacters.Add(Cast<AGothicCharacter>(Actor));
            }
        }

        return !NearbyCharacters.IsEmpty();
    }

    float GetReachDistance(AGothicCharacter Character) const
    {
        return Character.SimpleCollisionRadius;
    }

    float GetSearchNearbyCharactersRadius() const
    {
        // this assumes there is no agent larger than is 7 times my side. Failsafe: clamped to be at least CloseEnoughRadius
        return Math::Max(Combat.Self.SimpleCollisionRadius * 7.f, GetConsiderCharacterAsCloseEnoughRadius(Combat.Self));
    }

    float GetConsiderCharacterAsCloseEnoughRadius(AGothicCharacter OtherCharacter) const
    {
        // if I would move towards a another character, and he with the same move distance towards me, we end up in a spread out situation again. 
        return GetMoveDistance(Combat.Self) - GetReachDistance(Combat.Self) + GetMoveDistance(OtherCharacter) - GetReachDistance(OtherCharacter) + MinDistanceBetweenCollisions;
    }

    /** Preferred move distance: based on CrowdAgentRadius because this defines how much distance to keep */
    float GetMoveDistance(AGothicCharacter Character) const
    {
        return Character.CrowdAgentRadius + MinDistanceBetweenCollisions + GetReachDistance(Character);
    }

    /** Minimal acceptable move distance: based on SimpleCollisions */
    float GetMinMoveDistance(AGothicCharacter Character) const
    {
        return Character.SimpleCollisionRadius + MinDistanceBetweenCollisions + GetReachDistance(Character);
    }

    void ApplyPathfollowSettingsForMovingNearOthers()
    {
        FGothicPathfollowSettings Settings = AvatarAIController.CurrentPathfollowSetting;
        Settings.DebugOwnerName = "UCM_SpreadOut";
        Settings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::AvoidAllAgents;
        Settings.CrowdAvoidanceQuality = EScriptableCrowdAvoidanceQuality::High_BoldMove;   // less shy
        Settings.ModifyAvoidVelocitySettings.FastSpeedVelocityMultiplier = 1.0f;    // move at full speed when another character runs towards me
        Settings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.8f;  
        Settings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.8f;   // have at least 80% MaxSpeed when other is nearby
        Settings.bSlowDownAtGoal = false;

        // restore base settings in order to make character slip with slimmer radius between others. This ensures less detour 
        Settings.AgentRadiusMultiplier = Self.CharacterState.DefaultPathfollowingSetting.AgentRadiusMultiplier;
        Settings.CrowdAgentSeparationWeight = Self.CharacterState.DefaultPathfollowingSetting.CrowdAgentSeparationWeight;

        SetCustomPathfollowingSetting(Settings);
    }
}

UCLASS()
class UCM_SpreadOut_Strafer : UCM_SpreadOut_Base
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
    }

    // TODO adapt find good location alogrithm for non strafers

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

       return true;
    }
}

UCLASS()
class UCM_MoveUntilCloseToEnemy : UCM_Movement
{
    UCM_MoveUntilCloseToEnemy(float InReachDistance)
    {
        ReachDistance = InReachDistance;
    }

    /** Character must be closer than this for the move to end */
    UPROPERTY()
    float ReachDistance = 100.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        while (Self.GetDistanceTo(Combat.CharacterOfInterest) > ReachDistance)
        {
            SetMovementSpeed(Combat.CharacterOfInterest, Combat.CharacterOfInterest.NavAgentLocation);

            if (!AI.IsFollowingActor(Combat.CharacterOfInterest))
            {
                CancelTauntsIfNecessary();
                AI.StartFollowingActor(Combat.CharacterOfInterest, ReachDistance, false);
            }

            WaitOneTick();
        }

        AI.StopFollowingActor(Combat.CharacterOfInterest);
    }
}

UCLASS()
class UCM_AdjustToSelectedAttackRelativeHeightRequirement : UCM_Movement
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Movement_AttackMove);
    private AGothicCharacter FollowTarget;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.StopFollowingActor(Combat.CharacterOfInterest);
        AI.StopGoingToWaypoint();
        
        Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackStarted = FInGameTime::Now();
        
        Super::DoTask();

        if (!IsValid(this))
        {
            Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackEnded = FInGameTime::Now();
            return;
        }

        FollowTarget = Combat.CharacterOfInterest;

        StartFollowingCharacterOfInterest();

        while(!IsWithinRequiredRelativeHeight())
        {
            // TODO @pblanes: this is how to test the requested ZDivergeHeight
            // FVector FoundNavLocation; // this out value should only be used as GoTo location if we would not have it already
            // FVector LocationToZDivergeTo = FVector(Combat.Self.ActorLocation.X, Combat.Self.ActorLocation.Y, Combat.Controller.GetRequestedWorldSpaceZDivergeHeight());
            // if (!UNavigationSystemV1::CanLocationBeReached3D(Combat.Self, LocationToZDivergeTo, Combat.Self.SimpleCollisionRadius, 20.f, true, false, FoundNavLocation))
            // {
            //     DebugScript::DrawText(Combat.Self.ActorLocation, "Cannot swim/fly at that height: there is a ground/roof in the way", FColor::Orange);
            //     DebugScript::DrawLine(Combat.Self.ActorLocation, LocationToZDivergeTo, FColor::Orange, 3.f);
            //     // dont return false: this is not a failure right now, but a warning!
            // }

            if (!ShouldKeepMoving())
            {
                AI.StopFollowingActor();
                EndTaskAsSuccess();
                return;
            }

            if (!ShouldKeepFollowing())
            {
                AI.StopFollowingActor();
            }
            else if (!AI.IsFollowingActor(FollowTarget))
            {
                StartFollowingCharacterOfInterest();
            }

            WaitOneTick();
        }

        Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackEnded = FInGameTime::Now();
    }

    UFUNCTION()
    bool ShouldKeepFollowing() const
    {
        return true;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsEnemy::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "CharacterOfInterest is nullptr";
            return false;
        }

        return true;
    }

    void OnMoveEnded() override
    {
        if (IsValid(FollowTarget))
        {
            AI.StopFollowingActor(FollowTarget);
        }

        Super::OnMoveEnded();        
    }

    UFUNCTION()
    void StartFollowingCharacterOfInterest()
    {
        if (!IsValid(Combat.CharacterOfInterest))
            return;

        Combat.SetWalkSpeed(EWalkSpeed::Running);
        CancelTauntsIfNecessary();
        SetCustomPathfollowingSetting(PathFollowingSettings);
        AI.StartFollowingActor(FollowTarget, Math::Max(30.0f, Combat.DistanceToCharacterOfInterest));
    }

    bool ShouldKeepMoving() const
    {
        if (!IsValid(Combat) || !Combat.IsAttackSelected())
            return false;

        return true;
    }

    bool IsWithinRequiredRelativeHeight() const
    {
        if (Combat == nullptr || Combat.SelectedAttack == nullptr)
            return true;

        if (!Combat.SelectedAttack.bRequiresSpecificRelativeHeight)
            return true;

        return  Combat.HeightRelativeToCharacterOfInterest >= Combat.SelectedAttack.MinRelativeHeight &&
                Combat.HeightRelativeToCharacterOfInterest <= Combat.SelectedAttack.MaxRelativeHeight;
    }
}

UCLASS()
class UCM_MoveBackOntoNavMesh : UCM_Movement
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (Controller == nullptr || AvatarCharacter == nullptr)
        {
            EndTaskAsFailure();
            return;
        }

        // usually any navigation request makes characters return to the LastValidNavLocation first before doing the actual move
        // but sometimes we want to do that explicitly
        float ReachRadius = AvatarCharacter.SimpleCollisionRadius * 0.5f;
        EGenericTaskResult Result = AI.GotoPosition(Controller.TryGetValidNavLocation(), ReachRadius, 5.f).Result; 
        
        if (Result == EGenericTaskResult::Success)
        {
            EndTaskAsSuccess();
        }
        else if (Result == EGenericTaskResult::Cancelled)
        {
            EndTaskAsCancelled();
        }
        else
        {
            EndTaskAsFailure();
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        AGothicCharacter Character = Combat.AvatarCharacter;
        if (Character == nullptr)
        {
            Reason = "No Character: then there is no NavMesh anyways";
            return false;
        }

        if (Character.NavAgentLocation.DistSquared2D(Combat.Controller.TryGetValidNavLocation()) < Character.SimpleCollisionRadius * Character.SimpleCollisionRadius)
        {
            Reason = "Character is already on valid NavMesh";
            return false;
        }

        return true;
    }
}

/** Moves character back into Combat Territory or Dailyroutine Territory. The move stops once the character enters the territory */
UCLASS()
class UCM_MoveBackIntoTerritory : UCM_Movement
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        const UTerritoryConfig TargetTerritory;
        if (IsValid(Combat.Territory))
        {
            TargetTerritory = Combat.Territory;
        }
        else if (IsValid(Combat.AI.GetCurrentTerritory()))
        {
            TargetTerritory = Combat.AI.GetCurrentTerritory();
        }
        else
        {
            EndTaskAsFailure();
            return;
        }

        UTerritorySubsystem TerritorySS = UTerritorySubsystem::Get();
        
        FVector RandomPoint;
        if (!TerritorySS.TryGetRandomNavigablePointWithinTerritory(CharacterState, TargetTerritory, RandomPoint))
        {
            EndTaskAsFailure();
            return;
        }

        AI.GotoPosition(RandomPoint).While(n"ShouldKeepMoving");
        
        EndTaskAsSuccess();
    }
    
    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        return !IsInAnyTerritory();
    }

    UFUNCTION()
    bool ShouldKeepMoving() const
    {
        return !IsInAnyTerritory();
    }

    /** Is character located inside either Combat territory or DailyRoutine territory */
    bool IsInAnyTerritory() const
    {
        auto CurrentDailyRoutineTerritory = Combat.AI.GetCurrentTerritory();

        bool bDailyRoutineTerritoryExists = IsValid(CurrentDailyRoutineTerritory);
        bool bCombatTerritoryExists = IsValid(Combat.Territory);  

        if (!bDailyRoutineTerritoryExists && !bCombatTerritoryExists)
            return false;

        if (bDailyRoutineTerritoryExists && CharacterState.IsCharacterStateWithinTerritory(CurrentDailyRoutineTerritory))
            return true;

        if (bCombatTerritoryExists && CharacterState.IsCharacterStateWithinTerritory(Combat.Territory))
            return true;

        return false;
    }
}


UCLASS()
class UCM_MoveTowardsEnemy : UCM_Movement
{
    UCM_MoveTowardsEnemy(float InDistance)
    {
        Distance = InDistance;
    }

    UPROPERTY()
    float _Distance = -1.0f;

    UPROPERTY()
    float SpecifiedDistance = -1.0f;

    private AGothicCharacter FollowTarget;

    float GetDistance() const property
    {
        return _Distance;
    }

    float GetExpectedDistance() const property
    {
        return _Distance;
    }

    void SetDistance(float Value) property
    {
        _Distance = Value;
    }

    float GetFollowDistance()
    {
        if (FollowTarget == nullptr)
            return 0.0f;

        return Math::Max(0.0f, ExpectedDistance);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        float ReachDistance = Math::Max(0.0f, Distance);
        FollowTarget = Combat.CharacterOfInterest;

        StartFollowingCharacterOfInterest();

        while(!IsWithinDistanceRange() || !IsWithinRequiredRelativeHeight() || ShouldKeepMoving())
        {
            if (!IsValid(Combat.CharacterOfInterest))
            {
                EndTaskAsCancelled();
                return;
            }

            if (!ShouldKeepMoving())
            {
                AI.StopFollowingActor();
                EndTaskAsSuccess();
                return;
            }

            if (!ShouldKeepFollowing())
            {
                AI.StopFollowingActor();
            }
            else if (!AI.IsFollowingActor(FollowTarget))
            {
                StartFollowingCharacterOfInterest();
            }

            if (Combat.CanSprint() && // Can sprint
                (Combat.DistanceToCharacterOfInterest > 750.0f || // And enemy is very far away
                 /*(Combat.CharacterOfInterest.IsWalkSpeedSprinting() &&*/ Combat.CharacterOfInterest.IsFacingAwayFromOtherCharacter(Combat.Self))) // Or is sprinting away
            {
                Combat.SetWalkSpeed(EWalkSpeed::Sprinting);
            }
            else
            {
                SpecifiedDistance = GetFollowDistance();
                if (Combat.Self.FeetLocation.Distance(FollowTarget.FeetLocation) - ReachDistance >= Combat.Self.SimpleCollisionRadius * Combat.MovementSpeedChangeDistanceToCollisionRadiusRatio)
                {
                    Combat.SetWalkSpeed(Combat.FarSpeed);
                    WaitOneTick();
                    continue;
                }
                
                if (Combat.CharacterState.Character.GetWalkSpeed() == EWalkSpeed::Sprinting)
                {
                    Combat.SetWalkSpeed(Combat.FarSpeed);
                    WaitOneTick();
                    continue;
                }
                
                SetWalkSpeedBasedOnDistance(Combat.CharacterOfInterest.GetFeetLocation(), 2.0f * SpecifiedDistance);
            }

            WaitOneTick();
        }
    }

    UFUNCTION()
    bool IsWithinDistanceRange() const
    {
        float DistanceToFeet = FollowTarget.FeetLocation.Distance(Self.FeetLocation);
        return DistanceToFeet - Self.SimpleCollisionRadius - FollowTarget.SimpleCollisionRadius <= SpecifiedDistance;
    }

    UFUNCTION()
    bool IsWithinRequiredRelativeHeight() const
    {
        return true;
    }

    UFUNCTION()
    bool ShouldKeepMoving() const
    {
        return !IsWithinRequiredRelativeHeight() || ShouldKeepFollowing();
    }

    UFUNCTION()
    bool ShouldKeepFollowing() const
    {
        return true;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsEnemy::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "CharacterOfInterest is nullptr";
            return false;
        }

        if (Distance <= 0.0f)
        {
            Reason = f"Invalid reach distance: {Distance}";
            return false;
        }

        if (Combat.DistanceToCharacterOfInterest >= Distance - 30.0f && Combat.DistanceToCharacterOfInterest <= Distance + 30 )
        {
            Reason = "Distance to target too close to required distance to move";
            return false;
        }

        if (!Combat.IsTargetReachable(Distance + 30.0f - Combat.CharacterOfInterest.SimpleCollisionRadius))
        {
            Reason = "Target can't be reached";
            return false;
        }

        return true;
    }

    void OnMoveEnded() override
    {
        if (IsValid(FollowTarget))
        {
            AI.StopFollowingActor(FollowTarget);
        }

        Super::OnMoveEnded();        
    }

    UFUNCTION()
    void StartFollowingCharacterOfInterest()
    {
        if (!IsValid(Combat.CharacterOfInterest))
            return;

        if (Combat.CanSprint() && // Can sprint
                (Combat.DistanceToCharacterOfInterest > 750.0f || // And enemy is very far away
                 (Combat.CharacterOfInterest.IsWalkSpeedSprinting() && Combat.CharacterOfInterest.IsFacingAwayFromOtherCharacter(Combat.Self)))) // Or is sprinting away
        {
            Combat.SetWalkSpeed(EWalkSpeed::Sprinting);
        }
        else
        {
            SpecifiedDistance = GetFollowDistance();
            SetWalkSpeedBasedOnDistance(Combat.CharacterOfInterest.GetFeetLocation(), 2.0f * SpecifiedDistance);
        }

        CancelTauntsIfNecessary();
        SetCustomPathfollowingSetting(PathFollowingSettings);
        
        AI.StartFollowingActor(FollowTarget, 50.0f);
    }

    FString GetDisplayName() const override
    {
        return Super::GetDisplayName() + f" - {SpecifiedDistance}";
    }
}

UCLASS()
class UCM_MoveTowardsEnemyToPreferredDistance : UCM_MoveTowardsEnemy
{
    float GetDistance() const override property
    {
        return Combat.Config.PreferredDistance;
    }

    float GetExpectedDistance() const override property
    {
        return Combat.Config.PreferredDistance;
    }
}

UCLASS()
class UCM_MoveTowardsEnemyToPreferredDistance_UntilOutOfTerritory : UCM_MoveTowardsEnemyToPreferredDistance
{
    bool ShouldKeepMoving() const override
    {
        if (!Combat.IsTargetReachable(100.0f))
            return false;

        auto CurrentDailyRoutineTerritory = Combat.AI.GetCurrentTerritory();
        if (IsValid(CurrentDailyRoutineTerritory) && IsValid(Combat.Territory) &&
            !Combat.AI.CharacterState.IsCharacterStateWithinTerritory(Combat.Territory) &&
            !Combat.AI.CharacterState.IsCharacterStateWithinTerritory(CurrentDailyRoutineTerritory))
        {
            return false;
        }


        if (IsValid(CurrentDailyRoutineTerritory) && !IsValid(Combat.Territory) &&
            !Combat.AI.CharacterState.IsCharacterStateWithinTerritory(CurrentDailyRoutineTerritory))
        {
            return false;
        }

        if (!IsValid(CurrentDailyRoutineTerritory) && IsValid(Combat.Territory) &&
            !Combat.AI.CharacterState.IsCharacterStateWithinTerritory(Combat.Territory))
        {
            return false;
        }

        return Super::ShouldKeepMoving();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        float VerticalReach = Combat.AI.Character.SimpleCollisionHalfHeight * 2 + Combat.CharacterOfInterest.SimpleCollisionHalfHeight;

        FVector Location;
        if (!UNavigationSystemV1::CanTargetBeReached3D(
                Combat.AI.Character, 
                Combat.CharacterOfInterest, 
                150.0f, 
                VerticalReach, 
                false, Location))
        {
            Reason = "Target is unreachable";
            return false;
        }

        return Super::IsMoveAllowed(Reason);
    }
}

UCLASS()
class UCM_MoveTowardsTargetToSelectedAttackRange : UCM_MoveTowardsEnemy
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Movement_AttackMove);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.StopFollowingActor(Combat.CharacterOfInterest);
        AI.StopGoingToWaypoint();

        Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackStarted = FInGameTime::Now();

        Super::DoTask();

        Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackEnded = FInGameTime::Now();
    }

    float GetDistance() const override property
    {
        if (Combat.TargetCharacter == nullptr)
            return 30.0f + Combat.Self.SimpleCollisionRadius;

        if (!Combat.IsAttackSelected() || Combat.SelectedAttack.MinRange == 0.0f)
            return Combat.TargetCharacter.SimpleCollisionRadius + Combat.Self.SimpleCollisionRadius;

        if (Combat.SelectedAttack.MinRange > 0.0f)
            return Combat.SelectedAttack.MinRange;

        return 30.0f;
    }

    float GetExpectedDistance() const override property
    {
        if (Combat.SelectedAttack == nullptr)
            return 0.0f;
        
        return Combat.SelectedAttack.Range * 0.85f;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsTargetToSelectedAttackRange::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!IsValid(Combat.SelectedAttack))
        {
            Reason = "No attack selected";
            return false;
        }

        FString AttackNotAllowedReason;
        if (Combat.SelectedAttack.IsMoveAllowed(AttackNotAllowedReason))
        {
            Reason = "Already in position to execute selected attack";
            return false;
        }

        return true;
    }

    bool ShouldKeepMoving() const override
    {
        if (!IsValid(Combat) || !Combat.IsAttackSelected())
            return false;

        return Super::ShouldKeepMoving();
    }

    bool ShouldKeepFollowing() const override
    {
        return true;
        // return !IsWithinDistanceRange() || !IsWithinRequiredRelativeHeight();
    }

    bool IsWithinRequiredRelativeHeight() const override
    {
        if (Combat == nullptr || Combat.SelectedAttack == nullptr)
            return Super::IsWithinRequiredRelativeHeight();

        if (!Combat.SelectedAttack.bRequiresSpecificRelativeHeight)
            return true;

        return  Combat.HeightRelativeToCharacterOfInterest >= Combat.SelectedAttack.MinRelativeHeight &&
                Combat.HeightRelativeToCharacterOfInterest <= Combat.SelectedAttack.MaxRelativeHeight;
    }
}

UCLASS()
class UCM_MoveAwayFromTargetToSelectedAttackRange : UCM_MoveAwayFromEnemy
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Movement_AttackMove);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.StopFollowingActor();
        AI.StopGoingToWaypoint();

        Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackStarted = FInGameTime::Now();

        Super::DoTask();

        Combat.SelectedAttackHandler.LastTimeCharacterMoveToAttackEnded = FInGameTime::Now();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveAwayFromTargetToSelectedAttackRange::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;
 
        if (!Combat.Self.CanStrafe() && Distance - Combat.Self.FeetLocation.Distance(Combat.CharacterOfInterest.FeetLocation) < 400.0f)
        {
            Reason = "Distance is too small and agent can't strafe";
            return false;
        }

        return true;
    }

    float GetDistance() const override property
    {
        if (!Combat.IsAttackSelected())
            return Combat.Config.PreferredDistance;

        return Combat.SelectedAttack.MinRange * 1.25f;        
    }

    bool ShouldKeepMoving() const override
    {
        if (!IsValid(Combat) || !Combat.IsAttackSelected())
            return false;

        return Super::ShouldKeepMoving();
    }

    bool IsWithinRequiredRelativeHeight() const override
    {
        if (Combat == nullptr || Combat.SelectedAttack == nullptr)
            return Super::IsWithinRequiredRelativeHeight();

        if (!Combat.SelectedAttack.bRequiresSpecificRelativeHeight)
            return true;

        return  Combat.HeightRelativeToCharacterOfInterest >= Combat.SelectedAttack.MinRelativeHeight &&
                Combat.HeightRelativeToCharacterOfInterest <= Combat.SelectedAttack.MaxRelativeHeight;
    }
}

UCLASS()
class UCM_MoveTowardsTargetUntilSelectedAttackWouldNotHitCollision : UCM_MoveTowardsEnemy
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Movement_AttackMove);

    float GetDistance() const override property
    {
        if (Combat.TargetCharacter == nullptr)
            return 30.0f + Combat.Self.SimpleCollisionRadius;

        if (!Combat.IsAttackSelected() || Combat.SelectedAttack.MinRange == 0.0f)
            return Combat.TargetCharacter.SimpleCollisionRadius + Combat.Self.SimpleCollisionRadius;

        if (Combat.SelectedAttack.MinRange > 0.0f)
            return Combat.SelectedAttack.MinRange;

        return 30.0f;
    }

    float GetExpectedDistance() const override property
    {
        if (Combat.SelectedAttack == nullptr)
            return 0.0f;
        
        return Combat.SelectedAttack.Range * 0.85f;
    }

    bool ShouldKeepMoving() const override
    {
        if (Combat.SelectedAttack == nullptr)
            return false;

        if (!Combat.SelectedAttack.WouldAttackCollideWithWall() &&
            !Combat.SelectedAttack.WouldAttackHitFriendly() &&
            Combat.CanMoveToTargetIntoAttackReachInStraightLine(Combat.SelectedAttack.Reach))
            return false;

        return true;
    }
}

UCLASS()
class UCM_MoveTowardsEnemyUntilLedge : UCM_Movement
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        FVector StartPosition = Combat.Self.GetFeetLocation();
        FVector Direction = (Combat.CharacterOfInterest.GetFeetLocation() - StartPosition).GetSafeNormal2D();
        float Distance = StartPosition.Dist2D(Combat.CharacterOfInterest.GetFeetLocation(), FVector::UpVector);

        Combat.SetWalkSpeed(Combat.BaseSpeed);
        CancelTauntsIfNecessary();
        
        EndTaskWithResult(AI.GoIntoDirection(Direction, Distance, 30.0f).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsEnemyUntilLedge::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        FVector StartPosition = Combat.Self.GetFeetLocation();
        FVector Direction = (Combat.CharacterOfInterest.GetFeetLocation() - StartPosition).GetSafeNormal2D();
        float DistanceToTarget2D = StartPosition.Dist2D(Combat.CharacterOfInterest.GetFeetLocation(), FVector::UpVector);
        FVector EndPosition;

        UNavigationSystemV1::NavigationRaycast(Combat.Self.GetFeetLocation(), Combat.Self.GetFeetLocation() + Direction * DistanceToTarget2D, EndPosition);
        float DistanceToLedge = StartPosition.Distance(EndPosition);

        if (DistanceToLedge <= 30.0f)
        {
            Reason = "Destination is too close to move";
            return false;
        }
        return true;
    }
}

UCLASS()
class UCM_MoveAwayFromLedge : UCM_Movement
{
    UCM_MoveAwayFromLedge(float InDistanceToKeep)
    {
        DistanceToKeep = InDistanceToKeep;
    }

    UPROPERTY()
    float DistanceToKeep = 100.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        FVector StartPosition = Combat.Self.GetFeetLocation();
        FVector Direction = (Combat.CharacterOfInterest.GetFeetLocation() - StartPosition).GetSafeNormal2D();

        FVector EndPosition;

        UNavigationSystemV1::NavigationRaycast(Combat.Self.GetFeetLocation(), Combat.Self.GetFeetLocation() + Direction * DistanceToKeep, EndPosition);

        float Distance = StartPosition.Dist2D(EndPosition, FVector::UpVector);
        float DistanceToMove = 0.0f;

        DistanceToMove = Math::Min(DistanceToKeep + 30.0f - Distance, 40.0f);

        Combat.SetWalkSpeed(Combat.BaseSpeed);
        CancelTauntsIfNecessary();
        
        EndTaskWithResult(AI.GoIntoDirection(-Direction, DistanceToMove).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveAwayFromLedge::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        FVector StartPosition = Combat.Self.GetFeetLocation();
        FVector Direction = (Combat.CharacterOfInterest.GetFeetLocation() - StartPosition).GetSafeNormal2D();
        
        FVector EndPosition;

        UNavigationSystemV1::NavigationRaycast(Combat.Self.GetFeetLocation(), Combat.Self.GetFeetLocation() + Direction * DistanceToKeep, EndPosition);

        float Distance = StartPosition.Dist2D(EndPosition, FVector::UpVector);

        if (Distance >= DistanceToKeep + 30.0f)
        {
            Reason = "Destination is too close to move";
            return false;
        }

        return true;
    }
}

UCLASS()
class UCM_MoveToDistanceRange : UCM_Movement
{
    UCM_MoveToDistanceRange(float InMinDistance, float InMaxDistance)
    {
        MinDistance = InMinDistance;
        MaxDistance = InMaxDistance;
    }

    UPROPERTY()
    float MinDistance = 30.0f;
    
    UPROPERTY()
    float MaxDistance = 2000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        FVector StartPosition = Combat.Self.GetFeetLocation();
        FVector Direction = (Combat.CharacterOfInterest.GetFeetLocation() - StartPosition).GetSafeNormal2D();

        float Distance = StartPosition.Dist2D(Combat.CharacterOfInterest.GetFeetLocation(), FVector::UpVector);
        float DistanceToMove = 0.0f; 

        if (Distance < MinDistance + 30.0f)
        {
            Direction = -Direction;
            DistanceToMove = MinDistance + 30.0f - Distance;
        }
        else
        {
            DistanceToMove = MaxDistance - 30.0f - Distance;
        }

        SetWalkSpeedBasedOnDistance(StartPosition + Direction * DistanceToMove, 30.0f);
        CancelTauntsIfNecessary();
        
        EndTaskWithResult(AI.GoIntoDirection(Direction, DistanceToMove).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveToDistanceRange::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        FVector StartPosition = Combat.Self.GetFeetLocation();
        float Distance = StartPosition.Dist2D(Combat.CharacterOfInterest.GetFeetLocation(), FVector::UpVector);

        if (Distance <= MaxDistance - 30.0f && Distance >= MinDistance + 30.0f)
        {
            Reason = "Already within distance range or too close to it to move";
            return false;
        }

        return true;
    }
}

UCLASS()
class UCM_MoveAwayFromEnemy : UCM_Movement
{
    UCM_MoveAwayFromEnemy(float InDistance)
    {
        _Distance = InDistance;
    }

    UPROPERTY()
    bool bKeepFacingTarget = true;

    UPROPERTY()
    float _Distance = -1.0f;

    float GetDistance() const property
    {
        return _Distance;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (Combat.DistanceToCharacterOfInterest < 0.0f)
        {
            EndTaskAsFailure();
            return;
        }

		float MoveDistance = GetDistanceToMove();
		if (MoveDistance <= 0)
		{
			EndTaskAsFailure();
			return;
		}

		AI.StopFollowingActor(Combat.CharacterOfInterest);

        AI.SetTargetEnemy(Combat.CharacterOfInterest, EGothicFocusPriority::CombatMove, this);

        CancelTauntsIfNecessary();

        while (ShouldKeepMoving())
        {     
            if (!AI.Character.IsPathfollowing())
            {
                FVector MoveAwayNavLocation;
                if (!TryFindValidNavLocationToMoveTo3D(MoveDistance, MoveAwayNavLocation))
                {
                    EndTaskAsFailure();
                    return;
                }

                if (!AI.GotoPosition(MoveAwayNavLocation).While(n"GoIntoDirectionCondition").WasSuccessful())
                {
                    EndTaskAsFailure();
                    return;
                }
			}

			WaitSeconds(0.5f);
        }
    }

    float GetDistanceToMove() const
    {
        return Math::Max(Distance - Combat.DistanceToCharacterOfInterest, 0);
    }

	/** Tries to find a valid NavLocation location away from the current target. Will not take others into account but will also not select a NavLocation where another character is standing.
	 * For flying and swimming characters the location is tested if its reachable with the current requested ZDivege Height
	 */
	bool TryFindValidNavLocationToMoveTo3D(float WantedMoveDistance, FVector& OutLocation) const
	{
        if (Combat.Self == nullptr)
            return false;
        
        if (Combat.TargetCharacter == nullptr)
            return false;
		
        TArray<AGothicCharacter> CharactersToMoveAwayFrom;
		CharactersToMoveAwayFrom.Add(Combat.TargetCharacter);
		if (!UCharacterPersonalSpaceSubsystem::TryFindSpreadOutLocationWithinGroup(Combat.Self, CharactersToMoveAwayFrom, WantedMoveDistance, WantedMoveDistance * 0.5f, OutLocation))
		{
			return false;
		}

		if (Combat.Self.GothicMovementComponent.MovementMode == EMovementMode::MOVE_Swimming ||
			Combat.Self.GothicMovementComponent.MovementMode == EMovementMode::MOVE_Flying)
		{
			FVector FoundNavLocation; // this out value should only be used as GoTo location if we would not have it already
			FVector LocationToFlyTo = FVector(OutLocation.X, OutLocation.Y, Combat.Controller.GetRequestedWorldSpaceZDivergeHeight());
			return UNavigationSystemV1::CanLocationBeReached3D(Combat.Self, LocationToFlyTo, Combat.Self.SimpleCollisionRadius, 20.f, true, false, FoundNavLocation);
		}

		return true;
	}

	bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveAwayFromEnemy::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.DistanceToCharacterOfInterest > Distance)
        {
            Reason = "DistanceToCharacterOfInterest is larger than Distance";
            return false;
        }

        float MoveDistance = GetDistanceToMove();
        if (MoveDistance <= 0)
        {
            Reason = "MoveDistance is 0 or smaller. Most likely MinRange of SelectedAttack is 0.";
            return false;
        }
 
        FVector MoveAwayNavLocation;
        if (!TryFindValidNavLocationToMoveTo3D(MoveDistance, MoveAwayNavLocation))
        {
            Reason = "Found no valid NavLocation or the requested ZDivergeHeight could not reached there";
            return false;
        }
        
        return true;
    }

    UFUNCTION()
    bool GoIntoDirectionCondition() const
    {
        return ShouldKeepMoving();
    }

    UFUNCTION()
    bool ShouldKeepMoving() const
    {
        if (IsTooClose())
            return true;

        if (!IsWithinRequiredRelativeHeight())
            return true;

        return false;
    }

    UFUNCTION()
    bool IsTooClose() const
    {
        return Combat.DistanceToCharacterOfInterest <= Distance;
    }

    UFUNCTION()
    bool IsWithinRequiredRelativeHeight() const
    {
        return true;
    }
}

UCLASS()
class UCM_MoveAwayToPreferredDistance : UCM_MoveAwayFromEnemy
{
    float GetDistance() const override property
    {
        return Combat.Config.PreferredDistance;
    }
}

/** Base class for all moves that should stop movement */
UCLASS()
class UCM_StopMoving : UAITask_CombatMove
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        StopMoving();
    }

    void StopMoving()
    {
        AI.StopFollowingActor(Combat.CharacterOfInterest);
        AI.StopGoingToWaypoint();

        if (Combat.BehaviorController == nullptr)
        {
            return;
        }

        if (Combat.BehaviorController.MovementTree == nullptr)
        {
            return;
        }

        Combat.BehaviorController.CancelCurrentMovement();
    }
}

//////////////////////////////////////////////////////////////
//     DODGE
//////////////////////////////////////////////////////////////

/** Dodge base class for identification of dodge moves */
UCLASS()
class UCM_Dodge : UCM_StopMoving
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_LockRoles);
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Dodge);

    default IgnoreBlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_CanDodge);

    default CooldownSeconds = 0.0f;
    default bCanBeInterruptedByReaction = false;

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge, 0.0f);

    UPROPERTY()
    USensedIncommingAttack AttackToDodge = nullptr;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (AttackToDodge != nullptr 
            && (AttackToDodge.EstimatedTimeLeftUntilImpact <= 0.0f
            &&  AttackToDodge.EstimatedTimeLeftUntilImpact > 0.5f))
        {
            WaitOneTick();
        }
        Super::DoTask();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_Dodge::IsMoveAllowed"));

        if (!Combat.Self.GetGothicAbilitySystemComponent().HasAbility(UGA_Dodge))
            return false;
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.HasGameplayTag(GameplayTag::Debuff_Drugs_High))
        {
            Reason = "Character is too drugged to dodge";
            return false;
        }

        if (!Combat.Self.CanDodgeNow())
        {
            Reason = "Can't dodge now";
            return false;
        }

        return true;
    }
}

UCLASS()
class UCM_DodgeAwayFromAttackVector : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Away);
    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Away, 0.0f);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        FVector AttackSegmentLocation;
        if (!IsTooCloseToAttackSegment(AttackSegmentLocation))
        {
            EndTaskAsFailure();
            return;
        }

        FVector Direction = (Combat.Self.NavAgentLocation - AttackSegmentLocation).GetSafeNormal();
        
        EndTaskWithResult(AI.DodgeIntoDirection(Direction).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        FVector AttackSegmentLocation;
        if (!IsTooCloseToAttackSegment(AttackSegmentLocation))
        {
            Reason = "Not close to any Attack segment";
            return false;
        }

        FVector HitLocation;
        // Normalized, Agent to CharacterOfInterest
        FVector Direction = (Combat.Self.NavAgentLocation - AttackSegmentLocation).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }

    UFUNCTION()
    bool IsTooCloseToAttackSegment(FVector&out AttackSegmentLocation) const
    {
        auto AvailableGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Attackers);

        for (auto Group : AvailableGroups)
        {
            auto AttackerGroup = Cast<UAIGroup_Attackers>(Group);
            if (!IsValid(AttackerGroup))
                continue;

            if (AttackerGroup.IsCharacterTooCloseToAnyAttackVector(Combat.Self, AttackSegmentLocation))
                return true;
        }

        return false;
    }
}

/** Dodge away from enemy - changes direction automatically to get away from enemy */
UCLASS()
class UCM_DodgeAwayFromEnemy : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Away);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Away, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Back);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeAwayFromTarget().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Normalized, Agent to CharacterOfInterest
        FVector Direction = (Combat.Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodges in an attempt to get un-stuck from being inside another character */
UCLASS()
class UCM_DodgeToUnStuck : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Away);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Away, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Back);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        TArray<FVector> UnstuckDirections;
        UnstuckDirections.Add(-Combat.Self.ActorForwardVector);
        UnstuckDirections.Add(Combat.Self.ActorRightVector);
        UnstuckDirections.Add(-Combat.Self.ActorRightVector);
        UnstuckDirections.Add(Combat.Self.ActorForwardVector);

        int FailedAttemptCount = 0;

        TArray<AGothicCharacter> OtherCharacters;    
        while (Combat.Self.HasAliveUndefeatedOverlappingNPCs(Combat.Self.ActorLocation, OtherCharacters, FVector(1.2f, 1.2f, 1)))
        {
            bool bAnyNonEnemy = false;
            for (auto OtherCharacter : OtherCharacters)
            {
                if (Self.IsEnemyTowards(OtherCharacter))
                    continue;
                
                bAnyNonEnemy = true;
            }

            if (!bAnyNonEnemy)
            {
                EndTaskAsSuccess();
            }

            // this is not the actual move distance of the dodge; TODO calc it somehow, otherwise CanMoveStraightInDirection wont give correct results
            float UnstuckMoveDistance = GetMoveDistance(); 

            bool bDodgedSuccessfully = false;
            FVector FoundNavLocation;
            FVector Direction = UnstuckDirections[Math::RandRange(0, UnstuckDirections.Num() - 1)];
            if (UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, UnstuckMoveDistance, FoundNavLocation))
            {
                //Self.AddActorWorldOffset(Direction * Self.SimpleCollisionRadius); @jmarin: commented this line because it was causing weird tps with apparently no reason. Let the movementComponent take care of the overlaps
                bDodgedSuccessfully = AI.DodgeIntoDirection(Direction).WasSuccessful();
            }

            if (!bDodgedSuccessfully)
            {
                FailedAttemptCount++;
            }
            else
            {
                FailedAttemptCount = 0;
            }

            if (FailedAttemptCount > 6)
            {
                EndTaskAsFailure();
                return;
            }

            WaitOneTick();
        }
        EndTaskAsSuccess();
        
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        FVector FoundNavLocation;
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, -Combat.Self.ActorForwardVector, GetMoveDistance(), FoundNavLocation) &&
            !UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Combat.Self.ActorRightVector, GetMoveDistance(), FoundNavLocation) &&
            !UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, -Combat.Self.ActorRightVector, GetMoveDistance(), FoundNavLocation) &&
            !UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Combat.Self.ActorForwardVector, GetMoveDistance(), FoundNavLocation))
        {
            Reason = "Cannot move into any direction";
            return false;
        }

        TArray<AGothicCharacter> OtherCharacters;
        if (Combat.Self.HasAliveUndefeatedOverlappingNPCs(Combat.Self.ActorLocation, OtherCharacters, FVector(1.2f, 1.2f, 1)))
        {
            bool bAnyNonEnemy = false;
            for (auto OtherCharacter : OtherCharacters)
            {
                if (Combat.Self.IsEnemyTowards(OtherCharacter))
                    continue;
                
                bAnyNonEnemy = true;
            }

            if (!bAnyNonEnemy)
            {
                Reason = "No characters to get unstuck from";
                return false;
            }
        }
        else
        {
            Reason = "No characters to get unstuck from";
            return false;
        }

        return true;
    }

    float GetMoveDistance() const
    {
        return Combat.Self.SimpleCollisionRadius * 2.f;
    }
}

/** Dodge forward */
UCLASS()
class UCM_DodgeForward : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Forward);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Forward, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Forward);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeForward().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Agent Forward
        FVector Direction = Combat.Self.ActorForwardVector;
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge left */
UCLASS()
class UCM_DodgeLeft : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Left);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeLeft().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Agent Left
        FVector Direction = -Combat.Self.ActorRightVector;
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge right */
UCLASS()
class UCM_DodgeRight : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Right);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeRight().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Agent Right
        FVector Direction = Combat.Self.ActorRightVector;
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge back e.g. to evade an attack */
UCLASS()
class UCM_DodgeBack : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Away);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Away, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Back);

    default CooldownSeconds = 0.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeBack().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Agent Back
        FVector Direction = -Combat.Self.ActorForwardVector;
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge forward relative to target */
UCLASS()
class UCM_DodgeForwardRelativeToTarget : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Forward);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Forward, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Forward);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeTowardsTarget().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Towards target
        FVector Direction = (Combat.CharacterOfInterest.NavAgentLocation - Combat.Self.NavAgentLocation).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge left relative to target */
UCLASS()
class UCM_DodgeLeftRelativeToTarget : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Left);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeLeftRelativeToTarget().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Left if Agent to CharacterOfInterest was Forward
        FVector Direction = -((Combat.CharacterOfInterest.NavAgentLocation - Combat.Self.NavAgentLocation).CrossProduct(FVector::UpVector).GetSafeNormal());
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge right relative to target */
UCLASS()
class UCM_DodgeRightRelativeToTarget : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Right);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeRightRelativeToTarget().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Right if Agent to CharacterOfInterest was Forward
        FVector Direction = (Combat.CharacterOfInterest.NavAgentLocation - Combat.Self.NavAgentLocation).CrossProduct(FVector::UpVector).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Dodge back relative to target */
UCLASS()
class UCM_DodgeBackRelativeToTarget : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Dodge_Away);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge_Away, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Dodge_Back);

    default CooldownSeconds = 0.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.DodgeAwayFromTarget().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Away from character of interest
        FVector Direction = (Combat.Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Rolls to either side e.g. to evade an attack */
UCLASS()
class UCM_RollToSide : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Roll);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack, 0.0f);
    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge, 0.0f);
    default MoveTypeCooldowns.Add(GameplayTag::Action_Roll, 0.0f);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.RollToEvade((Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation).UnsafeNormal, Math::RandBool()).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Right if Agent to CharacterOfInterest was Forward
        // Left if Agent to CharacterOfInterest was Forward
        FVector Direction = (Combat.CharacterOfInterest.NavAgentLocation - Combat.Self.NavAgentLocation).CrossProduct(FVector::UpVector).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 300.0f, HitLocation) &&
            !UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, -Direction, 300.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

/** Rolls away from the target */
UCLASS()
class UCM_RollAwayFromTarget : UCM_Dodge
{
    default MoveTypes.AddTag(GameplayTag::Action_Roll);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack, 0.0f);
    default MoveTypeCooldowns.Add(GameplayTag::Action_Dodge, 0.0f);
    default MoveTypeCooldowns.Add(GameplayTag::Action_Roll, 0.0f);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.RollAwayFrom(Combat.CharacterOfInterest).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Away from CharacterOfInterest
        FVector Direction = (Combat.Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation).GetSafeNormal();
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 300.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

// TEST WALK BACK - WOLF
UCLASS()
class UCM_MoveBack : UCM_Attack
{
    default bMaxRangeOverride = true;
    default MaxRange = 300.0f;
    
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackMoveBack().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest";
            return false;
        }

        FVector HitLocation;
        // Agent Back
        FVector Direction = -Combat.Self.ActorForwardVector;
        if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 300.0f, HitLocation))
        {
            Reason = "Cannot move into direction";
            return false;
        }

        return true;
    }
}

// React to incoming attack
UCLASS()
class UCM_ReactToIncomingAttack : UAITask_CombatMove
{
    default bCanBeInterruptedByReaction = false;
    default bCanBeInterruptedByEverything = false;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        USensedIncommingAttack AttackToReactTo = nullptr;

        for (auto Attack : Combat.SensedIncomingAttacks)
        {
            if (Attack.bReactionDone)
                continue;

            if (Attack.EstimatedTimeLeftUntilImpact <= 0.0f)
                continue;

            AttackToReactTo = Attack;
            break;
        }

        if (AttackToReactTo == nullptr)
        {
            EndTaskAsFailure();
            return;
        }

        auto Reaction = GetReaction(AttackToReactTo);
        AttackToReactTo.Reaction = Reaction;

        switch(Reaction)
        {
            case EIncomingAttackReaction::Dodge:
            {
                ReactWithDodge(AttackToReactTo);
                break;
            }
            case EIncomingAttackReaction::Parry:
            {
                ReactWithBlock(AttackToReactTo);
                break;
            }
            case EIncomingAttackReaction::Wait:
            {
                ReactWithWait(AttackToReactTo);
                break;
            }
            case EIncomingAttackReaction::None:
            default:
            {
                AttackToReactTo.bReactionDone = true;
                EndTaskAsSuccess();
                return;
            }
        }
    }

    EIncomingAttackReaction GetReaction(USensedIncommingAttack Attack)
    {
        if (Attack.Reaction != EIncomingAttackReaction::Count)
            return Attack.Reaction;

        float ChanceToDodge = Combat.GetCurrentChanceToDodgeAnAttack(Attack);
        float ChanceToBlock = Combat.GetCurrentChanceToBlockAnAttack(Attack);
        
        float Roll = Math::RandRange(0.0f, 1.0f);
        
        if (Roll <= ChanceToDodge)
        {
            return EIncomingAttackReaction::Dodge;
        }

        if (Roll <= ChanceToDodge + ChanceToBlock)
        {
            return EIncomingAttackReaction::Parry;
        }
        
        return EIncomingAttackReaction::Wait;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_ReactToIncomingAttack::IsMoveAllowed"));
        
            if (!Super::IsMoveAllowed(Reason))
                return false;

            if (!Combat.HasIncomingAttack())
            {
                Reason = "No incoming attack";
                return false;
            }

            if (Combat.Self.IsInBlockingStance())
            {
                Reason = "Currently in Blocking Stance";
                return false;
            }

            return true;
    }

    void ReactWithDodge(USensedIncommingAttack Attack)
    {
        if (!Combat.Self.CanDodgeNow())
        {
            EndTaskAsFailure();
            return;
        }

        FVector SelfToAttackerDirection = Attack.Instigator.ActorLocation - Self.GetActorLocation();
        float MinAnyDodgeDistance = Attack.Instigator.SimpleCollisionRadius + Self.SimpleCollisionRadius;
        float DodgeDistance = 250.0f;

        TArray<FVector> PossibleDodgeDirections;
        // if (SelfToAttackerDirection.SizeSquared2D() >= Math::Square(MinAnyDodgeDistance))
        if(false)
        {
            PossibleDodgeDirections.Add(Self.ActorForwardVector);
            PossibleDodgeDirections.Add(-Self.ActorForwardVector);
            PossibleDodgeDirections.Add(Self.ActorRightVector);
            PossibleDodgeDirections.Add(-Self.ActorRightVector);
            PossibleDodgeDirections.Shuffle();
        }
        else    // when attacker is too close, his collisions can block me: only try to dodge in the very opposite direction
        {
            PossibleDodgeDirections.Add(Self.GetClosestRelativeCharacterDirection(-SelfToAttackerDirection));
        }

        TOptional<FVector> FinalDodgeDirection;
        for(auto& Direction : PossibleDodgeDirections)
        {
            if(AI.Character.CanDodgeIntoDirection(Direction, DodgeDistance, Attack.Instigator))
            {
                FinalDodgeDirection.Set(Direction);
                break;
            }
        }

        if (FinalDodgeDirection.IsSet())
        {
            if (AI.DodgeIntoDirection(FinalDodgeDirection.Value).WasSuccessful())
            {
                Attack.bReactionDone = true;
                EndTaskAsSuccess();
                return;
            }
        }
        
        Attack.bReactionDone = false;
        EndTaskAsFailure();
    }

    void ReactWithBlock(USensedIncommingAttack Attack)
    {
        if (Combat.AI.IsBlocked())
        {
            EndTaskAsFailure();
            return;
        }

        if (Combat.Self.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_WaitReceiveRiposte))
        {
            EndTaskAsFailure();
            return;
        }

        if (!Combat.Self.CanDoBlockWithCurrentlyDrawnWeapon())
        {
            EndTaskAsFailure();
            return;
        }

        if (Combat.Self.IsInBlockingStance())
        {
            EndTaskAsFailure();
            return;
        }

        Combat.Config.BlockingTime = Combat.Config.ReactiveBlockingTime;
        EndTaskWithResult(Combat.AI.EnterBlockingStance().Result);
    }

    void ReactWithWait(USensedIncommingAttack Attack)
    {
        while (Attack.EstimatedTimeLeftUntilImpact <= 0.0f)
        {
            WaitOneTick();
        }

        EndTaskAsSuccess();
    }
}

//////////////////////////////////////////////////////////////
//     DRAW WEAPON
//////////////////////////////////////////////////////////////
UCLASS(Abstract)
class UCM_Draw_Base : UCM_StopMoving 
{
}


UCLASS()
class UCM_DrawWeapon : UCM_Draw_Base
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        Combat.LastWeaponSwitchTimeSeconds = Combat.World.TimeSeconds;
        //AI.UndrawWeapon();  
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_DrawWeapon::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.World.TimeSeconds < Combat.LastWeaponSwitchTimeSeconds + Combat.Config.CooldownSwitchWeapon)
        {
            Reason = "Weapon switch is in cooldown";
            return false;
        }

        return true;
    }
}

/** Draw the specified weapon. Will undraw the current weapon if it's not the specified one. Will not do anything if the currently drawn weapon is already the specified one. */
UCLASS()
class UCM_DrawWeaponOfClass : UCM_DrawWeapon
{
    UCM_DrawWeaponOfClass(TSubclassOf<UWeaponDefinition> InWeaponClassToDraw)
    {
        WeaponClassToDraw = InWeaponClassToDraw;
    }

    UPROPERTY(EditDefaultsOnly)
    TSubclassOf<UWeaponDefinition> WeaponClassToDraw = nullptr;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        
        if (WeaponClassToDraw == nullptr)            
            EndTaskAsFailure();

        EndTaskWithResult(AI.DrawWeaponOfClass(WeaponClassToDraw).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_DrawWeaponOfClass::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.HasDrawnWeaponOfClass(WeaponClassToDraw.Get()))
        {
            Reason = "Drawn weapon is already of this class";
            return false;
        }

        if (Combat.Self.Inventory.HasItemOfClass(WeaponClassToDraw.Get()))
        {
            return true;
        }
        
        if (WeaponClassToDraw.Get().IsChildOf(UWeaponMeleeDefinition::StaticClass()))
        {
            if (IsValid(Combat.Self.Inventory.FirstEquippedMeleeWeapon))
                return true;
        }

        if (WeaponClassToDraw.Get().IsChildOf(UWeaponArcheryDefinition::StaticClass()))
        {
            if (IsValid(Combat.Self.Inventory.FirstEquippedRangedWeapon))
                return true;
        }

        Reason = "No weapon of this class equipped or in inventory";
        return false;
    }
}

UCLASS()
class UCM_DrawMagicSpell : UCM_Draw_Base
{

    UCM_DrawMagicSpell(TSubclassOf<USpellContainer> InSpellClass)
    {
        SpellClass = InSpellClass;
    }

    UPROPERTY()
    TSubclassOf<USpellContainer> SpellClass;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;


        if (Combat.Self.HasDrawnWeapon())
        {
            //AI.UndrawWeapon();
            WaitSeconds(0.5f);
        }

        EndTaskWithResult(AI.DrawMagicSpell(SpellClass).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_DrawMagicSpell::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!SpellClass.IsValid())
        {
            Reason = "Invalid spell class";
            return false;
        }

        FGameplayTag SpellTypeTag = Cast<USpellContainer>(SpellClass.Get().DefaultObject).ItemType;

        if (!Combat.Self.Inventory.HasMagicRuneInInventory(SpellTypeTag))
        {
            Reason = "No matching rune in inventory";
            return false;
        }

        if (Combat.Self.HasDrawnWeaponOfType(SpellTypeTag))
        {
            Reason = "Already drawn rune type";
            return false;
        }

        return true;
    }
}

//////////////////////////////////////////////////////////////
//     SINGLE ATTACKS
//////////////////////////////////////////////////////////////

/** Attack class with the purpose of identifying all attacking combat moves as attacks through polymorphism */
UCLASS(Abstract)
class UCM_Attack : UCM_StopMoving
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_LockRoles);

    bool bShouldStopMoving = true;

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack, 0.0f);
    default ActionTag = GameplayTag::Ability_Combat_Attack;

    UPROPERTY()
    EAttackDirectionRequirement AttackDirectionRequirement = EAttackDirectionRequirement::None;

    UPROPERTY()
    bool bRequiresPathToCharacterOfInterest = true;

    UPROPERTY()
    bool bMaxRangeOverride = false;

    UPROPERTY()
    FGameplayTag RequiredWeaponTag = FGameplayTag::Empty;


    UPROPERTY(EditDefaultsOnly)
    FGameplayTag _AttackDirection = FGameplayTag::Empty;

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> RequiredWeaponClass = nullptr;

    UPROPERTY()
    EAttackUsageType UsageType = EAttackUsageType::Regular;

    UPROPERTY()
    bool bRequiresNonDefeatedTarget = true;

    UPROPERTY()
    bool bRequiresDefeatedTarget = false;

    UPROPERTY()
    bool bRequireToken = true;

    FGameplayTag GetAttackDirection() const property
    {
        return _AttackDirection;
    }

    UFUNCTION(BlueprintCallable)
    bool ShouldInvalidateAttack()
    {
        return false;
    }

    float GetRange() const property 
    {
        if (bMaxRangeOverride)
            return MaxRange;

        if (!AttackDirection.IsValid())
            return 0.0f;

        auto CombatDataModule = DataModule::GetCombatDataModule(Combat.AI.Character);
        if (CombatDataModule == nullptr)
            return 0.0f;
        
        auto Weapon = Combat.AI.Character.CarryComponent.EquippedItemDefinition;

        auto ComboConfig = CombatDataModule.GetNextAttackConfig(AttackDirection);
        float TrueRange = CombatDataModule.GetAttackRange(ComboConfig) * 0.65f;

        if (TrueRange != 0.0f && MaxRange != 0.0f)
            return Math::Min(MaxRange, TrueRange);

        if (TrueRange != 0.0f)
            return TrueRange;

        if (MaxRange != 0.0f)
            return MaxRange;        

        return MAX_flt; 
    }

    float GetMedianRequiredRelativeHeight() const property final
    {
        if (!bRequiresSpecificRelativeHeight)
            return 0.0f;

        float TrueMedian = MinRelativeHeight + (MaxRelativeHeight - MinRelativeHeight) * 0.5f;

        // // Currenty higher than required maximum
        // if (Combat.HeightRelativeToCharacterOfInterest > MaxRelativeHeight)
        //     return Math::Max(TrueMedian, MaxRelativeHeight - 40.0f);

        // // Currently lower than required minimum
        // if (Combat.HeightRelativeToCharacterOfInterest < MinRelativeHeight)
        //     return Math::Min(TrueMedian, MinRelativeHeight + 40.0f);

        return TrueMedian;
    }

    float GetReach() const property final 
    {
        auto CombatDataModule = DataModule::GetCombatDataModule(Combat.AI.Character);
        if (CombatDataModule == nullptr)
            return 0.0f;
        
        auto ComboConfig = CombatDataModule.GetNextAttackConfig(AttackDirection);
        return Math::Max(CombatDataModule.GetAttackRangeInPlace(ComboConfig), 30.0f);
    }

    bool IsFacingTheCorrectDirection()
    {
        return true;
    }

    bool WouldAttackCollideWithWall() const
    {
        return Combat.WouldMeleeAttackCollideWithWall();
    }

    bool WouldAttackHitFriendly() const
    {
        return Combat.WouldMeleeAttackCollideWithFriendly();
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (bShouldStopMoving)
        {
            Super::DoTask();

            if (!IsValid(this))
                return;
        }
        
        if (AI.Self.CarryComponent.EquippedItemDefinition == nullptr)
        {
            EndTaskAsFailure();
            return;
        }

        JoinAttackGroup();        
        Combat.FailureToAttackCounter = 0;
    }

    void JoinAttackGroup()
    {
        AI.LeaveGroupsWithClass(UAIGroup_Attackers);

        auto AvailableGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Attackers);

        for (auto Group : AvailableGroups)
        {
            AI.JoinGroup(Group);
            return;
        }

        AI.CreateAndJoinGroup(UAIGroup_Attackers);
    }

    void LeaveAttackGroup()
    {
        AI.LeaveGroupsWithClass(UAIGroup_Attackers);
    }

    void OnMoveEnded() override
    {
        Super::OnMoveEnded();

        LeaveAttackGroup();
        
        if (TaskResult == EGenericTaskResult::Success)
        {
            if (AI.Self.CarryComponent.EquippedItemDefinition == nullptr)
                return;
            
            if (ActionTag.IsValid())
            {
                AI.UpdateItemActionUsageTime(ActionTag);
            }
        }
    }

    bool CharacterOfInterestIsInTheCorrectDirectionToAttack() const
    {
        switch(AttackDirectionRequirement)
        {
            case EAttackDirectionRequirement::Front:
                return Combat.Self.IsFacingOtherCharacter(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::Back:
                return Combat.Self.IsBackFacingOtherCharacterDirectly(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::NotFront:
                return !Combat.Self.IsFacingOtherCharacter(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::NotBack:
                return !Combat.Self.IsBackFacingOtherCharacterDirectly(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::Any:
            case EAttackDirectionRequirement::None:
            default:
                return true;
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_Attack::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (bRequireToken && IsValid(Combat.CombatGroup) && IsValid(Combat.CombatGroup.AttackTokenSystem)
            && !Combat.CombatGroup.AttackTokenSystem.DoesCharacterHaveToken(Combat.Self))
        {
            Reason = "No attack token";
            return false;
        }

        if (!Combat.ShouldAttack())
        {
            Reason = "Should not attack";
            return false;
        }

        if (Combat.Self.IsInBlockingStance())
        {
            Reason = "In blocking stance";
            return false;
        }

        if (RequiredWeaponTag.IsValid() && !RequiredWeaponTag.MatchesTag(Combat.Self.GetDrawnWeaponTypeTag()))
        {
            Reason = "Required type of weapon not drawn";
            return false;
        }

        if (RequiredWeaponClass != nullptr && !Combat.Self.IsDrawnItemClass(RequiredWeaponClass))
        {
            Reason = "Required class of weapon not drawn";
            return false;
        }

        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "CharacterOfInterest is invalid";
            return false;
        }

        if (Combat.CharacterOfInterest.IsDead())
        {
            Reason = "CharacterOfInterest is dead";
            return false;
        }

        if (Combat.CharacterOfInterest.IsDefeated() && bRequiresNonDefeatedTarget)
        {
            Reason = "Target is defeated";
            return false;
        }

        if (!Combat.CharacterOfInterest.IsDefeated() && bRequiresDefeatedTarget)
        {
            Reason = "Target is not defeated";
            return false;
        }

        // if (bRequiresPathToCharacterOfInterest &&
        //     Combat.CharacterOfInterest.IsWalkSpeedSprinting() && Combat.CharacterOfInterest.IsFacingAwayFromOtherCharacter(Combat.Self))
        // {
        //     Reason = "Target is sprinting away";
        //     return false;
        // }

        // if (Combat.Self.IsWalkSpeedSprinting())
        // {
        //     Reason = "Cannot attack while sprinting";
        //     return false;
        // }

        if (!CharacterOfInterestIsInTheCorrectDirectionToAttack())
        {
            Reason = "CharacterOfInterest is not in the correct direction";
            return false;
        }

        if (Combat.DistanceToCharacterOfInterest < 0.0f)
        {
            Reason = "Could not calculate distance to CharacterOfInterest";
            return false;
        }
        
        if (Combat.DistanceToCharacterOfInterest > Range /*&& !Combat.Self.IsMoving()*/ &&
            Math::Abs(Combat.DistanceToCharacterOfInterest - Range) >= 30.0f) //  + Combat.CharacterOfInterest.SimpleCollisionRadius
        {
            Reason = "CharacterOfInterest is farther than the attack's range and character isn't moving";
            return false;
        }

        if (Combat.DistanceToCharacterOfInterest > Range /*&& Combat.Self.IsMoving()*/) //  + Combat.CharacterOfInterest.SimpleCollisionRadius
        {
            Reason = "CharacterOfInterest is farther than the attack's range ";
            return false;
        }

        if (Combat.DistanceToCharacterOfInterest < MinRange /*&& !Combat.Self.IsMoving()*/ &&
            Math::Abs(Combat.DistanceToCharacterOfInterest - MinRange) >= 30.0f) //  + Combat.CharacterOfInterest.SimpleCollisionRadius
        {
            Reason = "CharacterOfInterest is closer than the attacks minimum range and character isn't moving";
            return false;
        } 

        if (Combat.DistanceToCharacterOfInterest < MinRange /*&& Combat.Self.IsMoving()*/) //  + Combat.CharacterOfInterest.SimpleCollisionRadius
        {
            Reason = "CharacterOfInterest is closer than the attacks minimum range and character is moving";
            return false;
        }

        if (bRequiresSpecificRelativeHeight && Combat.HeightRelativeToCharacterOfInterest < MinRelativeHeight)
        {
            Reason = "Relative height is lower than minimum.";
            return false;
        }

        if (bRequiresSpecificRelativeHeight && Combat.HeightRelativeToCharacterOfInterest > MaxRelativeHeight)
        {
            Reason = "Relative height is higher than maximum.";
            return false;
        }

        if (bRequiresPathToCharacterOfInterest && WouldAttackCollideWithWall() && Combat.FailureToAttackCounter < 4)
        {
            Reason = "Attack would hit collision.";
            Combat.TimeOfLastFailureToAttack = FInGameTime::Now();
            Combat.FailureToAttackCounter++;
            return false;
        }

        if (bRequiresPathToCharacterOfInterest && WouldAttackHitFriendly() && Combat.FailureToAttackCounter < 4)
        {
            Reason = "Attack would hit friendly.";
            Combat.TimeOfLastFailureToAttack = FInGameTime::Now();
            Combat.FailureToAttackCounter++;
            return false;
        }

        // FGameplayTagContainer RightLeftAttacks;
        // RightLeftAttacks.AddTag(GameplayTag::Action_Attack_Right);
        // RightLeftAttacks.AddTag(GameplayTag::Action_Attack_Left);
        // if (MoveTypes.HasAny(RightLeftAttacks) && Combat.DistanceToClosestFriendly < Combat.Config.FriendlyFireSafetyDistance)
        //     return false;

        if (Combat.Self.IsHuman() && Reach > 0.0f && 
            Combat.DistanceToCharacterOfInterest > Reach && !Combat.CanMoveToTargetIntoAttackReachInStraightLine(Reach))
        {
            Reason = "Obstacle in the way prevents getting into attack reach.";
            Combat.TimeOfLastFailureToAttack = FInGameTime::Now();
            Combat.FailureToAttackCounter++;
            return false;
        }

        if (Combat.Self.IsDoingTaunt() && !Combat.Self.HasGameplayTag(GameplayTag::State_ResetStates))
        {
            Reason = "Doing a taunt and not in ResetStates";
            Combat.TimeOfLastFailureToAttack = FInGameTime::Now();
            Combat.FailureToAttackCounter++;
            return false;
        }

        if (bRequiresSpecificRelativeHeight)
        {
            FVector FoundLocation;
            FVector TestLocation = Combat.Self.ActorLocation;
            TestLocation.Z = Combat.Controller.GetRequestedWorldSpaceZDivergeHeightTheoretically(
                EAdaptZDivergeMode::RelativeToOtherCharacter, 
                TestLocation, 
                MedianRequiredRelativeHeight);

            bool bIsLocationReachable = UNavigationSystemV1::CanLocationBeReached3D(
                Combat.Self, 
                TestLocation, 30.0f, 
                (MaxRelativeHeight - MinRelativeHeight) * 0.5f, 
                true, false, FoundLocation);
                
            if (!bIsLocationReachable)
            {
                Reason = "Required relative height cannot be reached.";
                Combat.TimeOfLastFailureToAttack = FInGameTime::Now();
                Combat.FailureToAttackCounter++;
                return false;
            }
        }

        return true;
    }

    bool IsSelectable(FString& Reason)
    {
        if (IsValid(Combat.CurrentActionCombatMove) && 
            Combat.CurrentActionCombatMove.IsActive() && 
            Combat.CurrentActionCombatMove.TemplateObject == TemplateObject)
            return true;

        if (Combat.CharacterState.HasAnyGameplayTags(DisallowMoveTags))
        {
            Reason = "Attack is disallowed";
            return false;
        }

        if (bRequireToken && IsValid(Combat.CombatGroup) && IsValid(Combat.CombatGroup.AttackTokenSystem)
            && !Combat.CombatGroup.AttackTokenSystem.DoesCharacterHaveToken(Combat.Self))
        {
            Reason = "No attack token";
            return false;
        }

        if (!Combat.ShouldAttack())
        {
            Reason = "Should not attack";
            return false;
        }

        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "Invalid CharacterOfInterest";
            return false;
        }

        if (bRequiresDefeatedTarget && !Combat.CharacterOfInterest.IsDefeated())
        {
            Reason = "Requires defeated target, target not defeated";
            return false;
        }

        if (bRequiresNonDefeatedTarget && Combat.CharacterOfInterest.IsDefeated())
        {
            Reason = "Requires non-defeated target, target defeated";
            return false;
        }

        if (bRequiresSpecificRelativeHeight)
        {
            FVector FoundLocation;
            FVector TestLocation = Combat.Self.ActorLocation;
            TestLocation.Z = Combat.Controller.GetRequestedWorldSpaceZDivergeHeightTheoretically(
                EAdaptZDivergeMode::RelativeToOtherCharacter, 
                TestLocation, 
                MedianRequiredRelativeHeight);

            bool bIsLocationReachable = UNavigationSystemV1::CanLocationBeReached3D(
                Combat.Self, 
                TestLocation, 30.0f, 
                (MaxRelativeHeight - MinRelativeHeight), 
                true, false, FoundLocation);
                
            if (!bIsLocationReachable)
            {
                Reason = "Required relative height cannot be reached.";
                return false;
            }
        }

        float ReachRangeXY = Math::Max(Reach, Combat.CharacterOfInterest.SimpleCollisionRadius + 10.0f);
        float ReachRangeZ = Combat.CharacterOfInterest.SimpleCollisionHalfHeight + Combat.AI.Character.SimpleCollisionHalfHeight * 2; 

        FVector Location;
        if (bRequiresPathToCharacterOfInterest &&
            !UNavigationSystemV1::CanTargetBeReached3D(
                Combat.AI.Character, Combat.CharacterOfInterest, 
                ReachRangeXY, ReachRangeZ, 
                false, Location))
        {
            Reason = "Path to target was required but target cannot be reached";
            return false;
        }

        return true;
    }

    UPROPERTY(EditDefaultsOnly)
    bool bSendInterruptToCancelAttack = true;

    UFUNCTION()
    void OnShouldStopAttack() const
    {
        auto payLoad = FGameplayEventData();
        payLoad.EventTag = GameplayTag::Action_Interrupt_Attack;
        Combat.Self.AbilitySystemComponent.SendGameplayEvent(GameplayTag::Action_Interrupt_Attack, payLoad);
    }

    UFUNCTION()
    bool ConditionsToContinueAttack() const
    {
        return true;
    }

    UFUNCTION()
    protected bool CheckShouldAttackContinue() const final
    {
        if (ConditionsToContinueAttack())
            return true;

        if (bSendInterruptToCancelAttack)
        {
            OnShouldStopAttack();
        }
        
        return false;
    }

}

/** Do a Top attack */
UCLASS()
class UCM_Attack_Top : UCM_Attack
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_MeleeAttack);

    default _AttackDirection = GameplayTag::Combat_Attack_Top;

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Top);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Top, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Top);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackTop().Result);
    }
}

/** Do a left attack */
UCLASS()
class UCM_Attack_Left : UCM_Attack
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_MeleeAttack);

    default _AttackDirection = GameplayTag::Combat_Attack_Left;

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Left);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Left, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Left);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackLeft().Result);
    }
}

/** Do a right attack */
UCLASS()
class UCM_Attack_Right : UCM_Attack
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_MeleeAttack);

    default _AttackDirection = GameplayTag::Combat_Attack_Right;

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Right);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Right, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Right);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackRight().Result);
    }
}

/** Do a bottom attack */
UCLASS()
class UCM_Attack_Bottom : UCM_Attack
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_MeleeAttack);

    default _AttackDirection = GameplayTag::Combat_Attack_Bottom;

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Bottom);

    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Bottom, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Bottom);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackBottom().Result);
    }
}

/** Do a Extra 01 attack */
UCLASS()
class UCM_Attack_Extra01 : UCM_Attack
{
    default _AttackDirection = GameplayTag::Combat_Attack_Extra01;

    default MoveTypes.AddTag(GameplayTag::Combat_Attack_Extra01);

    default MoveTypeCooldowns.Add(GameplayTag::Combat_Attack_Extra01, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Extra_1);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackExtra01().Result);
    }
}

/** Do a Extra 02 attack */
UCLASS()
class UCM_Attack_Extra02 : UCM_Attack
{
    default _AttackDirection = GameplayTag::Combat_Attack_Extra02;

    default MoveTypes.AddTag(GameplayTag::Combat_Attack_Extra02);

    default MoveTypeCooldowns.Add(GameplayTag::Combat_Attack_Extra02, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Extra_2);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackExtra02().Result);
    }
}

/** Do a Extra 03 attack */
UCLASS()
class UCM_Attack_Extra03 : UCM_Attack
{
    default _AttackDirection = GameplayTag::Combat_Attack_Extra03;

    default MoveTypes.AddTag(GameplayTag::Combat_Attack_Extra03);

    default MoveTypeCooldowns.Add(GameplayTag::Combat_Attack_Extra03, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Extra_3);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackExtra03().Result);
    }
}

/** Do a Extra 04 attack */
UCLASS()
class UCM_Attack_Extra04 : UCM_Attack
{
    default _AttackDirection = GameplayTag::Combat_Attack_Extra04;

    default MoveTypes.AddTag(GameplayTag::Combat_Attack_Extra04);

    default MoveTypeCooldowns.Add(GameplayTag::Combat_Attack_Extra04, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Extra_4);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackExtra04().Result);
    }
}

/** Do a Extra 05 attack */
UCLASS()
class UCM_Attack_Extra05 : UCM_Attack
{
    default _AttackDirection = GameplayTag::Combat_Attack_Extra05;

    default MoveTypes.AddTag(GameplayTag::Combat_Attack_Extra05);

    default MoveTypeCooldowns.Add(GameplayTag::Combat_Attack_Extra05, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Extra_5);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackExtra05().Result);
    }
}

/** Do a Extra 05 attack */
UCLASS()
class UCM_Attack_Extra06 : UCM_Attack
{
    default _AttackDirection = GameplayTag::Combat_Attack_Extra06;

    default MoveTypes.AddTag(GameplayTag::Combat_Attack_Extra06);

    default MoveTypeCooldowns.Add(GameplayTag::Combat_Attack_Extra06, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Extra_6);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackExtra06().Result);
    }
}

//Gomez moves

/** Do a Extra 01 attack */
UCLASS()
class UCM_Attack_AreaFront : UCM_Attack_Extra01
{
}

/** Do a Extra 02 attack */
UCLASS()
class UCM_Attack_GuardStrike : UCM_Attack_Extra02
{

}

/** Special SmashMeatbug attack */
UCLASS()
class UCM_Attack_SmashMeatbug : UCM_Attack
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        AGothicCharacter MeatbugToSmash = Combat.CharacterOfInterest;
        if (!IsValid(MeatbugToSmash) || !MeatbugToSmash.IsSpecies(GameplayTag::Species_Creature_Meatbug))
            return;

        AI.SmashMeatbug(MeatbugToSmash);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!IsValid(Combat.CharacterOfInterest) || !Combat.CharacterOfInterest.IsSpecies(GameplayTag::Species_Creature_Meatbug))
        {
            Reason = "Target isn't a meatbug";
            return false;
        }

        return true;
    }

    bool IsSelectable(FString& Reason) override
    {
        if (!Super::IsSelectable(Reason))
            return false;

        if (!IsValid(Combat.CharacterOfInterest) || !Combat.CharacterOfInterest.IsSpecies(GameplayTag::Species_Creature_Meatbug))
        {
            Reason = "Target isn't a meatbug";
            return false;
        }

        return true;
    }

    bool ShouldInvalidateAttack() override
    {
        if (Super::ShouldInvalidateAttack())
            return true;

        if (!IsValid(Combat.CharacterOfInterest) || !Combat.CharacterOfInterest.IsSpecies(GameplayTag::Species_Creature_Meatbug))
            return true;

        return false;
    }
}

//End of Gomez moves

//////////////////////////////////////////////////////////////
//     SIMPLE COMBO ATTACKS  - they do all attacks without checking if failed or not
//////////////////////////////////////////////////////////////

/** Attack class with the purpose of identifying all attacking COMBO combat moves as combos through polymorphism */
UCLASS(Abstract)
class UCM_AttackCombo : UCM_Attack
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_MeleeAttack);

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Combo);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Combo, 0.0f);

    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack_Combo);

    private TArray<FGameplayTag> ComboChain;

    bool bEndOnMiss = false;

    TMap<FGameplayTag, FGameplayTag> AttackTagToActionTags;
    default AttackTagToActionTags.Add(UAbilityTask_Attack::DirectionRight(), GameplayTag::Action_Attack_Right);
    default AttackTagToActionTags.Add(UAbilityTask_Attack::DirectionLeft(), GameplayTag::Action_Attack_Left);
    default AttackTagToActionTags.Add(UAbilityTask_Attack::DirectionTop(), GameplayTag::Action_Attack_Top);
    default AttackTagToActionTags.Add(UAbilityTask_Attack::DirectionBottom(), GameplayTag::Action_Attack_Bottom);
    default AttackTagToActionTags.Add(GameplayTag::Combat_Attack_Extra01, GameplayTag::Action_Attack_Extra01);
    default AttackTagToActionTags.Add(GameplayTag::Combat_Attack_Extra02, GameplayTag::Action_Attack_Extra02);
    default AttackTagToActionTags.Add(GameplayTag::Combat_Attack_Extra03, GameplayTag::Action_Attack_Extra03);
    default AttackTagToActionTags.Add(GameplayTag::Combat_Attack_Extra04, GameplayTag::Action_Attack_Extra04);
    default AttackTagToActionTags.Add(GameplayTag::Combat_Attack_Extra05, GameplayTag::Action_Attack_Extra05);
    default AttackTagToActionTags.Add(GameplayTag::Combat_Attack_Extra06, GameplayTag::Action_Attack_Extra06);

    FGameplayTag GetAttackDirection() const override property
    {
        if (ComboChain.IsEmpty())
            return FGameplayTag::Empty;

        if (!ComboChain[0].IsValid())
            return FGameplayTag::Empty;

        return ComboChain[0];
    }

    UFUNCTION()
    void AddAttack(FGameplayTag AttackTag)
    {
        if (!AttackTagToActionTags.Contains(AttackTag))
            return;

        FGameplayTag AttackActionTag = AttackTagToActionTags[AttackTag];

        if (!AttackActionTag.IsValid())
            return;

        if (!MoveTypes.HasTag(AttackActionTag))
        {
            MoveTypes.AddTag(AttackActionTag);
            MoveTypeCooldowns.Add(AttackActionTag, 0.0f);
        }

        ComboChain.Add(AttackTag);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.AttackCombo(ComboChain, bEndOnMiss).Result);
    }

    float GetCooldownTimeForTag(FGameplayTag Tag) const override
    {
        if (Tag == GameplayTag::Action_Attack)
            return 2.0f;

        return Super::GetCooldownTimeForTag(Tag);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_AttackCombo::IsMoveAllowed"));
        
        if (!Combat.Self.CanDoCombosWithCurrentlyDrawnWeapon())
        {
            Reason = "Agent can't do combos with current weapon";
            return false;
        }

        if (!Super::IsMoveAllowed(Reason))
            return false;
        
        return true;
    }
}

/** Simple Combo base class  */
UCLASS(Abstract)
class UCM_AttackSCombo : UCM_AttackCombo
{
    default bEndOnMiss = false;
}

/** Complex Combo base class */
UCLASS(Abstract)
class UCM_AttackCCombo : UCM_AttackCombo
{
    default bEndOnMiss = true;
}

// COMBO FIRST ATTACKS
//////////////////////////////////////////////////////////////////////////////////////////////////
/** Simple Combo First attack class */
UCLASS(Abstract)
class UCM_AttackSCombo_Right : UCM_AttackSCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

/** Simple Combo First attack class */
UCLASS(Abstract)
class UCM_AttackSCombo_Left : UCM_AttackSCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

/** Simple Combo First attack class */
UCLASS(Abstract)
class UCM_AttackSCombo_Top : UCM_AttackSCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

/** Simple Combo First attack class */
UCLASS(Abstract)
class UCM_AttackSCombo_Bottom : UCM_AttackSCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

/** Complex Combo First attack class */
UCLASS(Abstract)
class UCM_AttackCCombo_Right : UCM_AttackCCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

/** Complex Combo First attack class */
UCLASS(Abstract)
class UCM_AttackCCombo_Left : UCM_AttackCCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

/** Complex Combo First attack class */
UCLASS(Abstract)
class UCM_AttackCCombo_Top : UCM_AttackCCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

/** Complex Combo First attack class */
UCLASS(Abstract)
class UCM_AttackCCombo_Bottom : UCM_AttackCCombo
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}
//////////////////////////////////////////////////////////////////////////////////////////////////

// SIMPLE TWO ATTACK COMBOS
//////////////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UCM_AttackSCombo_RightRight : UCM_AttackSCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_RightLeft : UCM_AttackSCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_RightTop : UCM_AttackSCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_RightBottom : UCM_AttackSCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_LeftRight : UCM_AttackSCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_LeftLeft : UCM_AttackSCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_LeftTop : UCM_AttackSCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_LeftBottom : UCM_AttackSCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_TopRight : UCM_AttackSCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_TopLeft : UCM_AttackSCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_TopTop : UCM_AttackSCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_TopBottom : UCM_AttackSCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_BottomRight : UCM_AttackSCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_BottomLeft : UCM_AttackSCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_BottomTop : UCM_AttackSCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_BottomBottom : UCM_AttackSCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}
///////////////////////////////////////////////////////////////////////////////

// SIMPLE THREE ATTACK COMBOS
///////////////////////////////////////////////////////////////////////////////
UCLASS()
class UCM_AttackSCombo_RightRightRight : UCM_AttackSCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_RightRightLeft : UCM_AttackSCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_RightRightTop : UCM_AttackSCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_RightRightBottom : UCM_AttackSCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_RightLeftRight : UCM_AttackSCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_RightLeftLeft : UCM_AttackSCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_RightLeftTop : UCM_AttackSCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_RightLeftBottom : UCM_AttackSCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_RightTopRight : UCM_AttackSCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_RightTopLeft : UCM_AttackSCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_RightTopTop : UCM_AttackSCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_RightTopBottom : UCM_AttackSCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_RightBottomRight : UCM_AttackSCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_RightBottomLeft : UCM_AttackSCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_RightBottomTop : UCM_AttackSCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_RightBottomBottom : UCM_AttackSCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_LeftRightRight : UCM_AttackSCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_LeftRightLeft : UCM_AttackSCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_LeftRightTop : UCM_AttackSCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_LeftRightBottom : UCM_AttackSCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_LeftLeftRight : UCM_AttackSCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_LeftLeftLeft : UCM_AttackSCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_LeftLeftTop : UCM_AttackSCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_LeftLeftBottom : UCM_AttackSCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_LeftTopRight : UCM_AttackSCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_LeftTopLeft : UCM_AttackSCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_LeftTopTop : UCM_AttackSCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_LeftTopBottom : UCM_AttackSCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_LeftBottomRight : UCM_AttackSCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_LeftBottomLeft : UCM_AttackSCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_LeftBottomTop : UCM_AttackSCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_LeftBottomBottom : UCM_AttackSCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_TopRightRight : UCM_AttackSCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_TopRightLeft : UCM_AttackSCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_TopRightTop : UCM_AttackSCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_TopRightBottom : UCM_AttackSCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_TopLeftRight : UCM_AttackSCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_TopLeftLeft : UCM_AttackSCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_TopLeftTop : UCM_AttackSCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_TopLeftBottom : UCM_AttackSCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_TopTopRight : UCM_AttackSCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_TopTopLeft : UCM_AttackSCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_TopTopTop : UCM_AttackSCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_TopTopBottom : UCM_AttackSCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_TopBottomRight : UCM_AttackSCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_TopBottomLeft : UCM_AttackSCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_TopBottomTop : UCM_AttackSCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_TopBottomBottom : UCM_AttackSCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_BottomRightRight : UCM_AttackSCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_BottomRightLeft : UCM_AttackSCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_BottomRightTop : UCM_AttackSCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_BottomRightBottom : UCM_AttackSCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_BottomLeftRight : UCM_AttackSCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_BottomLeftLeft : UCM_AttackSCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_BottomLeftTop : UCM_AttackSCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_BottomLeftBottom : UCM_AttackSCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_BottomTopRight : UCM_AttackSCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_BottomTopLeft : UCM_AttackSCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_BottomTopTop : UCM_AttackSCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_BottomTopBottom : UCM_AttackSCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackSCombo_BottomBottomRight : UCM_AttackSCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_BottomBottomLeft : UCM_AttackSCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackSCombo_BottomBottomTop : UCM_AttackSCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackSCombo_BottomBottomBottom : UCM_AttackSCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}
////////////////////////////////////////////////////////////////////////////////////////

// FOUR ATTACK COMBOS
////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UCM_AttackSCombo_RightTopLeftRight : UCM_AttackSCombo_RightTopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackSCombo_RightBottomLeftRight : UCM_AttackSCombo_RightBottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

/** Do Left, Bottom, Right, Left nonstop  */
UCLASS()
class UCM_AttackSCombo_LeftBottomRightLeft : UCM_AttackSCombo_LeftBottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

/** Do Top, Left, Top, Bottom nonstop  */
UCLASS()
class UCM_AttackSCombo_TopLeftTopBottom : UCM_AttackSCombo_TopLeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

/** Do Right, Left, Right, Top nonstop  */
UCLASS()
class UCM_AttackSCombo_RightLeftRightTop : UCM_AttackSCombo_RightLeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

/** Do Bottom, Left, Top, Bottom nonstop  */
UCLASS()
class UCM_AttackSCombo_BottomLeftBottomTop : UCM_AttackSCombo_BottomLeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

/** Do Left, Right, Left, Top nonstop  */
UCLASS()
class UCM_AttackSCombo_LeftRightLeftTop : UCM_AttackSCombo_LeftRightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

/** Do Right, Left, Right, Bottom nonstop  */
UCLASS()
class UCM_AttackSCombo_RightLeftRightBottom : UCM_AttackSCombo_RightLeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

//////////////////////////////////////////////////////////////
//     COMPLEX COMBO ATTACKS  - they will cancel combo if an attack fails
//////////////////////////////////////////////////////////////

// COMPLEX TWO ATTACK COMBOS
//////////////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UCM_AttackCCombo_RightRight : UCM_AttackCCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_RightLeft : UCM_AttackCCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_RightTop : UCM_AttackCCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_RightBottom : UCM_AttackCCombo_Right
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_LeftRight : UCM_AttackCCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_LeftLeft : UCM_AttackCCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_LeftTop : UCM_AttackCCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_LeftBottom : UCM_AttackCCombo_Left
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_TopRight : UCM_AttackCCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_TopLeft : UCM_AttackCCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_TopTop : UCM_AttackCCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_TopBottom : UCM_AttackCCombo_Top
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_BottomRight : UCM_AttackCCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_BottomLeft : UCM_AttackCCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_BottomTop : UCM_AttackCCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_BottomBottom : UCM_AttackCCombo_Bottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}
///////////////////////////////////////////////////////////////////////////////

// COMPLEX THREE ATTACK COMBOS
///////////////////////////////////////////////////////////////////////////////
UCLASS()
class UCM_AttackCCombo_RightRightRight : UCM_AttackCCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_RightRightLeft : UCM_AttackCCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_RightRightTop : UCM_AttackCCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_RightRightBottom : UCM_AttackCCombo_RightRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_RightLeftRight : UCM_AttackCCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_RightLeftLeft : UCM_AttackCCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_RightLeftTop : UCM_AttackCCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_RightLeftBottom : UCM_AttackCCombo_RightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_RightTopRight : UCM_AttackCCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_RightTopLeft : UCM_AttackCCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_RightTopTop : UCM_AttackCCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_RightTopBottom : UCM_AttackCCombo_RightTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_RightBottomRight : UCM_AttackCCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_RightBottomLeft : UCM_AttackCCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_RightBottomTop : UCM_AttackCCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_RightBottomBottom : UCM_AttackCCombo_RightBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_LeftRightRight : UCM_AttackCCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_LeftRightLeft : UCM_AttackCCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_LeftRightTop : UCM_AttackCCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_LeftRightBottom : UCM_AttackCCombo_LeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_LeftLeftRight : UCM_AttackCCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_LeftLeftLeft : UCM_AttackCCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_LeftLeftTop : UCM_AttackCCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_LeftLeftBottom : UCM_AttackCCombo_LeftLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_LeftTopRight : UCM_AttackCCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_LeftTopLeft : UCM_AttackCCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_LeftTopTop : UCM_AttackCCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_LeftTopBottom : UCM_AttackCCombo_LeftTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_LeftBottomRight : UCM_AttackCCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_LeftBottomLeft : UCM_AttackCCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_LeftBottomTop : UCM_AttackCCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_LeftBottomBottom : UCM_AttackCCombo_LeftBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_TopRightRight : UCM_AttackCCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_TopRightLeft : UCM_AttackCCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_TopRightTop : UCM_AttackCCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_TopRightBottom : UCM_AttackCCombo_TopRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_TopLeftRight : UCM_AttackCCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_TopLeftLeft : UCM_AttackCCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_TopLeftTop : UCM_AttackCCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_TopLeftBottom : UCM_AttackCCombo_TopLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_TopTopRight : UCM_AttackCCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_TopTopLeft : UCM_AttackCCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_TopTopTop : UCM_AttackCCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_TopTopBottom : UCM_AttackCCombo_TopTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_TopBottomRight : UCM_AttackCCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_TopBottomLeft : UCM_AttackCCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_TopBottomTop : UCM_AttackCCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_TopBottomBottom : UCM_AttackCCombo_TopBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_BottomRightRight : UCM_AttackCCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_BottomRightLeft : UCM_AttackCCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_BottomRightTop : UCM_AttackCCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_BottomRightBottom : UCM_AttackCCombo_BottomRight
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_BottomLeftRight : UCM_AttackCCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_BottomLeftLeft : UCM_AttackCCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_BottomLeftTop : UCM_AttackCCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_BottomLeftBottom : UCM_AttackCCombo_BottomLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_BottomTopRight : UCM_AttackCCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_BottomTopLeft : UCM_AttackCCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_BottomTopTop : UCM_AttackCCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_BottomTopBottom : UCM_AttackCCombo_BottomTop
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}

UCLASS()
class UCM_AttackCCombo_BottomBottomRight : UCM_AttackCCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionRight());
}

UCLASS()
class UCM_AttackCCombo_BottomBottomLeft : UCM_AttackCCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_BottomBottomTop : UCM_AttackCCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_BottomBottomBottom : UCM_AttackCCombo_BottomBottom
{
    default AddAttack(UAbilityTask_Attack::DirectionBottom());
}
//////////////////////////////////////////////////////////////////////////////////////////////////

// COMPLEX FOUR ATTACK COMBOS
//////////////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UCM_AttackCCombo_BottomLeftRightLeft : UCM_AttackCCombo_BottomLeftRight
{
    default AddAttack(UAbilityTask_Attack::DirectionLeft());
}

UCLASS()
class UCM_AttackCCombo_LeftRightLeftTop : UCM_AttackCCombo_LeftRightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

UCLASS()
class UCM_AttackCCombo_BottomRightLeftTop : UCM_AttackCCombo_BottomRightLeft
{
    default AddAttack(UAbilityTask_Attack::DirectionTop());
}

//////////////////////////////////////////////////////////////
//     DYNAMIC COMBO
//////////////////////////////////////////////////////////////

UCLASS()
class UCM_AttackDCombo : UCM_AttackCombo
{
    UAbilityTask_Attack AttackTask = nullptr;
    FGameplayTag NextAttackDirection = FGameplayTag();

    int AttacksDone = 0;

    private bool bComboClosed = false;

    FGameplayTag GetAttackDirection() const override property
    {
        return _AttackDirection;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        check(NextAttackDirection.IsValid());
        if (!NextAttackDirection.IsValid())
            return;

        Super::DoTask();

        if (!IsValid(this))
            return;

        AttackTask = TaskAttack(AI, NextAttackDirection);
        NextAttackDirection = FGameplayTag();

        AttackTask.OnContinueCombo.AddUFunction(this, n"HandleContinueCombo");
        AttackTask.bEndComboOnMiss = Combat.Config.bEndCombosOnMiss;

        WaitForTask(AttackTask);
    }

    UFUNCTION()
    private void HandleContinueCombo(UAbilityTask_Attack Task)
    {
        AttacksDone += 1;

        if (!NextAttackDirection.IsValid())
            return;

        if (Task.PossibleComboMoves.HasTag(NextAttackDirection))
        {
            Task.ComboChain.Add(NextAttackDirection);
            NextAttackDirection = FGameplayTag();
        }
    }

    UFUNCTION()
    bool HasNextAttackBeenAdded()
    {
        if (AttackTask.ComboChain.Num() > 0)
            return true;

        return NextAttackDirection.IsValid();
    }

    UFUNCTION()
    bool IsComboClosed()
    {
        return bComboClosed;
    }

    UFUNCTION()
    void CloseCombo()
    {
        bComboClosed = true;
    }
}

UCLASS()
class UCM_AttackDCombo_Left : UCM_AttackDCombo
{
    default _AttackDirection = GameplayTag::Combat_Attack_Left;

    default NextAttackDirection = UAbilityTask_Attack::DirectionLeft();

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Left);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Left, 0.0f);
}

UCLASS()
class UCM_AttackDCombo_Right : UCM_AttackDCombo
{
    default _AttackDirection = GameplayTag::Combat_Attack_Right;

    default NextAttackDirection = UAbilityTask_Attack::DirectionRight();

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Right);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Right, 0.0f);
}

UCLASS()
class UCM_AttackDCombo_Top : UCM_AttackDCombo
{
    default _AttackDirection = GameplayTag::Combat_Attack_Top;

    default NextAttackDirection = UAbilityTask_Attack::DirectionTop();

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Top);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Top, 0.0f);
}

UCLASS()
class UCM_AttackDCombo_Bottom : UCM_AttackDCombo
{
    default _AttackDirection = GameplayTag::Combat_Attack_Bottom;

    default NextAttackDirection = UAbilityTask_Attack::DirectionBottom();

    default MoveTypes.AddTag(GameplayTag::Action_Attack_Bottom);

    default CooldownSeconds = 0.0f;
    default MoveTypeCooldowns.Add(GameplayTag::Action_Attack_Bottom, 0.0f);
}

UCLASS()
class UCM_Attack_ExecuteDefeatedCharacter : UCM_Attack
{
    default bRequiresNonDefeatedTarget = false;
    default bRequiresDefeatedTarget = true;
    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack);
    
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.ExecuteDefeatedCharacter(Combat.CharacterOfInterest).Result);
    }
}

//////////////////////////////////////////////////////////////
//     TAUNTS
//////////////////////////////////////////////////////////////
UCLASS()
class UCM_Taunt : UAITask_CombatMove
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_Taunt);

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Turning);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_Turning);

    default MoveTypes.AddTag(GameplayTag::Action_Taunt);
    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Taunts);

    TSet<UCombatTauntRequestObject> _TauntRequirements;
    default _TauntRequirements.Add(UCombatTauntRequirements_Close());
    default _TauntRequirements.Add(UCombatTauntRequirements_InMovement());
    default _TauntRequirements.Add(UCombatTauntRequirements_Running());
    default _TauntRequirements.Add(UCombatTauntRequirements_InPlace());
    default _TauntRequirements.Add(UCombatTauntRequirements_Gross());

    UCombatTauntRequestObject GetCurrentTauntRequirements() const
    {
        UCombatTauntRequestObject CurrentRequirements = UCombatTauntRequestObject();
        CurrentRequirements.Combat = Combat;
        for (auto Requirement : _TauntRequirements)
        {
            if (!Requirement.IsConditionsFulfilled())
                continue;

            CurrentRequirements.AllRequired.AppendTags(Requirement.AllRequired);
            CurrentRequirements.Blocked.AppendTags(Requirement.Blocked);

            if (Requirement.AnyRequired.GameplayTags.IsEmpty())
                continue;

            FGameplayTagContainer AnyRequired_InCooldown;
            FGameplayTagContainer AnyRequired_NotInCooldown;
            for (auto Tag : Requirement.AnyRequired.GameplayTags)
            {
                if (Combat.GetTagCooldownSecondsLeft(Tag) > 0.0f)
                {
                    AnyRequired_InCooldown.AddTag(Tag);
                    continue;
                }

                AnyRequired_NotInCooldown.AddTag(Tag);
            }

            if (AnyRequired_NotInCooldown.IsEmpty())
            {
                CurrentRequirements.AnyRequired.AppendTags(AnyRequired_InCooldown);
                continue;
            }

            if (AnyRequired_NotInCooldown.Num() == 1)
            {
                CurrentRequirements.AllRequired.AppendTags(AnyRequired_NotInCooldown);
                continue;
            }
            
            CurrentRequirements.AnyRequired.AppendTags(AnyRequired_NotInCooldown);
        }

        CurrentRequirements.Blocked.AddTag(GameplayTag::Combat_Taunt_Warning);
        return CurrentRequirements;
    }

    bool CancelMovementOnStart() const override
    {
        if (Combat.Self.IsSwimming())
            return !Combat.bCanDoTauntsWhileSwimming;

        if (Combat.Self.IsDiving())
            return !Combat.bCanDoTauntsWhileDiving;

        return !Combat.bCanDoTauntsWhileMoving;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_Taunt::IsMoveAllowed"));

        if (!Combat.CanTaunt())
        {
            Reason = "Agent can't taunt.";
            return false;
        }

        if (!Combat.bTauntsEnabled)
        {
            Reason = "Agent has taunts disabled";
            return false;
        }

        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.IsInBlockingStance())
        {
            Reason = "In blocking stance";
            return false;
        }

        if (!Combat.Self.HasDrawnWeapon())
        {
            Reason = "No weapon drawn";
            return false;
        }

        if (Combat.Self.HasDrawnCrossbow() && Combat.Self.IsAiming())
        {
            Reason = "Is aiming with crossbow";
            return false;
        }

        if (IsValid(Combat.ActionsHandler.CurrentAction) && Combat.ActionsHandler.CurrentAction.Priority == ECombatActionPriority::Low)
        {
            Reason = "Already doing a low priority action";
            return false;
        }

        if (Combat.Self.IsDoingMagic() || Combat.Self.IsDoingAttack())
        {
            Reason = "Doing magic or attack";
            return false;
        }

        if (!Combat.Self.Perception.CanSee(Combat.CharacterOfInterest))
        {
            Reason = "Can't see character of interest.";
            return false;
        }

        if (Combat.DistanceToCharacterOfInterest < 0.0f)
        {
            Reason = "Could not calculate distance to CharacterOfInterest";
            return false;
        }

        if (IsValid(Combat.CharacterOfInterest) && Combat.DistanceToCharacterOfInterest < MinimumRequiredDistance)
        {
            Reason = "Too close for taunt";
            return false;
        }

        if (_TauntRequirements.IsEmpty())
        {
            Reason = "No taunt option presets found";
            return false;
        }

        auto CurrentTauntRequirements = GetCurrentTauntRequirements();
        if (CurrentTauntRequirements.IsInCooldown())
        {
            Reason = "Current taunt requirements in cooldown";
            return false;
        }
        
        FGameplayTag DrawnWeaponTypeTag = Combat.Self.GetDrawnWeaponTypeTag();
        if (!DrawnWeaponTypeTag.IsValid())
        {
            Reason = "Drawn weapon type tag is invalid";
            return false;
        }

        const UDataModule_Animation Datamodule_Animation = DataModule::GetAnimationDataModule(Combat.Self);
        const UItemAnimConfig AnimConfig = Datamodule_Animation.GetItemAnimConfig(DrawnWeaponTypeTag);
        const UWeaponItemAnimConfig WeaponAnimConfig = Cast<UWeaponItemAnimConfig>(AnimConfig);
        if (!IsValid(WeaponAnimConfig))
        {
            Reason = "Weapon anim config is invalid";
            return false;
        }

        auto AllRequired = CurrentTauntRequirements.AllRequired;
        auto AnyRequired = CurrentTauntRequirements.AnyRequired;
        auto Blocked = CurrentTauntRequirements.Blocked;
        if (!IsTauntAvailableMatchingRequirements(WeaponAnimConfig, AllRequired, AnyRequired, Blocked))
        {
            Reason = "No available taunt matching requirements";
            return false;
        }

        return true;
    }

    UFUNCTION()
    bool IsTauntAvailableMatchingRequirements(const UWeaponItemAnimConfig WeaponAnimConfig, FGameplayTagContainer AllRequired, FGameplayTagContainer AnyRequired, FGameplayTagContainer Blocked) const
    {
        if (!IsValid(WeaponAnimConfig))
            return false;

        if (AllRequired.IsEmpty() && AnyRequired.IsEmpty() && Blocked.IsEmpty())
            return true;
        
        auto TauntDataDO = WeaponAnimConfig.m_TauntData.GetDefaultObject();
        if (AnyRequired.IsEmpty())
            return TauntDataDO.CheckTauntAvailableMatchingAll(AllRequired, Blocked);
        
        return TauntDataDO.CheckTauntAvailableMatchingAllAndAny(AllRequired, AnyRequired, Blocked);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        auto CurrentTauntRequirements = GetCurrentTauntRequirements();
        FCombatTauntRequestTags TauntRequest;
        TauntRequest.AllRequired = CurrentTauntRequirements.AllRequired;
        TauntRequest.AnyRequired = CurrentTauntRequirements.AnyRequired;
        TauntRequest.Blocked = CurrentTauntRequirements.Blocked;

        Combat.ConflictInstanceGroup.ReportTauntRequest(TauntRequest);

        if (!PerformTaunt(TauntRequest.AllRequired, TauntRequest.AnyRequired, TauntRequest.Blocked).WasSuccessful())
        {
            EndTaskAsFailure();
            return;
        }

        auto CombatDataModule = DataModule::GetCombatDataModule(Combat.Self);
        auto LastTauntTags = CombatDataModule.GetLastTauntTags();
        
        for (auto Tag : LastTauntTags.GameplayTags)
        {
            if (!IsValid(Combat.CurrentCombatBehaviorSet))
                continue;

            Combat.SetTagCooldown(Tag, Combat.CurrentCombatBehaviorSet.GetTauntCooldownForType(Tag));
        }
        
        AI.WaitUntilNoLongerBlocked();
    }

    float GetMinimumRequiredDistance() const property
    {
        return 200.0f;
    }

    bool CanWalkDuringCombatMove() const override
    {
        auto CombatDataModule = DataModule::GetCombatDataModule(Combat.Self);
        auto LastTauntTags = CombatDataModule.GetLastTauntTags();

        if (LastTauntTags.GameplayTags.Contains(GameplayTag::Action_Taunt_InMovement))
            return true;

        return false;
    }

    FAbilityTaskExecutor PerformTaunt(FGameplayTagContainer AllRequired, FGameplayTagContainer AnyRequired, FGameplayTagContainer Blocked)
    {
        return AI.TauntMatchingAllAndOne(AllRequired, AnyRequired, Blocked);
    }
}

UCLASS()
class UCM_Taunt_Voiced : UCM_Taunt
{
    FAbilityTaskExecutor PerformTaunt(FGameplayTagContainer AllRequired, FGameplayTagContainer AnyRequired, FGameplayTagContainer Blocked) override
    {
        FGameplayTag TauntVoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt;
        AGothicCharacterState Target;
        FGenericVoicelineRequestContext Context; 

        if (IsValid(Combat.CharacterOfInterest))
        {
            Target = Combat.CharacterOfInterest.CharacterState;
            Context = CreateContextForTarget(Target);
        }

        FGameplayTagContainer NewAllRequired = AllRequired;
        FGameplayTagContainer NewAnyRequired = AnyRequired;
        FGameplayTagContainer NewBlocked = Blocked;

        

        bool bProbabilityGateSuccess = true;
        if (Combat.Config.TauntVoiceProbability < 1.0f)
        {
            bProbabilityGateSuccess = Math::RandRange(0.0f, 1.0f) > 1.0f - Combat.Config.TauntVoiceProbability;
        }

        bool bHasVoiceline = AI.CharacterState.Voiceline.HasVoicelineForWithContext(TauntVoicelineTag, Target, Context);
        if (bProbabilityGateSuccess && bHasVoiceline)
        {
            AI.CharacterState.Voiceline.SayVoicelineWithContext(TauntVoicelineTag, Target, Context, EPerceptionNoiseLoudness::Loud);
            NewBlocked.AddTag(GameplayTag::Combat_Taunt_NoVoice);
        }
        
        return Super::PerformTaunt(NewAllRequired, NewAnyRequired, NewBlocked);
    }

    FGenericVoicelineRequestContext CreateContextForTarget(AGothicCharacterState Target) const
    {
        FGenericVoicelineRequestContext Context;

        if (AI.CharacterState.IsOfSpecies(GameplayTag::Species_Human) && 
            AI.CharacterState.IsInTrainingFightAgainst(Target))
        {
            Context.TagsOther.AddTag(GameplayTag::VoicelineContext_Training);
            return Context;
        }

        if (AI.CharacterState.IsOfSpecies(GameplayTag::Species_Orc) || AI.CharacterState.IsOfSpecies(GameplayTag::Species_Creature) ||
            Target.IsOfSpecies(GameplayTag::Species_Orc) || Target.IsOfSpecies(GameplayTag::Species_Creature))
        {
            Context.TagsOther.AddTag(GameplayTag::VoicelineContext_Death);
            return Context;
        }

        if (AI.CharacterState.IsOfSpecies(GameplayTag::Species_Human))
        {
            for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
            {
                if (!Modifier.IsA(UActivePersonalRelationshipModifier_ExecuteCharacter::StaticClass()))
                    continue;

                if (Cast<UActivePersonalRelationshipModifier_ExecuteCharacter>(Modifier).TargetCharacter != Target)
                    continue;

                Context.TagsOther.AddTag(GameplayTag::VoicelineContext_Death);
                break;
            }
        }

        return Context;
    }
}

//////////////////////////////////////////////////////////////
//     MISC
//////////////////////////////////////////////////////////////

/** Wait for a set period of time */
UCLASS()
class UCM_Wait : UCM_StopMoving
{
    UCM_Wait(float InSecondsToWait)
    {
        SecondsToWait = InSecondsToWait;
    }

    default bCanBeInterruptedByEverything = true;

    UPROPERTY()
    float SecondsToWait = 0.2f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (Combat.CurrentActionCombatMove == nullptr &&
            Combat.CurrentMovementCombatMove == nullptr)
        {
            WaitSeconds(1.0f);
        }

        AI.WaitUntilNoLongerBlocked();
        
        EndTaskAsSuccess();
        return;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        return true;
    }
}

/** Move to debug ai script logic and situations */
UCLASS()
class UCM_Debug : UAITask_CombatMove
{
    UCM_Debug(FString InDebugText, float InDuration)
    {
        DebugText = InDebugText;
        Duration = InDuration;
    }

    UPROPERTY()
    float Duration = 2.0f;

    UPROPERTY()
    FString DebugText = "Debug Combat Move";

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        // Print(DebugText, Duration);
    }
}

/** Move in a circling path around the target */
UCLASS()
class UCM_MoveCircleAroundTarget : UCM_Movement
{
    UCM_MoveCircleAroundTarget(int InMaxPositions, float InPathStepArcLength)
    {
        MaximumPositionsInPath = InMaxPositions;
        PathStepArcLength = InPathStepArcLength;
    }

    UPROPERTY()
    int MaximumPositionsInPath = 5;

    UPROPERTY()
    float PathStepArcLength = 300.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (!Combat.CharacterOfInterest.IsCharacterDirectionFacingOtherCharacter(Combat.Self, Combat.CharacterOfInterest.ActorForwardVector) && 
            !Combat.CharacterOfInterest.IsCharacterDirectionFacingOtherCharacter(Combat.Self, -Combat.CharacterOfInterest.ActorForwardVector))
        {
            // Character is not in front or back quadrant of target
            EndTaskAsFailure();
            return;
        }

        Super::DoTask();

        if (!IsValid(this))
            return;

        int Index = 1;
        int DirectionSign = 1;
        FVector NextPosition;

        while(Index < MaximumPositionsInPath)
        {
            if (!Combat.Positioning.GetCirclingPathAroundTarget(NextPosition, Index, PathStepArcLength, MaximumPositionsInPath, DirectionSign))
            {
                EndTaskAsFailure();
                return;
            }
            Index++;

            SetWalkSpeedBasedOnDistance(NextPosition, 30.0f);
            if (NextPosition.Distance(Combat.Self.FeetLocation) < 35.0f)
            {
                WaitOneTick();
                continue;
            }

            if (!GoToLocation(NextPosition))
            {
                EndTaskAsFailure();
                return;
            }
            
            WaitOneTick();
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveCircleAroundTarget::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No valid character of interest to circle";
            return false;
        }

        if (Combat.DistanceToCharacterOfInterest - Combat.Config.PreferredDistance > PathStepArcLength * 1.25f)
        {
            Reason = "Too far from preferred distance";
            return false;
        }

        if (!Combat.CharacterOfInterest.IsCharacterDirectionFacingOtherCharacter(Combat.Self, Combat.CharacterOfInterest.ActorForwardVector) && 
            !Combat.CharacterOfInterest.IsCharacterDirectionFacingOtherCharacter(Combat.Self, -Combat.CharacterOfInterest.ActorForwardVector))
        {
            Reason = "Character is not in front or back quadrant of target";
            return false;
        }

        return true;
    }
}

/** Strafe in a circling path around the target */
UCLASS()
class UCM_StrafeAroundCharacterOfInterest : UCM_Movement
{
    UCM_StrafeAroundCharacterOfInterest(float InMinimumPathLength, float InMaximumPathLength)
    {
        MaximumPathLength = InMaximumPathLength;
        MinimumPathLength = InMinimumPathLength;
        b_RandomizePathLength = true;
    }

    UCM_StrafeAroundCharacterOfInterest(float InPathLength)
    {
        MaximumPathLength = InPathLength;
        b_RandomizePathLength = true;
    }

    UPROPERTY()
    float MaximumPathLength;

    UPROPERTY()
    float MinimumPathLength;

    UPROPERTY()
    float MaximumMoveAngleDegrees = 60.0f;

    UPROPERTY()
    private bool b_RandomizePathLength = false;

    UPROPERTY()
    float DistanceToKeepThreshold = 20.0f;

    protected FVector StartDirectionToTarget;
    protected AGothicCharacter CharacterToStrafeAround;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        CancelTauntsIfNecessary();

        CharacterToStrafeAround = AI.CharacterOfInterest;

        if (!IsValid(CharacterToStrafeAround))
        {
            EndTaskAsFailure();
            return;
        }

        AI.SetTargetEnemy(Combat.CharacterOfInterest, EGothicFocusPriority::CombatMove, this);

        StartDirectionToTarget = Combat.DirectionAwayFromTarget;

        float DistanceMoved = 0.0f;

        float DistanceToMove = MaximumPathLength;
        if (b_RandomizePathLength)
        {
            DistanceToMove = Math::RandRange(Math::Min(MinimumPathLength, MaximumPathLength), MaximumPathLength);
        }

        float DirectionSign = 1.0f;
        FVector StrafeSideVector = Combat.DirectionAwayFromTarget.CrossProduct(FVector::UpVector) * DirectionSign;
        FVector KeepDistanceVector = (Combat.DirectionAwayFromTarget * (DistanceToKeep - Combat.DistanceToCharacterOfInterest)).GetSafeNormal2D(Math::Square(DistanceToKeepThreshold));
        bool bCanMoveToPositiveSide = CanMoveStraightIntoSide(StrafeSideVector, KeepDistanceVector);
        float DistanceFromCenterOfMass = Combat.CombatGroup.CombatCenterOfMass.Distance(Combat.Self.ActorLocation);
        float PositiveSideDistanceFromCenterOfMass = Combat.CombatGroup.CombatCenterOfMass.Distance(Combat.Self.ActorLocation + StrafeSideVector * DistanceToMove);
        if ((Math::RandBool() || !bCanMoveToPositiveSide || PositiveSideDistanceFromCenterOfMass < DistanceFromCenterOfMass) && 
            CanMoveStraightIntoSide(StrafeSideVector * -1.0f, KeepDistanceVector))
        {
            DirectionSign = -1.0f;
        }

        if (DirectionSign > 0.0f && !bCanMoveToPositiveSide)
        {
            EndTaskAsFailure();
            return;
        }

        FVector LastLocation = Combat.Self.ActorLocation;

        while (AI.CharacterOfInterest == CharacterToStrafeAround && 
               DistanceMoved < DistanceToMove &&
               Math::RadiansToDegrees(Combat.DirectionAwayFromTarget.AngularDistance(StartDirectionToTarget)) < MaximumMoveAngleDegrees)
        {
            StrafeSideVector = Combat.DirectionAwayFromTarget.CrossProduct(FVector::UpVector) * DirectionSign;
            KeepDistanceVector = (Combat.DirectionAwayFromTarget * (DistanceToKeep - Combat.DistanceToCharacterOfInterest)).GetSafeNormal2D(Math::Square(DistanceToKeepThreshold));
            FVector MovementVector = (StrafeSideVector + KeepDistanceVector).GetSafeNormal2D();

            // DebugScript::DrawLine(Self.FeetLocation, Self.FeetLocation + MovementVector * 100, FColor::Green, 0);

            FVector HitLocation;
            if (!UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, 
                MovementVector, 
                Combat.Self.SimpleCollisionRadius * 2 + 30.0f, 
                HitLocation))
                break;

            Combat.Self.MovementComponent.AddInputVector(MovementVector);
            WaitOneTick();

            DistanceMoved += Combat.Self.ActorLocation.Distance(LastLocation);
            LastLocation = Combat.Self.ActorLocation;
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_StrafeAroundCharacterOfInterest::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.Self.CanStrafe())
        {
            Reason = "Cannot strafe";
            return false;
        }

        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No CharacterOfInterest";
            return false;
        }

        if (!CanMoveStraightIntoEitherDirection())
        {
            Reason = "Destination obstructed";
            return false;
        }

        return true;
    }

    bool CanMoveStraightIntoEitherDirection() const
    {
        FVector StrafeSideVector = Combat.DirectionAwayFromTarget.CrossProduct(FVector::UpVector);
        FVector KeepDistanceVector = (Combat.DirectionAwayFromTarget * (DistanceToKeep - Combat.DistanceToCharacterOfInterest)).GetSafeNormal2D(Math::Square(DistanceToKeepThreshold));
        
        if (CanMoveStraightIntoSide(StrafeSideVector, KeepDistanceVector))
            return true;

        if (CanMoveStraightIntoSide(StrafeSideVector * -1.0f, KeepDistanceVector))
            return true;

        return false;
    }

    bool CanMoveStraightIntoSide(FVector StrafeSideVector, FVector KeepDistanceVector) const
    {
        FVector MovementVector = (StrafeSideVector + KeepDistanceVector).GetSafeNormal2D();

        FVector HitLocation;
        if (UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, 
            MovementVector, 
            Combat.Self.SimpleCollisionRadius * 2 + 30.0f, 
            HitLocation))
            return true;
        
        return false;
    }

    float GetDistanceToKeep() const property
    {
        switch (Combat.Config.PreferredDistanceBehavior)
        {
            case EPreferredDistanceBehavior::CloserThan:
            {
                return Math::Min(Combat.Config.PreferredDistance, Combat.DistanceToCharacterOfInterest);
            }
            case EPreferredDistanceBehavior::FartherThan:
            {
                return Math::Max(Combat.Config.PreferredDistance, Combat.DistanceToCharacterOfInterest);
            }
            case EPreferredDistanceBehavior::Exact:
            default:
            {
                return Combat.Config.PreferredDistance;
            }
        }
    }
}

/** Sprint away from target in order to re-engage */
UCLASS()
class UCM_MoveFeignRetreat : UCM_Movement
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_LockRoles);

    UPROPERTY()
    int MaximumPositionsInPath = 5;

    UPROPERTY()
    float PathStepArcLength = 300.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;
        
        float RetreatDistance = 1200.0f;
        float RetreatPointRadius = 100.0f;
        float MidpointDistance = 900.0f;
        float MidpointRadius = 100.0f;
        float MidpointAngle = 60.0f;

        FVector RetreatDirection = Combat.Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation;
        RetreatDirection.Normalize();
        
        VLog::Arrow(Combat.Self, "FR - Direction", Combat.Self.NavAgentLocation, Combat.Self.NavAgentLocation + RetreatDirection * 100.0f, FColor::Green);

        float Sign_Side = 1.0f;
        if (Math::RandBool())
        {
            Sign_Side = -1.0f;
        }

        float Sign_FrontBack = 1.0f;
        if (Math::RandBool())
        {
            Sign_FrontBack = -1.0f;
        }

        FVector Axis = FVector::UpVector * Sign_Side;
        FVector MidpointDirection = RetreatDirection.RotateAngleAxis(MidpointAngle, Axis);

        FVector MidpointSearchOrigin = Combat.Self.NavAgentLocation + (MidpointDirection * MidpointDistance * Sign_FrontBack);
        FVector MidpointLocation;
        if (!UNavigationSystemV1::TryGetRandomNavigablePointInRadius(Combat.Self.CharacterState, MidpointSearchOrigin, MidpointRadius, MidpointLocation))
        {
            EndTaskAsFailure();
            return;
        }

        float32 PathToMidpointLength = MAX_flt;
        float PathToMidpointLengthThreshold = (MidpointDistance + MidpointRadius) * 1.15f;
        bool bMidpointReachableWithinCost = UNavigationSystemV1::DoesPathExistWithinLengthLimit(Combat.Self, Combat.Self.NavAgentLocation, MidpointLocation, PathToMidpointLengthThreshold, PathToMidpointLength);

        VLog::Location(Combat.Self, "FR - Midpoint", MidpointLocation, 10.0f, FColor::Green);
        
        FVector RetreatSearchOrigin = Combat.Self.NavAgentLocation + (RetreatDirection * RetreatDistance * Sign_FrontBack);
        FVector RetreatLocation;
        if (!UNavigationSystemV1::TryGetRandomNavigablePointInRadius(Combat.Self.CharacterState, RetreatSearchOrigin, RetreatPointRadius, RetreatLocation))
        {
            EndTaskAsFailure();
            return;
        }

        float32 PathToEndpointLength = MAX_flt;
        bool bEndpointReachableWithinCost = false;

        if (bMidpointReachableWithinCost)
        {
            float PathMidpointToEndpointLengthThreshold = (MidpointLocation - RetreatLocation).Size() * 1.15f;
            bEndpointReachableWithinCost = UNavigationSystemV1::DoesPathExistWithinLengthLimit(Combat.Self, MidpointLocation, RetreatLocation, PathMidpointToEndpointLengthThreshold, PathToEndpointLength);
        }
        else
        {
            float PathToRetreatLengthThreshold = (RetreatDistance + RetreatPointRadius) * 1.15f;
            bEndpointReachableWithinCost = UNavigationSystemV1::DoesPathExistWithinLengthLimit(Combat.Self, Combat.Self.NavAgentLocation, RetreatLocation, PathToRetreatLengthThreshold, PathToEndpointLength);
        }

        VLog::Location(Combat.Self, "FR - Endpoint", RetreatLocation, 10.0f, FColor::Green);

        if (!bMidpointReachableWithinCost && !bEndpointReachableWithinCost)
        {
            EndTaskAsFailure();
            return;
        }

        if (Combat.CanSprint())
        {
            Combat.SetWalkSpeed(EWalkSpeed::Sprinting);
        }
        else
        {
            Combat.SetWalkSpeed(EWalkSpeed::Running);
        }

        CancelTauntsIfNecessary();
        if (bMidpointReachableWithinCost)
        {
            AI.GotoPosition(MidpointLocation, 200.0f);
        }

        if (bEndpointReachableWithinCost)
        {
            AI.GotoPosition(RetreatLocation, 200.0f);
        }

        if (!bMidpointReachableWithinCost)
        {
            AI.DodgeAwayFrom(Combat.CharacterOfInterest);
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveCircleAroundTarget::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        return true;
    }
}

/** Move to preferred location while it's unchanged. */
UCLASS()
class UCM_MoveTowardsPreferredPosition : UCM_Movement
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        // AI.SetTargetEnemy(Combat.CharacterOfInterest);

        // FVector CurrentLocation = Combat.Self.GetFeetLocation();
        // FVector PreferredLocation = Combat.Positioning.PreferredLocation;

        // VLog::Location(Combat.Self, "CurrentLocation", CurrentLocation + FVector::UpVector * 10.0f, 10.0f, FColor::Blue);
        // VLog::Location(Combat.Self, "PreferredLocation", PreferredLocation + FVector::UpVector * 10.0f, 10.0f, FColor::Purple);

        // VLog::Arrow(Combat.Self, "", CurrentLocation + FVector::UpVector * 10.0f, PreferredLocation + FVector::UpVector * 10.0f, FColor::Purple);

        // if (AI.IsFollowingActor(Combat.CharacterOfInterest))
        // {
        //     AI.StopFollowingActor(Combat.CharacterOfInterest);
        // }

        // if (CurrentLocation.Distance(PreferredLocation) < Combat.Positioning.MinimumPositionDistance)
        // {
        //     EndTaskAsFailure();
        //     return;
        // }

        // if (!Combat.Self.CanStrafe() && !IsLocationReachableWithoutStrafing(PreferredLocation))
        // {
        //     EndTaskAsFailure();
        //     return;
        // }

        // SetWalkSpeedBasedOnDistance(PreferredLocation, 30.0f);
        // // AI.GotoPosition(Combat.CharacterOfInterest.ActorLocation + Combat.Positioning.PreferredLocation);

        // EndTaskAsSuccess();
        return;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsPreferredPosition::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Positioning == nullptr)
            return false;

        if (Combat.Positioning.IsInsidePreferredLocation())
        {
            Reason = "Already within preferredlocation";
            return false;
        }

        // if (Combat.Positioning.PreferredLocation.Distance(Combat.Self.ActorLocation) <= Combat.Positioning.MinimumPositionDistance)
        // {
        //     Reason = "Too close to preferredlocation to move";
        //     return false;
        // }

        // if (Combat.Config.PreferredDistanceBehavior == EPreferredDistanceBehavior::CloserThan &&
        //     Combat.Self.GetFeetLocation().Distance(Combat.CharacterOfInterest.GetFeetLocation()) <= 
        //     Combat.Positioning.PreferredLocation.Distance(Combat.CharacterOfInterest.GetFeetLocation()))
        // {

        //     return false;
        // }

        // if (Combat.Config.PreferredDistanceBehavior == EPreferredDistanceBehavior::FartherThan &&
        //     Combat.Self.GetFeetLocation().Distance(Combat.CharacterOfInterest.GetFeetLocation()) >= 
        //     Combat.Positioning.PreferredLocation.Distance(Combat.CharacterOfInterest.GetFeetLocation()))
        //     return false;

        // if (Combat.CharacterOfInterest.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_WaitReceiveRiposte))
        //     return false;

        // if (!Combat.AI.CanGotoPosition(Combat.Positioning.PreferredLocation))
        //     return false;
        
        return true;
    }
}

/** Follow character with offset */
UCLASS()
class UCM_FollowCharacterOfInterestWithPositioningOffset : UCM_Movement
{
    UPROPERTY()
    bool bShouldFollow = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        FVector PreferredLocation = FVector::ZeroVector;
        Combat.Positioning.GetLocationToMoveTo(PreferredLocation);
        FVector Offset = PreferredLocation - Combat.CharacterOfInterest.ActorLocation;

        if (AI.IsFollowingActor(Combat.CharacterOfInterest))
        {
            AI.StopFollowingActor(Combat.CharacterOfInterest);
        }
        
        SetMovementSpeed(Combat.CharacterOfInterest, Combat.CharacterOfInterest.NavAgentLocation + Offset);

        SetCustomPathfollowingSetting(Combat.SetupCombatPathfollowingSettings());
        CancelTauntsIfNecessary();
        AI.FollowWithWorldOffset(Combat.TargetCharacter, Offset);

        while(bShouldFollow)
        {
            if (Combat.Self.IsPathfollowing())
            {
                CancelTauntsIfNecessary();
            }

            WaitOneTick();
        }

        EndTaskAsSuccess();
        return;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsPreferredPosition::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Positioning == nullptr)
            return false;

        // if (Combat.Positioning.IsInsidePreferredLocation())
        // {
        //     Reason = "Already within preferredlocation";
        //     return false;
        // }

        // if (Combat.Positioning.PreferredLocation.Distance(Combat.Self.ActorLocation) <= Combat.Positioning.MinimumPositionDistance)
        // {
        //     Reason = "Too close to preferredlocation to move";
        //     return false;
        // }

        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "No character of interest.";
            return false;
        }

        // if (Combat.Config.PreferredDistanceBehavior == EPreferredDistanceBehavior::CloserThan &&
        //     Combat.Self.GetFeetLocation().Distance(Combat.CharacterOfInterest.GetFeetLocation()) <= 
        //     Combat.Positioning.PreferredLocation.Distance(Combat.CharacterOfInterest.GetFeetLocation()))
        //     return false;

        // if (Combat.Config.PreferredDistanceBehavior == EPreferredDistanceBehavior::FartherThan &&
        //     Combat.Self.GetFeetLocation().Distance(Combat.CharacterOfInterest.GetFeetLocation()) >= 
        //     Combat.Positioning.PreferredLocation.Distance(Combat.CharacterOfInterest.GetFeetLocation()))
        //     return false;

        if (Combat.CharacterOfInterest.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_WaitReceiveRiposte))
            return false;
        
        return true;
    }
}

// /** Move to preferred location while it's unchanged. */
// UCLASS()
// class UCM_MoveTowardsPositioningMovementDirection : UCM_Movement
// {
//     UPROPERTY()
//     UCM_GoIntoDirection MovementTask;
//     UCM_GoIntoDirection MovementCombatMove = UCM_GoIntoDirection();

//     UPROPERTY()
//     bool bShouldExitCombatMove = false;

//     UFUNCTION(BlueprintOverride)
//     void DoTask()
//     {
//         Super::DoTask();

//         if (!IsValid(this))
//             return;

//         while(!bShouldExitCombatMove)
//         {
//             FVector CurrentLocation = Combat.Self.NavAgentLocation;
//             FVector MovementVector = Combat.Positioning.GetNewMovementVector();

//             if (IsValid(MovementTask) && (MovementVector - (MovementTask.Direction * MovementTask.Distance)).Size() < 30.0f)
//             {
//                 VLog::Location(Combat.Self, "CurrentLocation-NoMove", CurrentLocation + FVector::UpVector * 10.0f, 10.0f, FColor::Purple);
//                 EndTaskAsSuccess();
//                 continue;
//             }

//             if (MovementVector.Size() < 50.0f)
//             {
//                 VLog::Location(Combat.Self, "CurrentLocation-NoMove", CurrentLocation + FVector::UpVector * 10.0f, 10.0f, FColor::Purple);
//                 EndTaskAsSuccess();
//                 continue;
//             }

//             ClearMovementTask();

//             if (MovementVector == FVector::ZeroVector)
//             {
//                 VLog::Location(Combat.Self, "CurrentLocation-NoMove", CurrentLocation + FVector::UpVector * 10.0f, 10.0f, FColor::Purple);
//                 EndTaskAsSuccess();
//                 return;
//             }

//             VLog::Arrow(Combat.Self, "MovementDirection", CurrentLocation, CurrentLocation + MovementVector, FColor::Purple);

//             if (AI.IsFollowingActor(Combat.CharacterOfInterest))
//             {
//                 AI.StopFollowingActor(Combat.CharacterOfInterest);
//             }

//             if (!Combat.Self.CanStrafe() && !IsLocationReachableWithoutStrafing(CurrentLocation + MovementVector))
//             {
//                 EndTaskAsFailure();
//                 return;
//             }

//             if (Combat.AI.PreferredLocation.GetDistanceFromPosition(CurrentLocation + MovementVector) > Combat.AI.GetConflictDistanceToPreferredLocationThreshold())
//             {
//                 EndTaskAsFailure();
//                 return;
//             }

//             CancelTauntsIfNecessary();

//             SetWalkSpeedBasedOnDistance(CurrentLocation + MovementVector * 3.0f, 30.0f);
//             MovementTask = Cast<UCM_GoIntoDirection>(MovementCombatMove.DuplicateTask(Combat.Ability, this));
//             MovementTask.Direction = MovementVector.GetSafeNormal();
//             MovementTask.Distance = MovementVector.Size();
//             MovementTask.ReadyForActivation();

//             WaitSeconds(0.25f);
//         }
//     }

//     void ClearMovementTask()
//     {
//         if (MovementTask == nullptr)
//             return;

//         if (MovementTask.HasBeenActivated() && MovementTask.IsActive())
//         {
//             MovementTask.ExternalCancel();
//             MovementTask = nullptr;
//         }
//     }

//     bool IsMoveAllowed(FString&out Reason) const override
//     {
//         FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_MoveTowardsPositioningMovementDirection::IsMoveAllowed"));
        
//         if (!Super::IsMoveAllowed(Reason))
//             return false;
        
//         return true;
//     }
// }

UCLASS()
class UCM_GoIntoDirection : UCM_Movement
{
    UCM_GoIntoDirection(FVector InDirection, float InDistance)
    {
        Direction = InDirection;
        Distance = InDistance;
    }

    UPROPERTY()
    FVector Direction;

    UPROPERTY()
    float Distance;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        CancelTauntsIfNecessary();
        EndTaskWithResult(AI.GoIntoDirection(Direction, Distance).Result);
    }
}

// MOVEMENT
UCLASS()
class UCM_RelativePositioning : UCM_Movement
{
    UPROPERTY()
    bool bShouldFollow = true;

    UPROPERTY()
    FVector Offset;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (!IsValid(Combat) || !IsValid(Combat.Positioning) || !IsValid(Combat.CharacterOfInterest))
        {
            EndTaskAsFailure();
            return;
        }

        GenerateNewOffset();

        while(bShouldFollow)
        {
            if (!IsValid(Combat) || !IsValid(Combat.Positioning) || !IsValid(Combat.CharacterOfInterest))
            {
                EndTaskAsFailure();
                return;
            }

            // If current offset is not valid, try generate new offset
            if (!IsOffsetValid())
            {
                GenerateNewOffset();
            }

            FVector CurrentPreferredLocation = Combat.CharacterOfInterest.ActorLocation + Offset;
            if (CurrentPreferredLocation.Distance(Combat.Self.NavAgentLocation) < 30.0f)
            {
                WaitOneTick();
                continue;
            }

            // If offset still invalid, task fails
            if (!IsOffsetValid())
            {
                EndTaskAsFailure();
                return;
            }

            if (!AI.IsFollowingActor(Combat.CharacterOfInterest))
            {
                CancelTauntsIfNecessary();

                SetMovementSpeed(Combat.CharacterOfInterest, CurrentPreferredLocation);
                
                AI.FollowWithWorldOffset(Combat.CharacterOfInterest, CurrentPreferredLocation).While(n"IsOffsetValid");
            }

            if (Combat.Self.IsPathfollowing())
            {
                CancelTauntsIfNecessary();
            }
            
            WaitOneTick();
        }

        EndTaskAsSuccess();
        return;
    }

    UFUNCTION()
    void GenerateNewOffset()
    {
        FVector PreferredLocation = FVector::ZeroVector;

        if (!Combat.Positioning.GetLocationToMoveTo(PreferredLocation))
        {
            PreferredLocation = Combat.CharacterState.ActorLocation;
        }

        Offset = PreferredLocation - Combat.CharacterOfInterest.ActorLocation;
    }

    UFUNCTION()
    bool IsOffsetValid() const
    {
        if (!IsValid(Combat) || !IsValid(Combat.Positioning) || !IsValid(Combat.CharacterOfInterest))
            return false;

        FVector CurrentPreferredLocation = Combat.CharacterOfInterest.ActorLocation + Offset;

        float DistanceTargetToPreferredLocation = CurrentPreferredLocation.Distance(Combat.CharacterOfInterest.ActorLocation);
        float DistanceSelfToPreferredLocation = CurrentPreferredLocation.Distance(Combat.CharacterState.ActorLocation);
        float DistanceSelfToTarget = Combat.CharacterState.ActorLocation.Distance(Combat.CharacterOfInterest.ActorLocation);

        // Target, Self and PL form an equilateral triangle or PL is past the Target
        if (DistanceTargetToPreferredLocation <= DistanceSelfToPreferredLocation &&
            DistanceSelfToTarget <= DistanceSelfToPreferredLocation)
            return false;

        if (!Combat.Positioning.IsPositionValid(Combat.CharacterOfInterest.ActorLocation + Offset))
            return false;

        return true;
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_RelativePositioning::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Positioning == nullptr)
            return false;

        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "No character of interest.";
            return false;
        }

        if (Combat.CharacterOfInterest.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_WaitReceiveRiposte))
            return false;
        
        return true;
    }
}

UCLASS()
class UCM_UseItem : UCM_StopMoving
{
    default ActionTag = GameplayTag::Action_QuickConsume;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;
        
        if (Combat.SelectedItem == nullptr)
            return;
    }
}

UCLASS()
class UCM_UseSelectedConsumableItem : UCM_UseItem
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ConsumeItem);

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ArcheryQuickShot);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ArcheryAimedShot);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ArcheryDraw);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (Combat.Self.IsAiming())
        {
            AI.LeaveAimingStance();
        }
        
        if (AI.UseItem(Combat.SelectedItem.Class).WasSuccessful())
        {
            AI.UpdateItemActionUsageTime(AI.SelectedItemAction.ActionTag);
        }

        if (IsValid(AI.ItemActionScoringEntryManager))
        {
            AI.ItemActionScoringEntryManager.UpdateAvailableItems();
        }
        AI.WaitUntilNoLongerBlocked();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_UseSelectedConsumableItem::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.SelectedItemAction.ActionTag.MatchesTag(GameplayTag::Action_QuickConsume))
        {
            Reason = "Selected item action tag doesn't match Action_QuickConsume";
            return false;
        }

        return true;
    }
}

//////////////////////////////////////////////////////////////
//     TO DO
//////////////////////////////////////////////////////////////

/** Enter Block stance to block enemy attacks */
UCLASS()
class UCM_EnterBlockStance : UCM_StopMoving
{
    
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        Combat.TimeSecondsToggledBlockStance = Combat.World.TimeSeconds;
        EndTaskWithResult(AI.EnterBlockingStance().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_EnterBlockStance::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.Self.CanDoBlockWithCurrentlyDrawnWeapon())
        {
            Reason = "Agent can't block with current weapon";
            return false;
        }

        return true;
    }
}

/** Enter Block stance to block enemy attacks */
UCLASS()
class UCM_TimedParry : UCM_EnterBlockStance
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!Combat.HasIncomingAttack(0.33f))
        {
            WaitOneTick();
        }

        Super::DoTask();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_TimedParry::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.HasIncomingAttack())
        {
            Reason = "No incoming attack";
            return false;
        }

        if (!Combat.Self.CanDoBlockWithCurrentlyDrawnWeapon())
        {
            Reason = "Agent can't block with current weapon";
            return false;
        }

        return true;
    }
}

/** Exit Block stance */
UCLASS()
class UCM_ExitBlockStance : UAITask_CombatMove
{
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::State_Block);
    
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Combat.TimeSecondsToggledBlockStance = Combat.World.TimeSeconds;
        EndTaskWithResult(AI.LeaveBlockingStance().Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_ExitBlockStance::IsMoveAllowed"));
        
        if (!UAITask_CombatMove::IsMoveAllowed(Reason))
            return false;

        if (!Combat.Self.IsInBlockingStance())
        {
            Reason = "Not in blocking stance";
            return false;
        }

        return true;
    }
}

/** Do a riposte attack */
UCLASS()
class UCM_Riposte : UCM_Attack
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        EndTaskWithResult(AI.ParryAndRiposte(Combat.CharacterOfInterest).Result);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_Riposte::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.CharacterOfInterest.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_WaitReceiveRiposte))
        {
            Reason = "Target is not in State_WaitingReceiveRiposte";            
            return false;
        }

        return true;
    }
}

/** Follow combat leader, stay in formation */
UCLASS()
class UCM_StayInFormation : UCM_AttackCombo
{
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void DoTask()
    {
        AI.StartFollowingActor(Combat.CombatGroup.GetFightLeader());

        WaitSeconds(0.2f);
    }

    void OnMoveEnded() override
    {
        AI.StopFollowingActor();

        Super::OnMoveEnded();
    }
}

//////////////////////////////////////////////////
//  BOW / CROSSBOW
//////////////////////////////////////////////////

UCLASS(Abstract)
class UCM_UseArchery : UCM_Attack
{
    default MoveTypes.AddTag(GameplayTag::Action_Attack);
    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack);

    default ActionTag = GameplayTag::Ability_Combat_Archery;

    default bShouldStopMoving = true;
    default bRequiresNonDefeatedTarget = false;

    UFUNCTION(BlueprintCallable)
    bool IsTargetStillAvailable()
    {
        if (Combat.CharacterOfInterest == nullptr)
            return false;
        
        if (Combat.CharacterOfInterest.IsDefeated())
            return false;
    
        if (Combat.CharacterOfInterest.IsDead())
            return false;

        return true;
    }

    bool WouldAttackCollideWithWall() const override
    {
        if (!IsValid(Combat.CharacterOfInterest))
            return false;
        
        if (!Combat.Self.Perception.CanSee(Combat.CharacterOfInterest))
            return true;

        return false;
    }

    bool WouldAttackHitFriendly() const override
    {
        return false;
    }
}

UCLASS(Abstract)
class UCM_UseBow : UCM_UseArchery
{
    default MoveTypes.AddTag(GameplayTag::Action_Attack);
    default bShouldStopMoving = true;

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_UseBow::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.AI.Character.HasDrawnBow())
        {
            Reason = "Bow not drawn";
            return false;
        }

        return true;
    }
}

UCLASS(Abstract)
class UCM_UseCrossbow : UCM_UseArchery
{
    default MoveTypes.AddTag(GameplayTag::Action_Attack);
    default bShouldStopMoving = true;

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_UseCrossbow::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.AI.Character.HasDrawnCrossbow())
        {
            Reason = "Crossbow not drawn";
            return false;
        }

        return true;
    }

    bool IsCrossbowLoaded() const
    {
        if (!Combat.AI.Character.HasDrawnCrossbow())
            return false;
        
        auto ArcheryWeapon = Cast<AArcheryWeaponVisual>(Combat.Self.CarryComponent.ItemVisual);
        if (!IsValid(ArcheryWeapon))
            return false;

        if (!ArcheryWeapon.HasArrowNotched())
            return false;

        return true;
    }

    bool WouldAttackCollideWithWall() const override
    {
        if (Super::WouldAttackCollideWithWall())
            return true;
        
        return !MagicScript::CalculateShootingArrowProjectileReachabilityFromCamera(
            Combat.AvatarCharacter, 
            Combat.CharacterOfInterest);
    }
}

class UCM_QuickShot : UCM_UseBow
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryQuickShot);

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ArcheryAim);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Aiming_Normal);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ArcheryAimedShot);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ArcheryDraw);

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_Dodge);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_BeingDraw);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_CastSpell);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_MeleeAttack);

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_QuickShot::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        AbilitySystem::SendGameplayEventToActor(Combat.Self, GameplayTag::End_Action_Aiming, FGameplayEventData());

        WaitOneTick();
        AI.ArcheryShootArrow();

        WaitOneTick();
        AI.EnterAimingStance();
    }
}

class UCM_AimedShots : UCM_UseBow
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryAimedShot);
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryAim);
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryDraw);

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_Dodge);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_BeingDraw);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_CastSpell);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_MeleeAttack);
    

    UCM_AimedShots(float MaxWaitSecondsWithoutVisibleTarget = 1.0f, float AimTime = 0.4f, int InMaxChainedShots = 1)
    {
        _MaxTimeSecondsAfterReady = MaxWaitSecondsWithoutVisibleTarget;
        _MaxChainedShots = InMaxChainedShots;
        _TimeSecondsToReady = AimTime;
    }

    UPROPERTY()
    private float _MaxTimeSecondsAfterReady = 1.0f;

    UFUNCTION()
    float GetMaxTimeSecondsAfterReady() const property
    {
        return Math::Max(_MaxTimeSecondsAfterReady, 0.5f);
    }

    UPROPERTY()
    private float _TimeSecondsToReady = 0.5f;

    UPROPERTY()
    private int _MaxChainedShots = 1;

    UPROPERTY()
    private bool bShotDone = false;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        for (int i = 0; i < _MaxChainedShots; i++)
        {
            if (!Combat.Self.IsAiming())
            {
                AI.EnterAimingStance();
            }

            AI.ArcheryPrepareAimedShot();

            AI.WaitSeconds(_TimeSecondsToReady);
            
            FInGameTime TimeReadyToShoot = FInGameTime::Now();

            while (TimeReadyToShoot.AgeInRealtimeSeconds < MaxTimeSecondsAfterReady)
            {
                if (!IsTargetStillAvailable())
                {
                    EndTaskAsSuccess();
                    return;
                }
                    
                if (WouldAttackCollideWithWall() || WouldAttackHitFriendly())
                {
                    WaitOneTick();
                    continue;
                }

                StopMoving();
                AI.ArcheryShootArrow();
                bShotDone = true;
                AI.WaitSeconds(0.5f); // Wait until shot is done
                break;
            }

            if (!bShotDone)
                break;
        }
    }

    void OnMoveEnded() override
    {
        Super::OnMoveEnded();
        
        // FGameplayEventData Payload;
        // GothicGAS::SendGameplayEvent(AI.CharacterState, GameplayTag::End_Action_Aiming, Payload);
    }
}

class UCM_CrossbowShot : UCM_UseCrossbow
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryAimedShot);
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryAim);
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_ArcheryDraw);

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_Dodge);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_BeingDraw);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_CastSpell);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::AICombatMove_MeleeAttack);    

    UCM_CrossbowShot(float InMaxTimeSecondsAfterReady)
    {
        MaxTimeSecondsAfterReady = InMaxTimeSecondsAfterReady;
    }

    UPROPERTY()
    float MaxTimeSecondsAfterReady = 2.0f;

    UPROPERTY()
    float AimingTime = 1.0f;

    UPROPERTY()
    float Timeout = 10.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (!IsCrossbowLoaded())
        {
            AI.ArcheryShootArrow();
        }

        bool bLoadedAndAimed = false;
        bool bReadyToShoot = false;

        FInGameTime TimeStarted = FInGameTime::Now();
        FInGameTime TimeLoadedAndAimed;
        FInGameTime TimeReadyToShoot;

        while (TimeStarted.AgeInRealtimeSeconds < Timeout)
        {
            if (!IsTargetStillAvailable())
            {
                EndTaskAsSuccess();
                return;
            }

            if (!IsCrossbowLoaded())
            {
                WaitOneTick();
                continue;
            }

            if (!Combat.Self.IsAiming())
            {
                AI.EnterAimingStance();
            }

            // Reached if crossbow is loaded and character is aiming
            if (!bLoadedAndAimed)
            {
                TimeLoadedAndAimed = FInGameTime::Now();
                bLoadedAndAimed = true;
            }

            if (!bReadyToShoot && TimeLoadedAndAimed.AgeInRealtimeSeconds > AimingTime)
            {
                TimeReadyToShoot = FInGameTime::Now();
                bReadyToShoot = true;
            }

            if (bReadyToShoot && TimeReadyToShoot.AgeInIngameSeconds > MaxTimeSecondsAfterReady)
            {
                EndTaskAsFailure();
                return;
            }
                
            if (TimeLoadedAndAimed.AgeInRealtimeSeconds <= AimingTime || WouldAttackCollideWithWall() || WouldAttackHitFriendly())
            {
                WaitOneTick();
                continue;
            }

            StopMoving();
            AI.ArcheryShootArrow();
            AI.WaitSeconds(0.66f);

            if (Combat.Self.IsAiming())
            {
                AI.LeaveAimingStance();
                AI.WaitSeconds(0.66f);
            }

            // Reload crosbow
            AI.ArcheryShootArrow();

            while (!IsCrossbowLoaded())
            {
                WaitOneTick();
                continue;
            }

            break;
        }

        EndTaskAsSuccess();
    }

    void OnMoveEnded() override
    {
        Super::OnMoveEnded();
        
        FGameplayEventData Payload;
        GothicGAS::SendGameplayEvent(AI.CharacterState, GameplayTag::End_Action_Aiming, Payload);
    }
}

//////////////////////////////////////////////////
//  MAGIC
//////////////////////////////////////////////////

UCLASS()
class UCM_CastSpell_Base : UCM_Attack
{
    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);
    default bShouldStopMoving = false;

    default bMaxRangeOverride = true;
    default MaxRange = 2000.0f;

    default bRequiresNonDefeatedTarget = false;

    bool bCanStartWhileMoving = true;

    FInGameTime TimeMarker;

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_CastSpell_Base::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!SpellTag.IsValid())
        {
            Reason = "Spell tag invalid";
            return false;
        }

        if (!Combat.Self.CarryComponent.ItemVisual.AllActionKeywords.Contains(SpellTag))
        {
            Reason = "Current item can't cast selected spell";
            return false;
        }

        if (WouldAttackCollideWithWall())
        {
            Reason = "Spell would collide with wall.";
            return false;
        }

        if (WouldAttackHitFriendly())
        {
            Reason = "Spell would hit friendlies.";
            return false;
        }

        return true;
    }

    bool WouldAttackCollideWithWall() const override
    {
        if (KeywordsContainer == nullptr)
            return false;

        if(KeywordsContainer.Keywords.HasTag(GameplayTag::AISpellKeywords_ProjectileSpeed))
        {
            return !MagicScript::CalculateShootingSpellProjectileReachabilityFromCamera(
                Combat.AvatarCharacter, 
                Combat.CharacterOfInterest, 
                GetSpellConfig().GetSpawnLocationSocketName());
        }
        else if(KeywordsContainer.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Cone))
        {
            return !MagicScript::CalculateAreaSpellReachabilityFromCamera(
                Combat.AvatarCharacter, 
                Combat.CharacterOfInterest, 
                GetSpellConfig());
        }

        return false;
    }

    bool WouldAttackHitFriendly() const override
    {
        return false;
    }

    protected FGameplayTag _SpellTag;
    FGameplayTag GetSpellTag() const property
    {
        if (_SpellTag.IsValid() || EquippedItemVisual == nullptr)
            return _SpellTag;

        for (auto ActionKeywords : EquippedItemVisual.AllActionKeywords)
        {
            if (!ActionKeywords.Key.MatchesTag(GameplayTag::Spell))
                continue;

            return ActionKeywords.Key;
        }

        return _SpellTag;
    }

    AItemVisual GetEquippedItemVisual() const property final
    {
        if (!IsValid(Combat))
            return nullptr;

        if (Combat.Self == nullptr)
            return nullptr;

        auto CarryComp = Combat.Self.GetCarryComponent();
        if(CarryComp == nullptr)
            return nullptr;

        return CarryComp.GetItemVisual();
    }

    USpellActionKeywords GetKeywordsContainer() const property final
    {
        if (EquippedItemVisual == nullptr)
            return nullptr;

        return Cast<USpellActionKeywords>(EquippedItemVisual.GetActionKeywords(SpellTag));        
    }

    USpellConfig GetSpellConfig() const property final
    {
        if (!IsValid(KeywordsContainer))
            return nullptr;

        auto SpellContainerConfig = KeywordsContainer.GetSpellConfigFromContainer();

        if (!IsValid(SpellContainerConfig))
            return nullptr;

        return SpellContainerConfig.SpellConfig;
    }

    float GetRange() const override property
    {
        if (!IsValid(KeywordsContainer))
            return Super::GetRange();

        if (!IsValid(SpellConfig))
            return Super::GetRange();

        if (GameplayTag::AISpellKeywords_Area_Circle_OnCaster.MatchesAny(KeywordsContainer.Keywords) ||
            GameplayTag::AISpellKeywords_Area_Cone.MatchesAny(KeywordsContainer.Keywords))
        {
            return Math::Min(Super::GetRange(), SpellConfig.SpellAreaRange);
        }

        return Super::GetRange();    
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;
        
        if (!ActivateAttackKeywordEffectForSpell())
        {
            EndTaskAsFailure();
            return;
        }

        CastSpell();

        while (Combat.CharacterState.HasGameplayTag(GameplayTag::State_DoingMagic))
        {
            WaitOneTick();
        }

        EndTaskAsSuccess();
    }

    UFUNCTION()
    void CastSpell()
    {

    }
    
    int GetSpellCastLevelBasedOnDistance()
    {
        if (SpellConfig == nullptr) 
            return 1;
        
        float RangeStep = (MaxRange - MinRange) / float(SpellConfig.SpellLevels);

        int SpellLevel = 1;
        for (float CurrentRange = MinRange; CurrentRange <= MaxRange - RangeStep; CurrentRange += RangeStep)
        {
            float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
            if ((CurrentRange <= DistanceToEnemy) && (DistanceToEnemy <= CurrentRange + RangeStep))
                break;

            SpellLevel++;
        }

        return SpellLevel;
    }

    bool ActivateAttackKeywordEffectForSpell()
    {
        if (!SpellTag.IsValid())
            return false;

        if (KeywordsContainer == nullptr)
            return false;

        auto ItemVisual = EquippedItemVisual;
        if (ItemVisual == nullptr)
            return false;

        ItemVisual.ActivateAttackKeywordEffect(SpellTag);
        return true;
    }

    void CastSpellChargedBasedOnDistance()
    {        
        AI.CastSpell(GetSpellCastLevelBasedOnDistance()).While(n"ConditionsToContinueSpell");
    }

    UFUNCTION()
    void OnShouldStopSpell() const
    {
        OnShouldStopAttack();
    }

    void CastSpellAmount(int Amount)
    {
        CastSpellAmount(Amount, Amount);
    }

    void CastSpellAmount(int InMinAmount, int InMaxAmount)
    {
        int MinAmount = InMinAmount;
        int MaxAmount = InMaxAmount;

        int Amount = MinAmount;

        if (Combat.Self.HasDrawnScroll())
        {
            MaxAmount = Math::Min(MaxAmount, Combat.Self.Inventory.CountItemsOfType(Combat.Self.CarryComponent.EquippedItemDefinition.ItemType));
        }

        if (MinAmount != MaxAmount)
        {
            Amount = Math::RandRange(MinAmount, MaxAmount);
        }

        AI.CastSpell(Amount).While(n"ConditionsToContinueSpell");
    }

    void StartCastingSustainedSpell(float MinSeconds, float MaxSeconds)
    {
        float Seconds = MinSeconds;

        if (MinSeconds != MaxSeconds)
        {
            Seconds = Math::RandRange(MinSeconds, MaxSeconds);
        }

        StartCastingSustainedSpell(Seconds);
    }

    void StartCastingSustainedSpell(float ForSeconds = -1.0f)
    {
        if (ForSeconds < 0.0f)
        {
            AI.CastSpell(-1).While(n"ConditionsToContinueSpell");
        }
        else if (ForSeconds > 0.0f)
        {
            AI.CastSpell(-1).TimeLimit(ForSeconds).While(n"ConditionsToContinueSpell");
        }
    }

    void CastSpellOnce()
    {
        AI.CastSpell(1).While(n"ConditionsToContinueSpell");
    }

    void OnMoveEnded() override
    {
        Super::OnMoveEnded();
        
        auto ItemVisual = EquippedItemVisual;
        if (ItemVisual == nullptr)
            return;

        ItemVisual.DeactivateAttackKeywordEffect();
    }

    UFUNCTION()
    bool ConditionsToContinueSpell() const
    {
        if (SpellTag.MatchesTag(GameplayTag::Spell_ChainLightning) && Combat.CharacterState.HasGameplayTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Caster))
        {
            // Cancel spell if targeting self and hp at less than 75%
            if (Combat.CharacterState.GetHealthAttribute() <= Combat.CharacterState.GetMaxHealthAttribute() * 0.75f)
                return false;
        }

        return true;
    }
}

UCLASS()
class UCM_CastSpell_Orc_Shaman : UCM_CastSpell_Base
{
    bool WouldAttackCollideWithWall() const override
    {
        return false;
    }

    bool WouldAttackHitFriendly() const override
    {
        return false;
    }
}

/** Cast spell */
UCLASS()
class UCM_CastSpell_Human_Base : UCM_CastSpell_Base
{
    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_CastSpell_Human_Base::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!bCanStartWhileMoving && Combat.Self.IsMoving())
        {
            Reason = "Currently moving";
            return false;
        }

        if (Combat.Self.IsDoingMagic())
        {
            Reason = "Already doing magic";
            return false;
        }

        return true;
    }
}

/** Cast spell */
UCLASS()
class UCM_CastSpell_GenericUniversal : UCM_CastSpell_Human_Base
{
    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);
    default DisallowMoveTags.AddTag(GameplayTag::Combat_Disallow_Attack);

    default bMaxRangeOverride = true;

    default MaxRange = 3000.0f;
    default MinRange = 200.0f;

    UPROPERTY()
    int MinAmount = 2;

    UPROPERTY()
    int MaxAmount = 4;

    UPROPERTY()
    float MinSeconds = 6.5f;

    UPROPERTY()
    float MaxSeconds = 8.5f;

    void CastSpell() override
    {
        // Cast multiple if spell is combo
        if (Combat.SelectedSpellActionHasTag(GameplayTag::AISpellKeywords_Casting_Combo))
        {
            CastSpellAmount(MinAmount, MaxAmount);
            return;
        } 

        // Cast levels if spell is charged
        if (Combat.SelectedSpellActionHasTag(GameplayTag::AISpellKeywords_Casting_Charged))
        {
            CastSpellChargedBasedOnDistance();
            return;
        }

        // Cast for duration if spell is sustained
        if (Combat.SelectedSpellActionHasTag(GameplayTag::AISpellKeywords_Casting_Sustained))
        {
            StartCastingSustainedSpell(MinSeconds, MaxSeconds);
            return;
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false; //test until find what block the spell while moving ///Alejandro

        if (!Combat.IsSpellSelected())
        {
            Reason = "Selected action is not a spell or no action is selected";
            return false;
        }

        if (!Combat.Self.HasDrawnMagicSpellWithTag(Combat.SelectedItem.ItemType))
        {
            Reason = "Selected spell is not drawn";
            return false;
        }

        if (Combat.SelectedSpellActionHasTag(GameplayTag::AISpellKeywords_Casting_Combo) &&
            Combat.Self.HasDrawnScroll() && Combat.Self.Inventory.CountItemsOfType(Combat.Self.CarryComponent.EquippedItemDefinition.ItemType) < MinAmount)
        {
            Reason = "Item is scroll and too few to cast multiple";
            return false;
        }

        if (!IsInSelectedSpellRangeAndDirection())
        {
            Reason = "Target not in range or agent not facing correct direction for spell";
            return false;
        } 

        return true;
    }

    bool IsInSelectedSpellRangeAndDirection() const
    {
        if (!IsFacingCorrectDirectionForSpell())
            return false;
        
        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        if (DistanceToEnemy < 0.0f)
            return false;
        
        if (!Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area) &&
            DistanceToEnemy >= MinRange && DistanceToEnemy <= MaxRange)
            return true;

        if (DistanceToEnemy > Combat.SelectedSpellAction.SpellConfigFromContainer.SpellConfig.SpellAreaRange)
            return false;

        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnTarget))
            return true;

        if (!Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Cone))
            return true;

        return true;
    }

    bool IsFacingCorrectDirectionForSpell() const
    {
        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnTarget))
            return true;

        if (Combat.IsFacingEnemy())
            return true;

        return false;
    }
}

UCLASS()
class UCM_CastSpellOnce : UCM_CastSpell_Human_Base
{
    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);
    
    void CastSpell() override
    {
        CastSpellOnce();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_CastSpellOnce::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        return true;
    }
}

/** Cast spell */
UCLASS()
class UCM_CastSpellMultiple : UCM_CastSpell_Human_Base
{
    UCM_CastSpellMultiple(int InAmount)
    {
        MinAmount = Math::Clamp(InAmount, 0, MAX_int32);
        MaxAmount = MinAmount;
    }

    UCM_CastSpellMultiple(int InMinAmount, int InMaxAmount)
    {
        MinAmount = Math::Clamp(InMinAmount, 0, MAX_int32);
        MaxAmount = Math::Clamp(InMaxAmount, MinAmount, MAX_int32);
    }

    UPROPERTY()
    int MinAmount = 1;

    UPROPERTY()
    int MaxAmount = 1;

    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);
    
    void CastSpell() override
    {
        CastSpellAmount(MinAmount, MaxAmount);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_CastSpellMultiple::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.HasDrawnScroll() && Combat.Self.Inventory.CountItemsOfType(Combat.Self.CarryComponent.EquippedItemDefinition.ItemType) < MinAmount)
        {
            Reason = "Item is scroll and too few to cast multiple";
            return false;
        }

        return true;
    }
}

/** Cast spell */
UCLASS()
class UCM_CastSpellTwice : UCM_CastSpellMultiple
{
    default MinAmount = 2;
    default MaxAmount = 2;
}

/** Cast spell */
UCLASS()
class UCM_CastSpellThrice : UCM_CastSpellMultiple
{
    default MinAmount = 3;
    default MaxAmount = 3;
}

/** Cast spell indefinitely */
UCLASS()
class UCM_StartCastingSpell : UCM_CastSpell_Human_Base
{
    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);

    void CastSpell() override
    {
        StartCastingSustainedSpell();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_StartCastingSpell::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        return true;
    }
}

/** Cast spell indefinitely */
UCLASS()
class UCM_StopCastingSpell : UAITask_CombatMove
{
    void OnMoveEnded() override
    {
        Super::OnMoveEnded();
        
        if (TaskResult == EGenericTaskResult::Success)
        {
            AI.UpdateItemActionUsageTime(AI.SelectedItemAction.ActionTag);
        }
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_StopCastingSpell::IsMoveAllowed"));
        
        if (!UAITask_CombatMove::IsMoveAllowed(Reason))
            return false;

        if (!Combat.Self.IsCastingSpell())
        {
            Reason = "Not casting any spell";
            return false;
        }

        return true;
    }
}

/** Cast spell for n seconds */
UCLASS()
class UCM_CastSpellForSeconds : UCM_CastSpell_Human_Base
{
    UCM_CastSpellForSeconds(float InSeconds)
    {
        MinSeconds = Math::Clamp(InSeconds, 0.0f, MAX_flt);
        MaxSeconds = MinSeconds;
    }

    UCM_CastSpellForSeconds(float InMinSeconds, float InMaxSeconds)
    {
        MinSeconds = Math::Clamp(InMinSeconds, 0.0f, MAX_flt);
        MaxSeconds = Math::Clamp(InMaxSeconds, MinSeconds, MAX_flt);
    }

    UPROPERTY()
    float MinSeconds = 10.0f;

    UPROPERTY()
    float MaxSeconds = 10.0f;

    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);

    void CastSpell() override
    {
        StartCastingSustainedSpell(MinSeconds, MaxSeconds);
    }

    void OnMoveEnded() override
    {
        Super::OnMoveEnded();
        
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_CastSpellForSeconds::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        return true;
    }
}

/** Cast spell */
UCLASS()
class UCM_CastSpellChargedBasedOnDistance : UCM_CastSpell_Human_Base
{
    UCM_CastSpellChargedBasedOnDistance(float InMinRange, float InMaxRange)
    {
        MaxRange = InMaxRange;
        MinRange = InMinRange;
    }

    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);

    default MaxRange = 1000.0f;
    default MinRange = 200.0f;
    
    void CastSpell() override
    {
        CastSpellChargedBasedOnDistance();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_CastSpellChargedBasedOnDistance::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.CarryComponent.ItemVisual == nullptr)
        {
            Reason = "Itemvisual is nullptr";
            return false;
        }
        
        if (!Combat.Self.CarryComponent.ItemVisual.AllActionKeywords[SpellTag].Keywords.HasTag(GameplayTag::AISpellKeywords_Casting_Charged))
        {
            Reason = "Spell doesn't have Charged spellkeyword";
            return false;
        }

        return true;
    }
}

/** Test Go To waypoint A or B toggle on exec */
UCLASS()
class UCM_Test_GoToWaypointAorBToggle : UCM_Movement
{
    FName WaypointNameA = n"Waypoint_A";
    FName WaypointNameB = n"Waypoint_B";

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        if (Combat.CurrentTestWaypoint == WaypointNameA)
        {
            Combat.CurrentTestWaypoint = WaypointNameB;
        }
        else
        {
            Combat.CurrentTestWaypoint = WaypointNameA;
        }

        Combat.SetWalkSpeed(Combat.BaseSpeed);

        CancelTauntsIfNecessary();
        Combat.AI.StartGoingToWaypoint(Combat.CurrentTestWaypoint);
        WaitSeconds(1.0f);
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCM_Test_GoToWaypointAorBToggle::IsMoveAllowed"));
        
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.AI.GetActiveTasksOfClass(UAbilityTask_GotoWaypoint::StaticClass()).Num() > 0)
        {
            Reason = "Already runnign GoToWaypoint task";
            return false;
        }

        return true;
    }
}