UCLASS()
class UAIState_AssessGoToDailyRoutine : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_AssessGoToDailyRoutine);
    default AIStateTag = GameplayTag::AIState_AssessGoToDailyRoutine;
    default AssessmentModuleClass = UAIARM_State_AssessGoToDailyRoutine;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

    UPROPERTY()
    private UAIValueSet_Conflict _ConflictValueSet;
    UAIValueSet_Conflict GetConflictValueSet() property
    {
        if (IsValid(_ConflictValueSet))
            return _ConflictValueSet;

        _ConflictValueSet = AI.SpawnedStorage(UAIValueSet_Conflict);
        return _ConflictValueSet;
    }


    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (Context.HasTag(GameplayTag::Action_Ambient_SearchAround))
        {
            AI.SearchAroundHere();
        }

        auto ScheduledRandomInteractionsState = Cast<UAIState_DailyRoutine_RandomInteractions>(AI.ScheduledDailyRoutineAIStateTemplate);
        bool bWantsToHaveTorchDrawn = 
            IsValid(ScheduledRandomInteractionsState) && 
            IsValid(ScheduledRandomInteractionsState.TryTakeOutItemIfPossible) &&
            ScheduledRandomInteractionsState.TryTakeOutItemIfPossible.DefaultObject.IsA(UItMw_1H_Torch);

        if (!Self.HasDrawnTorch() || !bWantsToHaveTorchDrawn)
        {
            AI.UndrawWeapon();
        }

        EquipDefaultWeapons();

        AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);

        if (Context.HasTag(GameplayTag::Action_Ambient_AngryDismiss))
        {
            AI.AngryDismissHere();
        }
        else if (Context.HasTag(GameplayTag::Action_Ambient_Dismiss))
        {
            AI.DismissHere();
        }

        AI.WaitSeconds(0.3f);

        DoActionsBeforeDailyRoutine();

        AssessEvents();        
        WaitSeconds(3.0f);
    }

    void EquipDefaultWeapons()
    {       
        UnequipWeapons();
        EquipDefaultMeleeWeapons();
        EquipDefaultRangedWeapons();        
    }

    void UnequipWeapons()
    {
        if ((!IsValid(ConflictValueSet.DefaultEquippedMeleeWeaponClass) && IsValid(CharacterState.Inventory.FirstEquippedMeleeWeapon)) ||
            (!IsValid(ConflictValueSet.DefaultEquippedRangedWeaponClass) && IsValid(CharacterState.Inventory.FirstEquippedRangedWeapon)))
        {
            AI.CharacterState.Inventory.UnequipWeapons();
        }
    }

    void EquipDefaultMeleeWeapons()
    {
        if (!IsValid(ConflictValueSet.DefaultEquippedMeleeWeaponClass))
            return;

        if (IsValid(CharacterState.Inventory.FirstEquippedMeleeWeapon) &&
            IsValid(ConflictValueSet.DefaultEquippedMeleeWeaponClass) &&
            CharacterState.Inventory.FirstEquippedMeleeWeapon.IsA(ConflictValueSet.DefaultEquippedMeleeWeaponClass))
            return;

        AI.CharacterState.Inventory.EquipMeleeWeaponOfClass(ConflictValueSet.DefaultEquippedMeleeWeaponClass);
    }

    void EquipDefaultRangedWeapons()
    {
        if (!IsValid(ConflictValueSet.DefaultEquippedRangedWeaponClass))
            return;

        if (IsValid(CharacterState.Inventory.FirstEquippedRangedWeapon) &&
            IsValid(ConflictValueSet.DefaultEquippedRangedWeaponClass) &&
            CharacterState.Inventory.FirstEquippedRangedWeapon.IsA(ConflictValueSet.DefaultEquippedRangedWeaponClass))
            return;

        AI.CharacterState.Inventory.EquipRangedWeaponOfClass(ConflictValueSet.DefaultEquippedRangedWeaponClass);
    }

    void AssessEvents()
    {
        // if (HasSomethingToDoBeforeReturnToDailyRoutine())
        //     return;

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
    }

    void DoActionsBeforeDailyRoutine()
    {
        PickUpDroppedTorch();
        PickUpDroppedPouch();
    }

    // /* Check if any other actions should happen as soon as an NPC is able to switch into Daily Routine */
    // bool HasSomethingToDoBeforeReturnToDailyRoutine()
    // {        
    //     if (AssessDroppedPouch())
    //         return true;

    //     return false;
    // }

    /* if NPC should pick up a pouch they have dropped in the past, do it.*/
    void PickUpDroppedPouch()
    {
        auto LongTermMemory = AI.CharacterState.LongTermMemory;

        // Check if pouch was already lost in the past
        auto PouchLostMemories = LongTermMemory.Filter()
            .WithTag(GameplayTag::Memory_OwnedPouch_NotFound).Array;

        bool bPouchAlreadyLost = !PouchLostMemories.IsEmpty();

        // If NPC failed to find their pouch in the past, it can't be picked up anymore.
        if (bPouchAlreadyLost)
            return;

        // Find pouch dropped memories
        auto PouchDroppedMemories = LongTermMemory.Filter()
                .WithTag(GameplayTag::Memory_OwnedPouch_Dropped)
                .ArrayNewestToOldest;
        
        // If no pouch dropped memories are found, no pouch has to be picked up
        if (PouchDroppedMemories.IsEmpty())
            return;

        auto LastPouchDroppedMemory = PouchDroppedMemories[0];

        // Check if there's pouch picked up memories after the last pouch dropped memory
        auto PouchPickedUpMemories = LongTermMemory.Filter()
            .WithTag(GameplayTag::Memory_OwnedPouch_PickedUp)
            .AfterTime(PouchDroppedMemories[0].Time).Array;

        bool bPouchAlreadyPickedUp = !PouchPickedUpMemories.IsEmpty();

        // If there's a pouch picked up event after the last pouch dropped event, no pouch has to be picked up
        if (bPouchAlreadyPickedUp)
            return;

        FVector Location = PouchDroppedMemories[0].Position;
        auto PickUpTask = AI.FindAndPickUpItem(UItMi_Meta_Pouch, Location, 100.0f);

        if (PickUpTask.WasSuccessful())
        {
            RememberPouchPickedUpAtLocation(Location);
        }
        else if (PickUpTask.Result == EGenericTaskResult::Failed)
        {
            RememberPouchNotFoundAtLocation(Location);
        }

        // // If NPC has a memory of dropping their pouch and no memory of picking it up after or of not finding it, they have to go try pick it up
        // FRememberedPerception FakePerception; // Create fake perception event for the Assessment system
        // FakePerception.EventTag = GameplayTag::Memory_OwnedPouch_Dropped; // Tag for identification
        // FakePerception.Origin.AtPosition = PouchDroppedMemories[0].Position; // Pass position of the pouch as remembered in long term memory

        // AI.AssessEvent(GameplayTag::AIEvent_Heard_Pouch, FakePerception); // Assess the same event as for hearing the pouch drop, but with the fake perception.
        // return true;
    }

    /* if NPC should pick up a torch they have dropped in the past, do it.*/
    void PickUpDroppedTorch()
    {
        auto TorchValueSet = AI.SpawnedStorage(UAIValueSet_Torch);

        auto GameTimeSubsystem = UGameTimeSubsystem::Get();
        auto DayTimeType = GameTimeSubsystem.DayTimeType;
        if (DayTimeType != EDayTimeType::Night && DayTimeType != EDayTimeType::Evening)
            return;

        if (!TorchValueSet.LastTimeTorchDropped.IsValid() || !TorchValueSet.LastTimeTorchDropped.IsLessThanXHoursAgo(2.0f) ||
            TorchValueSet.DroppedTorchLocation.IsNearlyZero() || TorchValueSet.DroppedTorchLocation.IsZero() ||
            TorchValueSet.DroppedTorchLocation.Distance(Self.FeetLocation) > 1000.0f)
            return;

        FVector Location = TorchValueSet.DroppedTorchLocation;
        AI.FindAndPickUpItem(UItMw_1H_Torch, Location, 100.0f);
        WaitSeconds(0.4f);
    }

    FString GetDisplayName() const override
    {
        return "AssessGoToDailyRoutine";
    }

    void RememberPouchPickedUpAtLocation(FVector Location)
    {
        RememberEventAtLocation(GameplayTag::Memory_OwnedPouch_PickedUp, Location);
    }

    void RememberPouchNotFoundAtLocation(FVector Location)
    {
        RememberEventAtLocation(GameplayTag::Memory_OwnedPouch_NotFound, Location);
    }

    void RememberEventAtLocation(FGameplayTag EventTag, FVector Location)
    {
        FMemorizedEvent MemorizedEvent = FMemorizedEvent();
        MemorizedEvent.EventTags.AddTag(EventTag);
        MemorizedEvent.Position = Location;

        CharacterState.LongTermMemory.MemorizeEvent(MemorizedEvent);
    }
}