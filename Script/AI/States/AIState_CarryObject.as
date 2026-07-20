namespace Test
{
    class UDailyRoutine_Test_CarryObjectA : UAIState_DailyRoutine_Human
    {
        default Schedule(10, 0, UAIState_CarryOreBags(n"FP_TakeOreBag", n"FP_DSG_A"), NAME_None, 150.f);
    }
        class UDailyRoutine_Test_CarryObjectB : UAIState_DailyRoutine_Human
    {
        default Schedule(0, 0, UAIState_CarryBoxes(n"FP_DSG_A", n"FP_DSG_B"), NAME_None, 150.f);
    }
}

class UAIState_CarryObject : UGothicCharacterSimulateableAIState
{
    UAIState_CarryObject(FName InTakeObjectPosition, FName InLeaveObjectPosition, TSubclassOf<UItemDefinition> ItemClass, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = ItemClass;
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }
    
    UPROPERTY()
    TSubclassOf<UItemDefinition> Item;

    UPROPERTY()
    FInteractionSpotHandle TakingSpot;

    UPROPERTY()
    FInteractionSpotHandle LeavingSpot;

    FInteractionSpotHandle TargetSpot;
    FInteractionSpotClaimToken ClaimToken;

    UPROPERTY()
    UAbilityTask_GotoPosition MoveTask;

    UPROPERTY()
    FGameplayTag TakeObjectAction;
    
    UPROPERTY()
    FGameplayTag LeaveObjectAction;
    
    UPROPERTY()
    private FName RoutinePreferredLocation;

    UPROPERTY()
    float CollectRadius;

    UPROPERTY()
    float DeliveryRadius;

    protected bool bShouldHaveItemInHand = false;

    UFUNCTION(BlueprintOverride)
    bool PrefersGracefulExit() const
    {
        return CharacterState.AbilitySystemComponent.HasGameplayTag(GameplayTag::State_Carrying);
    }


    UFUNCTION(BlueprintOverride)
    void OnExternalCancel()
    {
        if(MoveTask != nullptr)
        {
            MoveTask.ExternalCancel();
        }

        if(!IsInDailyRoutineSimulation())
        {
            Self.MovementComponent.StopMovementImmediately();
        }
        
        

        FGameplayEventData Data;
        GothicGAS::SendGameplayEvent(Self, GameplayTag::End_Action_Carry, Data);
        bShouldHaveItemInHand = false;
    }

    /** Override to decide what should happen before taking the object (e.g. look around) */
    protected void DoBeforeTakingObject()
    {

    }

    /** Override to decide what should happen after leaving the object (e.g. resting) */
    protected void DoAfterLeftObject()
    {

    }

    /** Override to decide what should happen if taking the object failed. */
    protected void DoTakingObjectNoPossible()
    {
        AI.GotoFreepoint(TakingSpot);
        WaitSeconds(1.0f);
    }

    /** Override to decide what should when leaving the object failed. */
    protected void DoLeavingObjectNotPossible()
    {
        WaitSeconds(1.0f);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if(Self != nullptr)
        {
            bShouldHaveItemInHand = Self.GetGothicAbilitySystemComponent().HasTagExact(GameplayTag::State_Carrying);
        }

        while (!bShouldExitState)
        {
            if(!bShouldHaveItemInHand)
            {
                DoTakeObject();
            }
            else
            {
                DoLeaveObject();
            }
        }
    }

    private void DoTakeObject()
    {
        DoBeforeTakingObject();
        
        if (IsValid(Self) && AI.FindAndPickUpDroppedItem(Item, Self.ActorLocation, CollectRadius * 2).WasSuccessful())
        {
            bShouldHaveItemInHand = true;
            WaitOneTick();
            return;
        }
        
        TargetSpot = GetAvailableLeavingSpot();

        if (!TargetSpot.IsSet())
        {

            MoveTask = UAbilityTask_GotoPosition::TaskGotoPosition(AI, TakingSpot.Location,  TakingSpot.AreaRadius);
            if(!FAbilityTaskExecutor(MoveTask).WasSuccessful())
            {
                ReportTimeSkipWhateverIsLeft();
                if (IsInDailyRoutineSimulation())
                {
                    WaitSeconds(5.0f);
                }
                else
                {
                    WaitSeconds(1.0f);
                }
                return;
            }

            ReportTimeSkipWhateverIsLeft();
            
            if (IsInDailyRoutineSimulation())
            {
                WaitSeconds(5.0f);
            }
            else
            {
                WaitSeconds(1.0f);
            }
            return;
        }

        if (!IsInDailyRoutineSimulation())
        {  
            EGenericTaskResult Result = AI.FindAndPickUpDroppedItem(Item, Self.ActorLocation, CollectRadius).Result;
            
            if (Result != EGenericTaskResult::Success)
            {
                Result = AI.FindAndPickUpItem(Item, TakingSpot.Location, CollectRadius).Result;
            }
            
            if (Result == EGenericTaskResult::Cancelled)
            {
                bShouldHaveItemInHand = false;
                return;
            }
            else if (Result != EGenericTaskResult::Success)
            {
                DoTakingObjectNoPossible();
                ReportTimeSkipWhateverIsLeft();
                WaitOneTick();
                return;
            }
        }
        else
        {
            MoveTask = UAbilityTask_GotoPosition::TaskGotoPosition(AI, TakingSpot.Location, TakingSpot.AreaRadius);
            if(!FAbilityTaskExecutor(MoveTask).WasSuccessful() || !IsInDailyRoutineSimulation())
            {
                ReportTimeSkipWhateverIsLeft();

                if(IsInDailyRoutineSimulation())
                {
                    WaitSeconds(5.0f);
                }
                return;
            }
        }

        bShouldHaveItemInHand = true;
        WaitOneTick();
    }

    private void DoLeaveObject()
    {
        if (!IsInDailyRoutineSimulation() && !Self.GetGothicAbilitySystemComponent().HasTagExact(GameplayTag::State_Carrying) && !CharacterState.Inventory.CarryItemOfKind(Item))
        {
            ReportTimeSkipWhateverIsLeft();
            WaitSeconds(1.0f);
            return;
        }

        if (!TargetSpot.IsSet())
        {
            TargetSpot = GetAvailableLeavingSpot();
        }

        MoveTask = UAbilityTask_GotoPosition::TaskGotoPosition(AI, TargetSpot.Location,  TargetSpot.AreaRadius);

        if(!FAbilityTaskExecutor(MoveTask).WasSuccessful())
        {
        
            if (MoveTask != nullptr && MoveTask.TaskResult == EGenericTaskResult::Cancelled)
            {
                ReportTimeSkipWhateverIsLeft();
                WaitSeconds(1.0f);
                return;
            }

            MoveTask = UAbilityTask_GotoPosition::TaskGotoPosition(AI, LeavingSpot.Location,  LeavingSpot.AreaRadius);
            if (!FAbilityTaskExecutor(MoveTask).WasSuccessful())
            {
                ReportTimeSkipWhateverIsLeft();
                WaitOneTick();
                return;
            }
        }

        if (!IsInDailyRoutineSimulation())
        {
            EGenericTaskResult Result = AI.TryUseFreepointAt(GameplayTag::Action_Carry_PutDown, TargetSpot.SpotName).Result;

            if(Result == EGenericTaskResult::Cancelled)
            {
                bShouldHaveItemInHand = false;
                return;
            }
            else if(Result != EGenericTaskResult::Success)
            {
                ReportTimeSkipWhateverIsLeft();
                WaitOneTick();
                return;
            }
            else if (Result == EGenericTaskResult::Success)
            {
                DoAfterLeftObject();
            }
        }

        bShouldHaveItemInHand = false;
        TargetSpot.Unset();
        return;
    }

    UFUNCTION(BlueprintOverride)
    void HandleAvatarChanged()
    {
        if(AI.Character == nullptr || !bShouldHaveItemInHand)
            return;
        
        if (!CharacterState.Inventory.CarryItemOfKind(Item))
        {
            EndTaskAsFailure();
            return;
        }
    }

    private FInteractionSpotHandle GetAvailableLeavingSpot() const
    {
        return InteractionSpots::FindRandomReachableClaimableSpotInRadiusWithTag(CharacterState, LeavingSpot.Location, DeliveryRadius, GameplayTag::Action_Carry_PutDown);
    }

    UFUNCTION(BlueprintOverride)
    FBox EstimateMovementBoundingBox() const
    {
        FBox Bounds;

        if (TakingSpot.IsValid()) { Bounds += TakingSpot.Location; }
        if (LeavingSpot.IsValid()) { Bounds += LeavingSpot.Location; }
        
        return Bounds;
    }
}
