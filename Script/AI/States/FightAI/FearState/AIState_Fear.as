UCLASS()
class UAIState_Fear : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default AIStateTag = GameplayTag::AIState_Conflict_Fear;
    default SwitchAIStateMode = ESwitchAIStateMode::EndState_Cancel;
    default AssessmentModuleClass = UAIARM_State_EndFlee;
    default FocusPriority = EGothicFocusPriority::Fear;
    default bTargetCharacterOfInterest = false;
    
    default IsTickingTask = true;
    default bSupportsSimulatedSteps = true;

    UPROPERTY()
    private bool bIsFearOver;
    default bIsFearOver = false;

    UPROPERTY()
    float FearFleeRange;
    default FearFleeRange = 1000.0f;

    UPROPERTY()
    bool bFleeWhenClose;
    default bFleeWhenClose = true;

    UPROPERTY()
    float FearTooCloseRange;
    default FearTooCloseRange = 300.0f;

    UPROPERTY()
    bool bFaceTheEnemy;
    default bFaceTheEnemy = false;

    UPROPERTY()
    bool bHide;
    default bHide = true;

    UPROPERTY()
    EWalkSpeed FleeSpeed;
    default FleeSpeed = EWalkSpeed::Sprinting;

    UPROPERTY()
    bool bMoveIntoDirection;
    default bMoveIntoDirection = false;

    UPROPERTY()
    bool bShouldMoveToNewPosition;
    default bShouldMoveToNewPosition = false;

    UPROPERTY()
    FVector NewPositionToMoveTo;
    default NewPositionToMoveTo = FVector::ZeroVector;

    UPROPERTY()
    FVector DirectionToMoveInto;
    default DirectionToMoveInto = FVector::ZeroVector;

    UPROPERTY()
    bool bShouldStayInFearState;
    default bShouldStayInFearState = true;

    UPROPERTY()
    FGameplayTag FleeVoicelineTag;

    TArray<AGothicCharacter> CachedSensedLivingEnemies;

    float StuckTimeoutSeconds = 3.0f;
    float StuckStartTime = -1.0f;

    UPROPERTY()
    bool bReceivedHitWhileFleeing;
    default bReceivedHitWhileFleeing = false;

    FInteractionSpotHandle FleeTargetSpot;
    FInteractionSpotHandle StoredFleeTargetSpot;
    UPROPERTY()
    bool bUseFreepointForFlee;
    default bUseFreepointForFlee = false;

    FGameplayTagContainer AllowedSpotActionTags;
    default AllowedSpotActionTags.AddTag(GameplayTag::Action_Ambient);
    float FleeSpotSearchRadius = 5000.0f;
    float MinFleeSpotDistance = 2000.0f;
    float MinFleeSpotScore = 0.5f;
    int FleeSpotRandomTopCount = 5;
    float SpotReachDistance = 300.0f;
    int FleeCheckSpotLimit = 10;


    int LastSensedEnemyCount = 0;
    bool bNewEnemySensedWhileFleeing = false;

    /** When > 0, cancel current flee move after this many meters so the next tick recalculates direction (reuses ShouldContinueFleeMove). 0 = no distance-based recalc. */
    UPROPERTY()
    float FleeRecalcAfterMeters = 0.0f;
    FVector FleeMoveStartLocation = FVector::ZeroVector;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (!IsValid(this))
            return;

        DoGetJumpscaredInteraction();
        DoBeforeFear();

        while(bShouldStayInFearState)
        {
            FearAndFlee();
            WaitOneTick();
        }

        if (AI.HasPreferredLocation())
            AI.GotoPreferredLocation();

        bIsFearOver = true;

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);

        while (!bShouldExitState)
        {
            WaitOneTick();
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        Perception.SpellEffectEndedOnSelf_Fear().PerceptionGained.BindUFunction(this, n"Perception_OnFearEnded");
        Perception.HitOnSelf().PerceptionGained.BindUFunction(this, n"OnHitWhileFleeing");
    }

    UFUNCTION()
    private void OnHitWhileFleeing(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        bReceivedHitWhileFleeing = true;
    }

    UFUNCTION(BlueprintOverride)
    void HandleAvatarChanged()
    {
        if (IsInDailyRoutineSimulation())
        {
            if (FleeTargetSpot.IsValid() || bUseFreepointForFlee)
            {
                StoredFleeTargetSpot = FleeTargetSpot;
                FleeTargetSpot.Invalidate();
                bUseFreepointForFlee = false;
                RestartState();
            }
        }
    }

    UFUNCTION()
    private void Perception_OnFearEnded(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        bIsFearOver = true;

        AI.AssessEvent(GameplayTag::AIEvent_SpellEffect_Fear_Ended_OnSelf, Perception);
    }

    UFUNCTION()
    void OnMovementStart()
    {
        
    }

    UFUNCTION()
    void FearAndFlee()
    {
        if (!IsValid(AI) || !IsValid(AI.AIController))
            return;
        
        AI.AIController.ClearFocus();

        SelectFearCharacterOfInterest();

        if (bHide && FearInteractionCondition() && !ShouldCalculateNewPosition())
        {
            AI.FearHere().While(n"FearInteractionCondition");
        }

        if (!bShouldStayInFearState)
            return;

        if (!bShouldMoveToNewPosition)
            return;

        if (bNewEnemySensedWhileFleeing)
        {
            ResetFlags();
            return;
        }

        if (bMoveIntoDirection && DirectionToMoveInto != FVector::ZeroVector)
        {
            OnMovementStart();
            SetWalkSpeed(FleeSpeed);
            FleeMoveStartLocation = Self.GetFeetLocation();

            FGenericVoicelineRequestContext VoicelineContext;
            if (Context.HasTag(GameplayTag::VoicelineContext_MagicFear))
            {
                VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_MagicFear);
            }

            if (FleeVoicelineTag.IsValid() && IsValid(Self) && IsValid(Self.CharacterState.Voiceline) && Self.CharacterState.Voiceline.HasVoicelineForWithContext(FleeVoicelineTag, nullptr, VoicelineContext))
            {
                AI.CharacterState.Voiceline.SayVoicelineWithContext(FleeVoicelineTag, nullptr, VoicelineContext, EPerceptionNoiseLoudness::Loud);
            }
            else
            {
                AI.GoIntoDirection(DirectionToMoveInto, FearFleeRange).While(n"ShouldContinueFleeMove");
            }

            ResetFlags();
            return;
        }

        if (bUseFreepointForFlee && FleeTargetSpot.IsValid())
        {
            OnMovementStart();
            SetWalkSpeed(FleeSpeed);
            FleeMoveStartLocation = Self.GetFeetLocation();
            AI.GotoFreepoint(FleeTargetSpot, ReachDistance = SpotReachDistance).While(n"ShouldContinueFleeMove");
            ResetFlags();
            return;
        }

        OnMovementStart();
        SetWalkSpeed(FleeSpeed);
        FleeMoveStartLocation = Self.GetFeetLocation();
        AI.GotoPosition(NewPositionToMoveTo).While(n"ShouldContinueFleeMove");
        ResetFlags();
    }

    UFUNCTION()
    bool ShouldContinueFleeMove() const
    {
        if (bNewEnemySensedWhileFleeing)
            return false;
        if (FleeRecalcAfterMeters > 0.0f && IsValid(Self))
        {
            float DistMoved = Self.GetFeetLocation().Distance(FleeMoveStartLocation);
            if (DistMoved >= FleeRecalcAfterMeters)
                return false;
        }
        return true;
    }

    bool IsDirectionTowardAnyThreat(FVector Dir, FVector FromLocation) const
    {
        for (auto Enemy : CachedSensedLivingEnemies)
        {
            if (!IsValid(Enemy))
                continue;
            FVector ToEnemy = (Enemy.GetFeetLocation() - FromLocation).GetSafeNormal2D();
            if (Dir.DotProduct(ToEnemy) > 0.1f)
                return true;
        }
        return false;
    }

    UFUNCTION()
    bool FearInteractionCondition() const
    {
        if (IsFearStateOver())
            return false;

        if (!bShouldStayInFearState)
            return false;

        if (!bFleeWhenClose)
            return true;

        if (!IsValid(CharacterOfInterest))
            return false;

        if (CharacterOfInterest.GetDistanceTo(Self) > FearTooCloseRange)
            return true;

        if (bShouldMoveToNewPosition)
            return false;

        return true;
    }

    UFUNCTION()
    void DoBeforeFear()
    {

    }

    UFUNCTION()
    void DoGetJumpscaredInteraction()
    {
        if (!AI.CanGetJumpscaredHere())
            return;

        if (!IsValid(Self))
            return;

        if (Context.HasTag(GameplayTag::Action_Ambient_GetJumpscared) && !Self.IsSitting())
        {
            WaitForLastTaskToEnd(   AI.Say(GameplayTag::Sound_Voice_Reaction_Flee, EPerceptionNoiseLoudness::Loud, CharacterOfInterest),
                                    AI.GetJumpscaredHere());
        }
    }

    UFUNCTION()
    bool ShouldCalculateNewPosition() const
    {
        if (!bFleeWhenClose)
            return false;
        
        if (bShouldMoveToNewPosition)
            return false;

        if (!IsValid(Self))
            return false;

        if (!IsValid(CharacterOfInterest))
            return false;

        if (CharacterOfInterest.GetDistanceTo(Self) > FearTooCloseRange)
            return false;

        return true;
    }

    void SelectFearCharacterOfInterest()
    {
        AGothicCharacter Target = nullptr;
        
        float ClosestDistance = MAX_flt;
        AGothicCharacter ClosestValidCharacter = nullptr;

        for (auto OtherCharacter : CachedSensedLivingEnemies)
        {
            if (!IsValid(OtherCharacter))
                continue;
            float Distance = OtherCharacter.GetDistanceTo(Self);
            if (Distance >= ClosestDistance)
                continue;

            ClosestValidCharacter = OtherCharacter;
            ClosestDistance = Distance;
        }

        Target = ClosestValidCharacter;

        CharacterOfInterest = Target;
    }

    FVector CalculateFleeDirection() const
    {
        if (!IsValid(CharacterOfInterest))
            return FVector::ZeroVector;
        return (Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation()).GetSafeNormal2D();
    }

    void UpdateCaches()
    {
    }

    TArray<AGothicCharacter> GetCharactersToFleeFrom()
    {
        return AI.GetSensedLivingEnemies();
    }

    // Fan of angles (degrees) from ideal away-direction; covers full rear hemisphere so pockets have a navigable exit.
    TArray<float> FleeDirectionAngleOffsetsDegrees;
    default FleeDirectionAngleOffsetsDegrees.Add(0.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(30.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(-30.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(60.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(-60.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(90.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(-90.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(120.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(-120.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(150.0f);
    default FleeDirectionAngleOffsetsDegrees.Add(-150.0f);

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        if (StoredFleeTargetSpot.IsValid())
        {
            FleeTargetSpot = StoredFleeTargetSpot;
            bUseFreepointForFlee = true;
            bShouldMoveToNewPosition = true;
            StoredFleeTargetSpot.Invalidate();
            return;
        }

        if (!IsValid(Self))
            return;

        CachedSensedLivingEnemies = GetCharactersToFleeFrom();
        if (CachedSensedLivingEnemies.Num() > LastSensedEnemyCount)
        {
            bNewEnemySensedWhileFleeing = true;
            AI.AIController.StopMovement();
        }
        LastSensedEnemyCount = CachedSensedLivingEnemies.Num();

        UpdateCaches();
        bShouldStayInFearState = ShouldStayInFearState();

        bool bForceRecalc = bReceivedHitWhileFleeing || bNewEnemySensedWhileFleeing;
        if (bReceivedHitWhileFleeing)
            bReceivedHitWhileFleeing = false;
        if (bNewEnemySensedWhileFleeing)
            bNewEnemySensedWhileFleeing = false;

        if (!ShouldCalculateNewPosition() && !bForceRecalc)
        {
            StuckStartTime = -1.0f;
            return;
        }

        FVector ScaryCharacterToSelf = CalculateFleeDirection();
        if (ScaryCharacterToSelf == FVector::ZeroVector)
        {
            StuckStartTime = -1.0f;
            return;
        }

        const UTerritoryConfig CurrentTerritory = AI.GetCurrentTerritory();
        if (CurrentTerritory != nullptr)
        {
            TArray<FInteractionSpotHandle> CandidateSpots;
            TArray<float> CandidateScores;

            TArray<FInteractionSpotHandle> Spots = InteractionSpots::FindSpotsInRadius(Self.GetFeetLocation(), FleeSpotSearchRadius);
            FVector SelfFeet = Self.GetFeetLocation();
            for (int i = 0; i < Spots.Num(); i++)
            {
                FInteractionSpotHandle Spot = Spots[i];
                if (!Spot.IsValid() || !Spot.IsAnyOfActionsPossibleHere(AllowedSpotActionTags))
                    continue;
                float DistToSpot = SelfFeet.Distance(Spot.Location);
                if (DistToSpot < MinFleeSpotDistance)
                    continue;
                FVector SpotDir = (Spot.Location - SelfFeet).GetSafeNormal2D();
                if (IsDirectionTowardAnyThreat(SpotDir, SelfFeet))
                    continue;
                float Dot = SpotDir.DotProduct(ScaryCharacterToSelf);
                float Score = (Dot + 1.0f) * 0.5f;
                if (Score < MinFleeSpotScore || !AI.CanGotoFreepoint(Spot, SpotReachDistance))
                    continue;
                CandidateSpots.Add(Spot);
                CandidateScores.Add(Score);
            }

            int TopCount = Math::Min(FleeSpotRandomTopCount, CandidateSpots.Num());
            for (int k = 0; k < TopCount; k++)
            {
                int BestIdx = k;
                for (int j = k + 1; j < CandidateSpots.Num(); j++)
                    if (CandidateScores[j] > CandidateScores[BestIdx])
                        BestIdx = j;
                if (BestIdx != k)
                {
                    CandidateSpots.Swap(k, BestIdx);
                    CandidateScores.Swap(k, BestIdx);
                }
            }
            if (TopCount >= 1)
            {
                int Idx = Math::RandRange(0, TopCount - 1);
                FleeTargetSpot = CandidateSpots[Idx];
                bUseFreepointForFlee = true;
                bShouldMoveToNewPosition = true;
                bMoveIntoDirection = false;
                StuckStartTime = -1.0f;
                return;
            }
        }

        FVector ChosenDirection = FVector::ZeroVector;
        FVector ChosenEndPosition = FVector::ZeroVector;
        bool bUseMoveIntoDirection = false;
        bool bFoundMove = false;

        for (int i = 0; i < FleeDirectionAngleOffsetsDegrees.Num(); i++)
        {
            float AngleDeg = FleeDirectionAngleOffsetsDegrees[i];
            FVector Dir = AngleDeg != 0.0f
                ? ScaryCharacterToSelf.RotateAngleAxis(AngleDeg, FVector(0.0f, 0.0f, 1.0f))
                : ScaryCharacterToSelf;
            if (!Dir.IsNearlyZero())
                Dir.Normalize();
            if (IsDirectionTowardAnyThreat(Dir, Self.GetFeetLocation()))
                continue;

            FVector BestPosition = Self.GetNavAgentLocation() + Dir * FearFleeRange;
            FVector EndPosition = BestPosition;

            if (TryGetPositionToMoveTo(Self, EndPosition, BestPosition))
            {
                if (AI.CanGotoPosition(EndPosition))
                {
                    ChosenDirection = Dir;
                    ChosenEndPosition = EndPosition;
                    bUseMoveIntoDirection = false;
                    bFoundMove = true;
                    break;
                }
            }

            if (CanMoveIntoDirection(Dir))
            {
                ChosenDirection = Dir;
                ChosenEndPosition = BestPosition;
                bUseMoveIntoDirection = true;
                bFoundMove = true;
                break;
            }
        }

        if (!bFoundMove)
        {
            if (StuckStartTime < 0.0f)
                StuckStartTime = World.TimeSeconds;
            else if (World.TimeSeconds - StuckStartTime >= StuckTimeoutSeconds && IsValid(CharacterOfInterest))
            {
                FRememberedPerception StuckPerception;
                StuckPerception.EventTag = GameplayTag::AIEvent_FleeStuck;
                StuckPerception.Instigator.Character = CharacterOfInterest;
                if (IsValid(CharacterOfInterest.CharacterState))
                    StuckPerception.Instigator.CharacterState = CharacterOfInterest.CharacterState;
                AI.AssessEvent(GameplayTag::AIEvent_FleeStuck, StuckPerception);
                StuckStartTime = -1.0f;
            }
            return;
        }

        StuckStartTime = -1.0f;

        bShouldMoveToNewPosition = true;
        bMoveIntoDirection = bUseMoveIntoDirection;
        NewPositionToMoveTo = ChosenEndPosition;
        DirectionToMoveInto = ChosenDirection;
    }

    void ResetFlags()
    {
        bMoveIntoDirection = false;
        bShouldMoveToNewPosition = false;
        NewPositionToMoveTo = FVector::ZeroVector;
        DirectionToMoveInto = FVector::ZeroVector;
        bUseFreepointForFlee = false;
        FleeTargetSpot.Invalidate();
    }

    UAbilityTask_InteractWith CreateFearInteractTask()
    {
        return TaskInteractHereWithoutSpot(AI, GameplayTag::Action_Ambient_Fear, -1.0f);
    }

    UFUNCTION(BlueprintCallable)
    bool IsFearStateOver() const
    {
        return bIsFearOver;
    }

    FString GetDisplayName() const override
    {
        return "Fear State";
    }

    bool ProjectPositionOntoNavmesh(AGothicCharacter Character, FVector Position, FVector& OutPosition) const
    {
        return UNavigationSystemV1::ProjectPoint(Character, Position, OutPosition);
    }

    bool GetClosestPositionOnNavmesh(AGothicCharacter Character, FVector Position, FVector& OutPosition) const
    {
        return UNavigationSystemV1::ProjectPoint(Character, Position, OutPosition);
    }

    bool TryGetPositionToMoveTo(AGothicCharacter Character, FVector& OutPosition, FVector BestPosition)
    {
        if (TryGetPositionToMoveToOnNavmesh(Character, OutPosition, BestPosition))
            return true;

        if (TryGetClosestPositionOnNavmesh(Character, OutPosition, BestPosition))
            return true;

        return false;
    }

    bool TryGetPositionToMoveToOnNavmesh(AGothicCharacter Character, FVector& OutPosition, FVector BestPosition)
    {
        if (ProjectPositionOntoNavmesh(Character, BestPosition, OutPosition) && IsPositionValid(OutPosition))
        {
            // DebugScript::DrawLine(OutPosition, OutPosition + FVector::UpVector * 150.0f, FColor::Purple, 5.0f, 2.0f);
            return true;
        }

        return false;
    }

    bool TryGetClosestPositionOnNavmesh(AGothicCharacter Character, FVector& OutPosition, FVector BestPosition)
    {
        if (GetClosestPositionOnNavmesh(Character, BestPosition, OutPosition) && IsPositionValid(OutPosition))
        {
            // DebugScript::DrawLine(OutPosition, OutPosition + FVector::UpVector * 150.0f, FColor::Purple, 5.0f, 2.0f);
            return true;
        }

        return false;
    }

    float FleeMinimumMoveDistance = 150.0f;

    bool CanMoveIntoDirection(FVector Direction)
    {
        if (!IsValid(Self))
            return false;
        return AI.CanMoveIntoDirection(Direction, FearFleeRange, -1.0f, FleeMinimumMoveDistance);
    }

    bool IsPositionValid(FVector Position) const
    {
        return true;
    }

    bool ShouldStayInFearState() const
    {
        if (!IsValid(Self))
            return false;

        if (Self.IsAffectedByFear())
            return true;

        return false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Fear : UAbilityTask_InteractionSpot_Montage
{
    default bPossibleAnywhere = true;
    default bPutAwayItemInHandsBeforeInteraction = false;

    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Fear);

    default OtherInteractionEndBehaviorOnSwitch = EInteractionEndBehavior::Instant;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Weapon1HMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/FearReaction/A_Man_FearReaction_W1H_Montage.A_Man_FearReaction_W1H_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Weapon2HMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/FearReaction/A_Man_FearReaction_W2H_Montage.A_Man_FearReaction_W2H_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> WeaponFistMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/FearReaction/A_Man_FearReaction_Fist_Montage.A_Man_FearReaction_Fist_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> NoWeaponMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/FearReaction/A_Man_FearReaction_IdlePose_Montage.A_Man_FearReaction_IdlePose_Montage'";
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if (!IsValid(Self))
            return;
        
        if (!Self.HasDrawnWeapon())
        {
            MainMontage = NoWeaponMontage;
        }
        else if (Self.HasDrawnFists())
        {
            MainMontage = WeaponFistMontage;
        }
        else if (Self.HasDrawnWeapon1H() || Self.HasDrawnMagicSpell())
        {
            MainMontage = Weapon1HMontage;
        }
        else if (Self.HasDrawnWeapon2H())
        {
            MainMontage = Weapon2HMontage;
        }
    }
}