
/** Someone did something to this character at the current time and place. */
UFUNCTION(BlueprintCallable)
mixin void MemorizeActionAgainstMe(ULongTermMemoryComponent LongTermMemory, 
                                   FGameplayTag MemoryTag,
                                   const AGothicCharacterState Instigator,
                                   FGameplayTagContainer AdditionalTags = FGameplayTagContainer())
{
	LongTermMemory.MemorizeActionAgainstCharacter(MemoryTag, LongTermMemory.OwningCharacterState, Instigator, AdditionalTags);
}

/** Someone did something to this character at the current time and place. */
UFUNCTION(BlueprintCallable)
mixin void UpdateLastMemoryAgainstMeMatchingAll(ULongTermMemoryComponent LongTermMemory, 
                                   FGameplayTag MemoryTag,
                                   const AGothicCharacterState Instigator,
                                   FGameplayTagContainer AdditionalTags = FGameplayTagContainer())
{   
    FMemorizedEvent Event;

    Event.EventTags.AddTag(MemoryTag);
    for (auto Tag : AdditionalTags.GameplayTags)
    {
        Event.EventTags.AddTag(Tag);
    }

    Event.InstigatorGlobalId = Instigator.CharacterGlobalId;
    Event.AffectedCharacterGlobalId =  LongTermMemory.OwningCharacterState.CharacterGlobalId;

    Event.Position = LongTermMemory.OwningCharacterState.ActorLocation;
    Event.Time = UGameTimeSubsystem::Get().GetCurrentGameTime();

    LongTermMemory.AddOrReplaceLastMemoryMatchingAny(MemoryTag.SingleTagContainer, Event);
}

/** I did something to this character at the current time and place. */
UFUNCTION(BlueprintCallable)
mixin void MemorizeActionAgainstOther(ULongTermMemoryComponent LongTermMemory, 
                                    FGameplayTag MemoryTag,
                                    const AGothicCharacterState Target,
                                    FGameplayTagContainer AdditionalTags = FGameplayTagContainer())
{
	LongTermMemory.MemorizeActionAgainstCharacter(MemoryTag, Target, LongTermMemory.OwningCharacterState, AdditionalTags);
}


/** Someone did something to this character at the current time and place. */
UFUNCTION(BlueprintCallable)
mixin void UpdateLastMemoryAgainstCharacterAll(ULongTermMemoryComponent LongTermMemory, 
                                FGameplayTag MemoryTag,
                                const AGothicCharacterState Target,
                                const AGothicCharacterState Instigator,
                                FGameplayTagContainer AdditionalTags = FGameplayTagContainer())
{   
    FMemorizedEvent Event;

    Event.EventTags.AddTag(MemoryTag);
    for (auto Tag : AdditionalTags.GameplayTags)
    {
        Event.EventTags.AddTag(Tag);
    }
    Event.InstigatorGlobalId = Instigator.CharacterGlobalId;
    Event.AffectedCharacterGlobalId =  Target.CharacterGlobalId;

    Event.Position = LongTermMemory.OwningCharacterState.ActorLocation;
    Event.Time = UGameTimeSubsystem::Get().GetCurrentGameTime();

    LongTermMemory.AddOrReplaceLastMemoryMatchingAny(MemoryTag.SingleTagContainer, Event);
}

/** Someone did something to someone else at the current time and the targets place. */
UFUNCTION(BlueprintCallable)
mixin void MemorizeActionAgainstCharacter(ULongTermMemoryComponent LongTermMemory, 
                                FGameplayTag MemoryTag,
                                const AGothicCharacterState Target,
								const AGothicCharacterState Instigator,
                                FGameplayTagContainer AdditionalTags = FGameplayTagContainer())
{
    if (Instigator == nullptr || Target == nullptr)
        return;

	FMemorizedEvent Event;
	
	Event.InstigatorGlobalId = Instigator.CharacterGlobalId;
	Event.AffectedCharacterGlobalId = Target.CharacterGlobalId;

	Event.Position = Target.ActorLocation;
    Event.Time = FInGameTime::Now();
	Event.EventTags.AddTag(MemoryTag);
    for (auto Tag : AdditionalTags.GameplayTags)
    {
        Event.EventTags.AddTag(Tag);
    }

	LongTermMemory.MemorizeEvent(Event);
}

/** Someone did something to a guild at the current time and the instigator's place. */
UFUNCTION(BlueprintCallable)
mixin void MemorizeActionAgainstGuild(ULongTermMemoryComponent LongTermMemory, 
                                 FGameplayTag MemoryTag,
                                 FGameplayTag TargetGuildTag,
								const AGothicCharacterState Instigator)
{
    if (Instigator == nullptr)
        return;

	FMemorizedEvent Event;
	
	Event.InstigatorGlobalId = Instigator.CharacterGlobalId;

	Event.Position = Instigator.ActorLocation;
    Event.Time = UGameTimeSubsystem::Get().GetCurrentGameTime();
	Event.EventTags.AddTag(MemoryTag);
    Event.EventTags.AddTag(TargetGuildTag);

	LongTermMemory.MemorizeEvent(Event);
}

/** Someone did something to someone else at the current time and the targets place. */
UFUNCTION(BlueprintCallable)
mixin void MemorizeActionAgainstCharacterWithPayload(ULongTermMemoryComponent LongTermMemory, 
                                 FGameplayTag MemoryTag,
                                 const AGothicCharacterState Target,
								const AGothicCharacterState Instigator,
                                FInstancedStruct Payload,
                                FGameplayTagContainer ContextTags = FGameplayTagContainer())
{
    if (Instigator == nullptr)
        return;

	FMemorizedEvent Event;
    Event.InstigatorGlobalId = Instigator.CharacterGlobalId;
	
    if (Target != nullptr)
    {
	    Event.AffectedCharacterGlobalId = Target.CharacterGlobalId;
        Event.Position = Target.ActorLocation;
    }
    else
    {
        Event.Position = Instigator.ActorLocation;
    }

    
    Event.Time = UGameTimeSubsystem::Get().GetCurrentGameTime();
	Event.EventTags.AddTag(MemoryTag);

    Event.Payload = Payload;

	LongTermMemory.MemorizeEvent(Event);
}

/** Someone did something to a guild at the current time and the instigator's place. */
UFUNCTION(BlueprintCallable)
mixin void MemorizeActionAgainstGuildWithPayload(ULongTermMemoryComponent LongTermMemory, 
                                 FGameplayTag MemoryTag,
                                 FGameplayTagContainer TargetGuildTags,
								const AGothicCharacterState Instigator,
                                FInstancedStruct Payload,
                                FGameplayTagContainer ContextTags = FGameplayTagContainer())
{
    if (Instigator == nullptr)
        return;

	FMemorizedEvent Event;
	
	Event.InstigatorGlobalId = Instigator.CharacterGlobalId;

	Event.Position = Instigator.ActorLocation;
    Event.Time = UGameTimeSubsystem::Get().GetCurrentGameTime();
	Event.EventTags.AddTag(MemoryTag);

    
    // TODO: ADD GUILD TAGS AS EVENT TAGS

    Event.Payload = Payload;

	LongTermMemory.MemorizeEvent(Event);
}

/** Returns an array of all the memories matching the specifications */
UFUNCTION(BlueprintCallable)
mixin TArray<FMemorizedEvent> GetLongTermMemoriesMatching(ULongTermMemoryComponent LongTermMemory, 
    FGameplayTag MemoryTag = FGameplayTag(), 
    const AGothicCharacterState Instigator = nullptr,
    const AGothicCharacterState Affected = nullptr,
    FGameplayTag TargetGuildTag = FGameplayTag())
{
    FMemoryFilter MemoryFilter = LongTermMemory.Filter();
    if (MemoryTag.IsValid())
    {
        MemoryFilter.WithTag(MemoryTag);
    }

    if (Instigator != nullptr)
    {
        MemoryFilter.CausedBy(Instigator.CharacterGlobalId);
    }

    if (Affected != nullptr)
    {
        MemoryFilter.Affecting(Affected.CharacterGlobalId);
    }

    if (TargetGuildTag.IsValid())
    {
        MemoryFilter.WithTag(TargetGuildTag);
    }

    return MemoryFilter.Array;
}

/** Returns an array of all the memories matching the specifications */
UFUNCTION(BlueprintCallable)
mixin FMemorizedEvent GetLastLongTermMemoryEventMatching(ULongTermMemoryComponent LongTermMemory, 
    FGameplayTag MemoryTag = FGameplayTag(), 
    const AGothicCharacterState Instigator = nullptr,
    const AGothicCharacterState Affected = nullptr,
    FGameplayTag TargetGuildTag = FGameplayTag())
{
    FMemoryFilter MemoryFilter = LongTermMemory.Filter();
    if (MemoryTag.IsValid())
    {
        MemoryFilter.WithTag(MemoryTag);
    }

    if (Instigator != nullptr)
    {
        MemoryFilter.CausedBy(Instigator.CharacterGlobalId);
    }

    if (Affected != nullptr)
    {
        MemoryFilter.Affecting(Affected.CharacterGlobalId);
    }

    if (TargetGuildTag.IsValid())
    {
        MemoryFilter.WithTag(TargetGuildTag);
    }

    MemoryFilter.MostRecentOnly();

    return MemoryFilter.Array.Last();
}

/** Adds all memories in the array to long term memory */
UFUNCTION(BlueprintCallable)
mixin void AddMemoriesFromArray(ULongTermMemoryComponent LongTermMemory, TArray<FMemorizedEvent> Memories)
{
    for (auto Memory : Memories)
    {
        LongTermMemory.MemorizeEvent(Memory);
    }
}

/** Get the Character this memory event affected */
UFUNCTION(BlueprintCallable)
mixin AGothicCharacter GetAffectedCharacter(FMemorizedEvent MemorizedEvent)
{
    return MemorizedEvent.GetAffectedCharacterState().Character;
}

/** Get the Character that instigated this memory event */
UFUNCTION(BlueprintCallable)
mixin AGothicCharacter GetInstigatorCharacter(FMemorizedEvent MemorizedEvent)
{
    return MemorizedEvent.GetInstigatorCharacterState().Character;
}

/** Get the Character this memory event affected */
UFUNCTION(BlueprintCallable)
mixin AGothicCharacterState GetAffectedCharacterState(FMemorizedEvent MemorizedEvent)
{
    return AGothicCharacterState::FindByGlobalId(MemorizedEvent.AffectedCharacterGlobalId);
}

/** Get the Character that instigated this memory event */
UFUNCTION(BlueprintCallable)
mixin AGothicCharacterState GetInstigatorCharacterState(FMemorizedEvent MemorizedEvent)
{
    return AGothicCharacterState::FindByGlobalId(MemorizedEvent.InstigatorGlobalId);
}