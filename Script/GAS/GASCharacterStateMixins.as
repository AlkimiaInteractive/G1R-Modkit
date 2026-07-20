
mixin bool HasGameplayTag(const AGothicCharacterState CharacterState, FGameplayTag Tag) 
{
    if (CharacterState == nullptr)
        return false;

    if (CharacterState.AbilitySystemComponent == nullptr)
        return false;

    return CharacterState.AbilitySystemComponent.HasGameplayTag(Tag);
}

mixin bool HasAnyGameplayTags(const AGothicCharacterState CharacterState, FGameplayTagContainer Tags) 
{
    if (CharacterState == nullptr)
        return false;

    if (CharacterState.AbilitySystemComponent == nullptr)
        return false;

    return CharacterState.AbilitySystemComponent.HasAnyGameplayTags(Tags);
}

mixin bool HasAllGameplayTags(const AGothicCharacterState CharacterState, FGameplayTagContainer Tags) 
{
    if (CharacterState == nullptr)
        return false;

    if (CharacterState.AbilitySystemComponent == nullptr)
        return false;

    return CharacterState.AbilitySystemComponent.HasAllGameplayTags(Tags);
}

UFUNCTION(BlueprintCallable)
mixin bool WasIntentionallyDamagedBy(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime = FInGameTime(), FInGameTime BeforeTime = FInGameTime())
{
    FMemoryFilter FilterMe = CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Combat_WasDamaged_Intentionally)
                                     .CausedBy(OtherCharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterMe.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterMe.BeforeTime(BeforeTime); }

    if (FilterMe.Count > 0)
    {
        return true;
    }

    FMemoryFilter FilterOther = OtherCharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Combat_WasDamaged_Intentionally)
                                          .Affecting(CharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterOther.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterOther.BeforeTime(BeforeTime); }

    if (FilterOther.Count > 0)
    {
        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool WasIntentionallyDamagedByAfterTime(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime)
{
    return CharacterState.WasIntentionallyDamagedBy(OtherCharacterState, AfterTime = AfterTime);
}

UFUNCTION(BlueprintCallable)
mixin bool WasIntentionallyDamagedByBeforeTime(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime BeforeTime)
{
    return CharacterState.WasIntentionallyDamagedBy(OtherCharacterState, BeforeTime = BeforeTime);
}

UFUNCTION(BlueprintCallable)
mixin bool WasDefeatedBy(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime = FInGameTime(), FInGameTime BeforeTime = FInGameTime())
{
    FMemoryFilter FilterMe = CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Character_Defeated)
                                     .CausedBy(OtherCharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterMe.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterMe.BeforeTime(BeforeTime); }

    if (FilterMe.Count > 0)
    {
        return true;
    }

    FMemoryFilter FilterOther = OtherCharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated)
                                          .Affecting(CharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterOther.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterOther.BeforeTime(BeforeTime); }

    if (FilterOther.Count > 0)
    {
        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasDefeated(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime = FInGameTime(), FInGameTime BeforeTime = FInGameTime())
{
    if (OtherCharacterState == nullptr)
        return false;
    
    FMemoryFilter FilterMe = CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated)
                                     .Affecting(OtherCharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterMe.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterMe.BeforeTime(BeforeTime); }

    if (FilterMe.Count > 0)
    {
        return true;
    }

    FMemoryFilter FilterOther = OtherCharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Character_Defeated)
                                          .CausedBy(CharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterOther.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterOther.BeforeTime(BeforeTime); }

    if (FilterOther.Count > 0)
    {
        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasDefeatedAfterTime(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime)
{
    return CharacterState.HasDefeated(OtherCharacterState, AfterTime = AfterTime);
}

UFUNCTION(BlueprintCallable)
mixin bool HasDefeatedBeforeTime(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime BeforeTime)
{
    return CharacterState.HasDefeated(OtherCharacterState, BeforeTime = BeforeTime);
}

UFUNCTION(BlueprintCallable)
mixin bool HasRecentlyDefeated(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    return CharacterState.HasDefeated(OtherCharacterState, FInGameTime::XRealtimeSecondsAgo(60.0f));
}

UFUNCTION(BlueprintCallable)
mixin bool WasKilledBy(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime = FInGameTime(), FInGameTime BeforeTime = FInGameTime())
{
    FMemoryFilter FilterMe = CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Character_Defeated_Kill)
                                     .CausedBy(OtherCharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterMe.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterMe.BeforeTime(BeforeTime); }

    if (FilterMe.Count > 0)
    {
        return true;
    }

    FMemoryFilter FilterOther = OtherCharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated_Kill)
                                          .Affecting(CharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterOther.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterOther.BeforeTime(BeforeTime); }

    if (FilterOther.Count > 0)
    {
        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasKilled(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime = FInGameTime(), FInGameTime BeforeTime = FInGameTime())
{
    if (OtherCharacterState == nullptr)
        return false;

    FMemoryFilter FilterMe = CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated_Kill)
                                     .Affecting(OtherCharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterMe.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterMe.BeforeTime(BeforeTime); }

    if (FilterMe.Count > 0)
    {
        return true;
    }

    FMemoryFilter FilterOther = OtherCharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Character_Defeated_Kill)
                                          .CausedBy(CharacterState.CharacterGlobalId);

    if (AfterTime.IsValid()) { FilterOther.AfterTime(AfterTime); }
    if (BeforeTime.IsValid()) { FilterOther.BeforeTime(BeforeTime); }

    if (FilterOther.Count > 0)
    {
        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasKilledAfterTime(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime AfterTime)
{
    return CharacterState.HasKilled(OtherCharacterState, AfterTime = AfterTime);
}

UFUNCTION(BlueprintCallable)
mixin bool HasKilledBeforeTime(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState, FInGameTime BeforeTime)
{
    return CharacterState.HasKilled(OtherCharacterState, BeforeTime = BeforeTime);
}

UFUNCTION(BlueprintCallable)
mixin bool HasKilledCharactersOfSpecies(const AGothicCharacterState CharacterState, FGameplayTag Species, const int32 Amount = 1)
{
    int32 EventCount = CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated_Kill)
                                        .WithTag(Species)
                                        .Count;

    return EventCount >= Amount;
}

UFUNCTION(BlueprintCallable)
mixin bool HasDefeatedCharactersOfGuild(const AGothicCharacterState CharacterState, FGameplayTag Guild, const int32 Amount = 1)
{
    int32 EventCount = CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated)
                                        .WithTag(Guild)
                                        .Count;

    return EventCount >= Amount;
}

UFUNCTION(BlueprintCallable)
mixin bool HasKilledCharactersOfGuild(const AGothicCharacterState CharacterState, FGameplayTag Guild, const int32 Amount = 1)
{
    int32 EventCount = CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated_Kill)
                                        .WithTag(Guild)
                                        .Count;

    return EventCount >= Amount;
}

UFUNCTION(BlueprintCallable)
mixin bool HasBeenDefeatedByCharactersOfGuild(const AGothicCharacterState CharacterState, FGameplayTag Guild, const int32 Amount = 1)
{
    auto Events = CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Character_Defeated).Array;

    int32 EventCount = 0;
    for (auto Memory : Events)
    {
        auto Instigator = Memory.GetInstigatorCharacterState();
        if (!IsValid(Instigator))
            continue;
        
        if (Guild.MatchesTag (Memory.GetInstigatorCharacterState().GetGuild()))
        {
            EventCount++;

            if(EventCount >= Amount)
                return true;
        }
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasDefeatedFriends(const AGothicCharacterState CharacterState, const int32 Amount = 1)
{
    auto Events = CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated).Array;

    int32 EventCount = 0;
    for (auto Memory : Events)
    {
        if (CharacterState.GetRelationshipTowards(Memory.GetAffectedCharacterState()) == ERelationship::Friend)
        {
            EventCount++;

            if(EventCount >= Amount)
                return true;
        }
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasObtainedItemOfType(const AGothicCharacterState CharacterState, FGameplayTag Property, const int32 Amount = 1)
{
    int32 Count = CharacterState.LongTermMemory.Filter()
                                        .WithTag(GameplayTag::Memory_Item_Obtained)
                                        .WithTag(Property)
                                        .Count;

    return Count >= Amount;                                                    
}

UFUNCTION(BlueprintCallable)
mixin bool HasObtainedItemWithProperty(const AGothicCharacterState CharacterState, FGameplayTag Property, const int32 Amount = 1)
{
    int32 Count = CharacterState.LongTermMemory.Filter()
                                        .WithTag(GameplayTag::Memory_Item_Obtained)
                                        .WithTag(Property)
                                        .Count;

    return Count >= Amount;                                                    
}

UFUNCTION(BlueprintCallable)
mixin bool HasStartedSleeping(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasLongTermMemory(GameplayTag::Memory_Character_StartInteracting_Sleeping);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStartedTrading(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasLongTermMemory(GameplayTag::Memory_Character_Can_Trade);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStartedCrafting(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasLongTermMemory(GameplayTag::Memory_Character_StartInteracting_Crafting);
}

UFUNCTION(BlueprintCallable)
mixin bool HasLearnedRecipes(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasLongTermMemory(GameplayTag::Memory_Learned_Recipe);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStartedLockPicking(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasLongTermMemory(GameplayTag::Memory_Character_StartInteracting_LockPicking);
}

UFUNCTION(BlueprintCallable)
mixin bool HasLongTermMemory(const AGothicCharacterState CharacterState, FGameplayTag EventTag, const int32 Amount = 1)
{
    int32 Count = CharacterState.LongTermMemory.Filter()
                                        .WithTag(EventTag)
                                        .Count;

    return Count >= Amount;                                                    
}

UFUNCTION(BlueprintCallable)
mixin bool HasListenedTo(const AGothicCharacterState CharacterState, FText Voiceline)
{
    return CharacterState.RemembersVoiceline(Voiceline);
}

UFUNCTION(BlueprintCallable)
mixin bool HasSaid(const AGothicCharacterState CharacterState, FText Voiceline)
{
    return CharacterState.RemembersVoiceline(Voiceline);
}

UFUNCTION(BlueprintCallable)
mixin bool HasVoicetype(const AGothicCharacterState CharacterState, FGameplayTag VoiceType)
{
    return CharacterState.Voiceline.HasVoiceType(VoiceType);
}

/** Returns how many characters matching the given ones UniqueName are Dead in total. */
UFUNCTION(BlueprintCallable)
mixin int32 IsNumDeadOfThisKindAtLeast(const AGothicCharacterState CharacterState)
{
    int32 Count = 0;

    for (auto Other : AGothicCharacterState::FindAllByUniqueName(CharacterState.CharacterUniqueName))
    {
        if (IsValid(Other.NPCState) && Other.NPCState.RemovedFromWorld)
            continue;

        if (Other.IsDead())
        {
            Count += 1;
        }
    }

    return Count;
}

/** Returns how many characters matching the given ones UniqueName are Dead in total. */
UFUNCTION(BlueprintCallable)
mixin int32 IsNumAliveOfThisKindAtLeast(const AGothicCharacterState CharacterState)
{
    int32 Count = 0;

    for (auto Other : AGothicCharacterState::FindAllByUniqueName(CharacterState.CharacterUniqueName))
    {
        if (IsValid(Other.NPCState) && Other.NPCState.RemovedFromWorld)
                continue;

        if (!Other.IsDead())
        {
            Count += 1;
        }
    }

    return Count;
}

UFUNCTION(BlueprintCallable)
mixin bool IsEveryoneOfThisKindDead(const AGothicCharacterState CharacterState)
{
    for (auto Other : AGothicCharacterState::FindAllByUniqueName(CharacterState.CharacterUniqueName))
    {
        if (IsValid(Other.NPCState) && Other.NPCState.RemovedFromWorld)
            continue;

        if (!Other.IsDead())
            return false;
    }

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool IsEveryoneOfThisKindAlive(const AGothicCharacterState CharacterState)
{
    for (auto Other : AGothicCharacterState::FindAllByUniqueName(CharacterState.CharacterUniqueName))
    {
        if (IsValid(Other.NPCState) && Other.NPCState.RemovedFromWorld)
            continue;

        if (Other.IsDead())
            return false;
    }

    return true;
}

/** Returns true if the character is currently in a conversation */
UFUNCTION(BlueprintCallable)
mixin bool IsInConversation(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Conversation);
}

UFUNCTION(BlueprintCallable)
mixin void RefuseToTalk(const AGothicCharacterState CharacterState, float DurationSeconds)
{
    if (CharacterState.AbilitySystemComponent == nullptr)
        return;


    // TODO: Set instigator to allow selectively choosing who we want to refuse talking to
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_RefuseTalk(nullptr, DurationSeconds));
}

UFUNCTION(BlueprintCallable)
mixin bool IsRefusingToTalkWith(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState.AbilitySystemComponent == nullptr)
        return false;

    if (!CharacterState.HasGameplayTag(GameplayTag::State_RefuseTalk))
        return false;

    // TODO: Set instigator to allow selectively choosing who we want to refuse talking to
    // return CharacterState.AbilitySystemComponent.GetGameplayEffectCount(UGE_RefuseTalk::StaticClass(), nullptr /*, Other.AbilitySystemComponent */) != 0;

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool CanDemandPaymentForCrimes(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    UGameplayAbility_CharacterAI_Gothic CharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(CharacterState.AI);
    if(!IsValid(CharacterAI))
        return false;

    if (!OtherCharacterState.IsPlayerCharacter())
        return false;
    
    auto Relationship = CharacterAI.CharacterState.GetRelationshipTowards(OtherCharacterState);
    if (Relationship != ERelationship::Angry && Relationship != ERelationship::Hostile)
        return false;

    auto Hostility = CharacterAI.CharacterState.GetHostilityTowards(OtherCharacterState);
    if (Hostility != ERelationshipHostility::DemandPaymentForCrimes)
        return false;

    return true;
}

mixin bool CanCharacterPayCrimeFines(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    UGameplayAbility_CharacterAI_Gothic CharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(CharacterState.AI);
    if(!IsValid(CharacterAI))
        return false;

    if (!OtherCharacterState.IsPlayerCharacter())
        return false;

    if (!CharacterAI.bCanForgivePlayerWithFine)
        return false;

    if (OtherCharacterState.Inventory.GetOreCount() < CharacterAI.CurrentFineValueForPlayer)
        return false;

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool CanSeeCharacter(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState.Character == nullptr)
        return false;

    if (OtherCharacterState.Character == nullptr)
        return false;

    return UPerceptionSystem::Get().CanSee(CharacterState.Character, OtherCharacterState.Character);
}

UFUNCTION(BlueprintCallable)
mixin bool IsCharacter(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    return CharacterState == OtherCharacterState;
}

/** Returns true if the characterstate is friendly towards OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool IsFriendlyTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState == nullptr)
        return false;

    if (OtherCharacterState == nullptr)
        return false;

    return CharacterState.Relationship.IsFriendlyTowards(OtherCharacterState);
}

/** Returns true if the character is neutral towards OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool IsNeutralTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState == nullptr)
        return false;
    
    return CharacterState.Relationship.IsNeutralTowards(OtherCharacterState);
}

/** Returns true if the character is angry towards OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool IsAngryTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState == nullptr)
        return false;
    
    return CharacterState.Relationship.IsAngryTowards(OtherCharacterState);
}

/** Returns true if the character is hostile towards OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool IsHostileTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState == nullptr)
        return false;
    
    return CharacterState.Relationship.IsHostileTowards(OtherCharacterState);
}

/** Returns true if the character is enemy towards OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool IsEnemyTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (CharacterState == nullptr)
        return false;
    
    return CharacterState.Relationship.IsEnemyTowards(OtherCharacterState);
}

/** Returns true if the character is protecting OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool IsProtecting(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(OtherCharacterState))
        return false;

    ERelationshipHostility HostilityTowardsOther = CharacterState.Relationship.GetHostilityTowards(OtherCharacterState);
    if (HostilityTowardsOther == ERelationshipHostility::ProtectFromDifferentGuild_Premium ||
        HostilityTowardsOther == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction ||
        HostilityTowardsOther == ERelationshipHostility::ProtectFromDifferentGuild ||
        HostilityTowardsOther == ERelationshipHostility::ProtectFromNonFriendly)
        return true;

    return false;
}

/** Returns true if the character is protecting OtherCharacterState */
UFUNCTION(BlueprintCallable)
mixin bool HasAnyPremiumProtection(const AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState))
        return false;

    if (!CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp_Digger) && !CharacterState.Guild.MatchesTag(GameplayTag::Guild_None))
        return false;

    if (CharacterState.HasGameplayTag(GameplayTag::State_OldCampProtection_Premium))
        return true;

    return false;
}

/** Teleports the character to the given InteractionSpot */
UFUNCTION(BlueprintCallable)
mixin void TeleportToSpot(AGothicCharacterState CharacterState, FName SpotName)
{
    if (CharacterState == nullptr)
    {
        Print(f"CharacterState is NULL during teleport to spot {SpotName}");
        return;
    }

    FInteractionSpotHandle Spot(SpotName);
    if(!Spot.IsValid())
    {
        Print(f"Requested teleport of {CharacterState.CharacterGlobalId} to invalid spot {SpotName}");
        return;
    }

    //Make sure to position Character On the Floor
    FVector SpotLocation = Spot.Transform.Location;
    AGothicCharacter Character = CharacterState.GetCharacter();
    FHitResult hit;
    if(MagicScript::FindFloorAtLocation(SpotLocation, hit, Character, ECollisionChannel::IKTrace, -200, 10))
    {
        SpotLocation.Z = hit.ImpactPoint.Z;

        if(Character != nullptr)
        {
            SpotLocation.Z += Character.CapsuleComponent.ScaledCapsuleHalfHeight;
        }
    }
    
    CharacterState.Teleport(SpotLocation, FRotator(0, Spot.Transform.Rotation.Rotator().Yaw, 0));
}

/** Hides/Unhides items from specified Inventory */
UFUNCTION(BlueprintCallable)
mixin void HideInventoryType(AGothicCharacterState CharacterState, bool Hide, EInventoryTypes Inventory)
{
    if (CharacterState == nullptr){
        //Print(f"CharacterState is NULL during HideInventoryType");
        return;
    }
    if (CharacterState.Character == nullptr){
        //Print(f"Character of {CharacterState} is NULL during HideInventoryType");
        return;
    }
    if (CharacterState.Character.CarryComponent == nullptr){
        //Print(f"CarryComponent of {CharacterState.Character} is NULL during HideInventoryType");
        return;
    }

    CharacterState.Character.CarryComponent.SetHiddenInGameByInventoryType(Hide, Inventory);
}

UFUNCTION(BlueprintCallable)
mixin bool IsCloseToWaypoint(const AGothicCharacterState CharacterState, FName WaypointName, float Distance = 10.0f * 100.0f)
{
    FInteractionSpotHandle Spot = FInteractionSpotHandle(WaypointName);

    if (!Spot.IsValid())
        return false;

    if (CharacterState.Character != nullptr)
    {
        return CharacterState.Character.GetDistanceToHitCollision(Spot.Location) < Distance;
    }
    else
    {
        return CharacterState.CharacterLocation.Distance(Spot.Location) < Distance;
    }
}

UFUNCTION(BlueprintCallable)
mixin bool IsDoingAnyInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Interact_Ongoing);
}

UFUNCTION(BlueprintCallable)
mixin bool IsAtHome(const AGothicCharacterState CharacterState, float Meters = 5.0f)
{
    return true; // TODO: Implement
}

UFUNCTION(BlueprintCallable)
mixin bool HasSkill(const AGothicCharacterState CharacterState, FGameplayTag SkillTag)
{
    return CharacterState.HasGameplayTag(SkillTag);
}

/** Returns true if the character is currently holding any item in their hands. */
UFUNCTION(BlueprintCallable)
mixin bool IsHoldingItem(const AGothicCharacterState CharacterState)
{
    if (CharacterState.Character == nullptr)
        return false;

    return CharacterState.Character.IsHoldingItem();
}

/** Returns true if the character is currently saying a voice line */
UFUNCTION(BlueprintCallable)
mixin bool IsSpeaking(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Speak);
}

/** Returns true if the character has the given debuf right now */
UFUNCTION(BlueprintCallable)
mixin bool HasDebuff(const AGothicCharacterState CharacterState, FGameplayTag DebuffTag)
{
    check (DebuffTag.MatchesTag(GameplayTag::Debuff));

    return CharacterState.HasGameplayTag(DebuffTag);
}

UFUNCTION(BlueprintCallable)
mixin void AddItemToInventory(AGothicCharacterState CharacterState, TSubclassOf<UItemDefinition> Item, int Count = 1, EInventoryTypes inventory = EInventoryTypes::MainContainer)
{
    CharacterState.Inventory.AddItemOfClassInventory(Item, Count, inventory);
}

UFUNCTION(BlueprintCallable)
mixin void RemoveItemFromInventory(AGothicCharacterState CharacterState, TSubclassOf<UItemDefinition> Item, int Count = 1, int Pouch = 0)
// mixin void RemoveItemFromInventory(AGothicCharacterState CharacterState, TSubclassOf<UItemDefinition> Item, int Count = 1, EInventorySlotKind InventoryKind = EInventorySlotKind::BasicInventory)
{
    CharacterState.Inventory.RemoveItemOfClass(Item, Count, Pouch != 0 ? EInventorySlotKind::BasicInventoryAndPouch : EInventorySlotKind::BasicInventory);
}

UFUNCTION(BlueprintCallable)
mixin void RemoveAllItemsFromInventory(AGothicCharacterState CharacterState, TSubclassOf<UItemDefinition> Item)
{
    CharacterState.Inventory.RemoveAllItemsOfClass(Item);
}

UFUNCTION(BlueprintCallable)
// mixin bool HasItem(const AGothicCharacterState CharacterState, TSubclassOf<UItemDefinition> Item, int MinCount = 1, EInventorySlotKind InventoryKind = EInventorySlotKind::BasicInventory)
mixin bool HasItem(const AGothicCharacterState CharacterState, TSubclassOf<UItemDefinition> Item, int MinCount = 1, int Pouch = 0)
{
    return CharacterState.Inventory.CountItemsOfClass(Item, Pouch != 0 ? EInventorySlotKind::BasicInventoryAndPouch : EInventorySlotKind::BasicInventory) >= MinCount;
}

UFUNCTION(BlueprintCallable)
mixin bool HasItemOfType(const AGothicCharacterState CharacterState, FGameplayTag ItemType, int MinCount = 1)
{
    return CharacterState.Inventory.CountItemsOfType(ItemType) >= MinCount;
}

/** Returns true if the character has a melee weapon other than fists equipped */
UFUNCTION(BlueprintCallable)
mixin bool HasEquippedMeleeWeapon(const AGothicCharacterState CharacterState)
{
    for (auto Weapon : CharacterState.Inventory.GetEquippedItemsOfClass(UWeaponMeleeDefinition))
    {
        if (Weapon.ItemType.MatchesTag(GameplayTag::Item_Weapon_Fist))
            continue;

        return true;
    }

    return false;
}

/** Returns true if the character has a ranged weapon equipped */
UFUNCTION(BlueprintCallable)
mixin bool HasEquippedRangedWeapon(const AGothicCharacterState CharacterState)
{
    auto RangedWeapons =  CharacterState.Inventory.GetEquippedItemsOfClass(UWeaponRangedDefinition);

    return RangedWeapons.Num() > 0;
}


/** ---- Level progression ---- */

/** Current level of the character. */
UFUNCTION(BlueprintCallable)
mixin float32 GetLevelAttribute(const AGothicCharacterState CharacterState) property { return CharacterState.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"Level", 0.0f); }

/** How much experience this character has. (Used for levelup) */
UFUNCTION(BlueprintCallable)
mixin float32 GetExperienceAttribute(const AGothicCharacterState CharacterState) property { return CharacterState.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"Experience", 0.0f); }

/** How many points the character can spend on learning new skills. */
UFUNCTION(BlueprintCallable)
mixin float32 GetSkillpointsAttribute(const AGothicCharacterState CharacterState) property { return CharacterState.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints", 0.0f); }

/** Experience points awarded to the character's killers. (Used for levelup) */
UFUNCTION(BlueprintCallable)
mixin float32 GetXPKillOrDefeatBountyAttribute(const AGothicCharacterState CharacterState) property { return CharacterState.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"XPKillOrDefeatBounty", 0.0f); }

/** Experience points awarded to the character's defeated. (Used for levelup) */
UFUNCTION(BlueprintCallable)
mixin float32 GetXPExecutedBountyAttribute(const AGothicCharacterState CharacterState) property { return CharacterState.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"XPExecutedBounty", 0.0f); }

/** ---- Guild ---- */

UFUNCTION(BlueprintCallable) mixin FGameplayTag GetGuildLevelTag(const AGothicCharacterState CharacterState) { return CharacterState.Guild.GetParentAtHierarchyLevel(4); }
UFUNCTION(BlueprintCallable) mixin FGameplayTag GetCampLevelTag(const AGothicCharacterState CharacterState) { return CharacterState.Guild.GetParentAtHierarchyLevel(3); }

/** ---- Gameplay ---- */

UFUNCTION(BlueprintCallable) mixin float32 GetHealthAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Health, n"Health", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetMaxHealthAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Health, n"MaxHealth", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetDamageMultiplierAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Health, n"DamageMultiplier", Default); }


UFUNCTION(BlueprintCallable) mixin float32 GetHealthAttributeBaseValue(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeBaseValue(UAttributeSet_Health, n"Health", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetMaxHealthAttributeBaseValue(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeBaseValue(UAttributeSet_Health, n"MaxHealth", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetManaAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Mana, n"Mana", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetMaxManaAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Mana, n"MaxMana", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetManaAttributeBaseValue(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeBaseValue(UAttributeSet_Mana, n"Mana", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetMaxManaAttributeBaseValue(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeBaseValue(UAttributeSet_Mana, n"MaxMana", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetDexterityAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Dexterity, n"Dexterity", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetStrengthAttribute(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Strength, n"Strength", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetDexterityAttributeBaseValue(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeBaseValue(UAttributeSet_Dexterity, n"Dexterity", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetStrengthAttributeBaseValue(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeBaseValue(UAttributeSet_Strength, n"Strength", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetCombatAttribute_OneHandCritical(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Strength, n"Critical_OneHand", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetCombatAttribute_TwoHandCritical(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Strength, n"Critical_TwoHand", Default); }


UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_SuperArmor(const AGothicCharacterState CharacterState, float32 Default = 0.0f)         { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"SuperArmor", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_MaxSuperArmor(const AGothicCharacterState CharacterState, float32 Default = 0.0f)      { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"MaxSuperArmor", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Blunt(const AGothicCharacterState CharacterState, float32 Default = 0.0f)   { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Blunt", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Edge(const AGothicCharacterState CharacterState, float32 Default = 0.0f)    { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Edge", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Point(const AGothicCharacterState CharacterState, float32 Default = 0.0f)   { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Point", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Fire(const AGothicCharacterState CharacterState, float32 Default = 0.0f)    { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Fire", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Energy(const AGothicCharacterState CharacterState, float32 Default = 0.0f)  { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Energy", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Ice(const AGothicCharacterState CharacterState, float32 Default = 0.0f)     { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Ice", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Wind(const AGothicCharacterState CharacterState, float32 Default = 0.0f)    { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Wind", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Falling(const AGothicCharacterState CharacterState, float32 Default = 0.0f) { return CharacterState.GetAttributeValue(UAttributeSet_Armor, n"Resistance_Falling", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetMovementAttribute_SpeedModifier(const AGothicCharacterState CharacterState) property { return CharacterState.GetAttributeValue(UAttributeSet_Movement, n"SpeedModifier", 0.0f); }

/** ---- Skills ---- */

UFUNCTION(BlueprintCallable) mixin float32 GetSkillLevel_PickPocketing(const AGothicCharacterState CharacterState) property  { return CharacterState.GetAttributeValue(UAttributeSet_Pickpocketing, n"PickPocketing", 0.0f); }


UFUNCTION()
mixin void IncreaseStrengthAttributeBy(AGothicCharacterState CharacterState, float NumPoints)
{
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_IncreaseStrength(NumPoints));
}

UFUNCTION()
mixin void IncreaseDexterityAttributeBy(AGothicCharacterState CharacterState, float NumPoints)
{
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_IncreaseDexterity(NumPoints));
}

UFUNCTION()
mixin void IncreaseMaxManaAttributeBy(AGothicCharacterState CharacterState, float NumPoints)
{
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_IncreaseMaxMana(NumPoints));
}

/** Return the current value of the given AttributeSet/Name. Returns empty if the character had no such attribute. */
UFUNCTION(BlueprintCallable)
mixin float32 GetAttributeValue(const AGothicCharacterState CharacterState, TSubclassOf<UAngelscriptAttributeSet> AttributeSetClass, FName AttributeName, float32 Default = 0.0f)
{
    return CharacterState.AbilitySystemComponent.GetAttributeCurrentValue(AttributeSetClass, AttributeName, Default);
}

/** Return the base value of the given AttributeSet/Name. Returns empty if the character had no such attribute. */
UFUNCTION(BlueprintCallable)
mixin float32 GetAttributeBaseValue(const AGothicCharacterState CharacterState, TSubclassOf<UAngelscriptAttributeSet> AttributeSetClass, FName AttributeName, float32 Default = 0.0f)
{
    return CharacterState.AbilitySystemComponent.GetAttributeBaseValue(AttributeSetClass, AttributeName, Default);
}

/** Returns true, if the Character has the given attribute set and attribute. */
UFUNCTION(BlueprintCallable)
mixin bool HasAttribute(const AGothicCharacterState CharacterState, TSubclassOf<UAngelscriptAttributeSet> AttributeSetClass, FName AttributeName)
{
    auto ASC = CharacterState.AbilitySystemComponent;

    if (ASC == nullptr)
        return false;
    
    float32 Value;
    return ASC.TryGetAttributeCurrentValue(AttributeSetClass, AttributeName, Value);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEnoughOreToLearnSkill(const AGothicCharacterState CharacterState, TSubclassOf<UGE_Skill_Generic> SkillClass)
{
    UGE_Skill_Generic Skill = Cast<UGE_Skill_Generic>(SkillClass.Get().DefaultObject);

    return CharacterState.Inventory.GetOreCount() >= Skill.OreCost;
}

UFUNCTION(BlueprintCallable)
mixin bool HasEnoughSkillpointsToLearnSkill(const AGothicCharacterState CharacterState, TSubclassOf<UGE_Skill_Generic> SkillClass)
{
    UGE_Skill_Generic Skill = Cast<UGE_Skill_Generic>(SkillClass.Get().DefaultObject);

    return CharacterState.GetSkillpointsAttribute() >= Skill.GetSPCost();
}

UFUNCTION(BlueprintCallable)
mixin bool LearnSkill(AGothicCharacterState CharacterState, TSubclassOf<UGE_Skill_Generic> SkillClass, bool bApplyCosts = true) allow_discard
{
    UGE_Skill_Generic SkillToUse =  Cast<UGE_Skill_Generic>(SkillClass.Get().GetDefaultObject());
    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();

    if (bApplyCosts)
    {
        if (!CharacterState.HasEnoughOreToLearnSkill(SkillClass))
            return false;

        if (!CharacterState.HasEnoughSkillpointsToLearnSkill(SkillClass))
            return false;
    }

    //add the skill
    FGameplayEffectSpecHandle EffectSkill = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(SkillClass, 1.0f, Context);
    auto ResultSkill = CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(EffectSkill);

    if(!GothicGAS::IsActiveGameplayEffectHandleValid(ResultSkill))
        return false;

    MemorizeSkill(CharacterState, EffectSkill);

    if (bApplyCosts)
    {
        //spend sp
        FGameplayEffectSpecHandle EffectPaySp = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_SkillPay_SP::StaticClass(), 1.0f, Context);
        EffectPaySp.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -SkillToUse.GetSPCost());
        CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(EffectPaySp);

        //spend ore
        CharacterState.Inventory.RemoveOre(Math::RoundToInt(SkillToUse.OreCost));

        AGothicPlayerState PlayerState = Cast<AGothicPlayerState>(CharacterState);
        if (PlayerState != nullptr)
        {
            UTelemetryHelper::OnSkillPointSpent(PlayerState, SkillToUse);
        }
    }

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool LearnSkillForFree(AGothicCharacterState CharacterState, TSubclassOf<UGE_Skill_Generic> SkillClass) allow_discard
{
    return CharacterState.LearnSkill(SkillClass, bApplyCosts = false);
}

void MemorizeSkill(const AGothicCharacterState CharacterState, FGameplayEffectSpecHandle EffectSkill)
{
    auto GTS = UGameTimeSubsystem::Get();

    if(!IsValid(GTS))
        return;

    TArray<FGameplayTag> SkillTags;
    CharacterState.AbilitySystemComponent.GetAllChildTags(GameplayTag::Skill, SkillTags);

    FMemorizedEvent LearntSkillEvent;
    LearntSkillEvent.Position = CharacterState.ActorLocation;
    LearntSkillEvent.EventTags.AddTag(GameplayTag::Memory_Learned_Skill);
    LearntSkillEvent.Time = GTS.CurrentGameTime;
    
    for (FGameplayTag Tag : SkillTags)
    {
        LearntSkillEvent.EventTags.AddTag(Tag);
    }

    CharacterState.LongTermMemory.MemorizeEvent(LearntSkillEvent);
}

/** Returns true if this character has learned this specific skill. */
UFUNCTION(BlueprintCallable)
mixin bool HasLearnedSkill(const AGothicCharacterState CharacterState, TSubclassOf<UGE_Skill_Generic> SkillClass)
{
    return CharacterState.AbilitySystemComponent.GetGameplayEffectCount(SkillClass, nullptr) > 0;
}

/** Returns true if this character has learned this specific skill. */
UFUNCTION(BlueprintCallable)
mixin bool CanSenseAnyAliveCharacterOfKind(const AGothicCharacterState CharacterState, const AGothicCharacterState Kind, float WithinDistance)
{
    if (Kind == nullptr)
        return false;

    FGameplayTagContainer Exclude;
    Exclude.AddTag(GameplayTag::State_Dead);

    auto Found = AGothicCharacterState::FindAllInRadiusAroundWithTags(CharacterState.CharacterLocation, WithinDistance, FGameplayTagContainer(), Exclude);

    for (auto FoundCharacterState : Found)
    {
        if (FoundCharacterState == nullptr)
            continue;

        if (FoundCharacterState.CharacterUniqueName != Kind.CharacterUniqueName)
            continue;

        return true;
    }

    return false;
}

/** Returns true there are any alive characters of the given species within the given distance around this character. */
UFUNCTION(BlueprintCallable)
mixin bool AreThereAnyAliveCharactersOfSpeciesWithinDistance(const AGothicCharacterState CharacterState, FGameplayTag Species, float WithinDistance)
{
    FGameplayTagContainer Include;
    Include.AddTag(Species);

    FGameplayTagContainer Exclude;
    Exclude.AddTag(GameplayTag::State_Dead);

    return !AGothicCharacterState::FindAllInRadiusAroundWithTags(CharacterState.CharacterLocation, WithinDistance, Include, Exclude).IsEmpty();
}

/** Sets the relationship towards the other character until one of us defeats the other one. */
UFUNCTION(BlueprintCallable)
mixin void SetRelationshipUntilDefeat(AGothicCharacterState CharacterState, AGothicCharacterState Other, ERelationship Relationship)
{
    CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Story_UntilDefeated(Other, Relationship));
}

/** Sets the relationship towards the other character, permanently (until it is explicitly changed again) */
UFUNCTION(BlueprintCallable)
mixin void SetRelationshipTowards(AGothicCharacterState CharacterState, AGothicCharacterState Other, ERelationship Relationship)
{
    CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Story_Permanent(Other, Relationship));
}

UFUNCTION(BlueprintCallable)
mixin bool HasPermanentRelationshipTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState Other, ERelationship Relationship)
{
    if (!IsValid(Other))
        return false;

    return URelationshipSystem::Get().StaticRelationshipBetween(CharacterState.Species, Other.Species, CharacterState.Guild, Other.Guild).Relationship == Relationship;
}

/** Returns the current Relationship towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin ERelationship GetRelationshipTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (!IsValid(OtherCharacterState))
        return ERelationship::Neutral;

    return CharacterState.Relationship.GetRelationshipTowards(OtherCharacterState);
}

/** Returns the current RelationshipHostility towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin ERelationshipHostility GetHostilityTowards(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (!IsValid(OtherCharacterState))
        return ERelationshipHostility::None;

    return CharacterState.Relationship.GetHostilityTowards(OtherCharacterState);
}

/** Whether this character has arrived where they prefer to be during their DailyRoutine. */
UFUNCTION(BlueprintCallable)
mixin bool IsAtPreferredLocation(const AGothicCharacterState CharacterState, float ExtraRange = 0.0f)
{
    return CharacterState.PreferredLocation.DistanceFromSelf <= ExtraRange;
}

UFUNCTION()
mixin void StartIgnoringNonPlayerCharacters(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_Perceptions_Ignore_NPCs))
        return;

    CharacterState.AbilitySystemComponent.AddLooseGameplayTag(GameplayTag::State_Perceptions_Ignore_NPCs);
}

UFUNCTION()
mixin void StopIgnoringNonPlayerCharacters(AGothicCharacterState CharacterState)
{
    CharacterState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::State_Perceptions_Ignore_NPCs);
}

UFUNCTION()
mixin bool IsIgnoringNonPlayerCharacters(AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Perceptions_Ignore_NPCs);
}

UFUNCTION()
mixin void StartIgnoringItems(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_Perceptions_Ignore_Items))
        return;

    CharacterState.AbilitySystemComponent.AddLooseGameplayTag(GameplayTag::State_Perceptions_Ignore_Items);
}

UFUNCTION()
mixin void StopIgnoringItems(AGothicCharacterState CharacterState)
{
    CharacterState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::State_Perceptions_Ignore_Items);
}

UFUNCTION()
mixin bool IsIgnoringItems(AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Perceptions_Ignore_Items);
}

UFUNCTION()
mixin void GiveImmortality(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_UnKillable))
        return;

    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle effect = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_AI_Unkillable::StaticClass(), 1.0f, Context);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(effect);
}

UFUNCTION()
mixin void RemoveImmortality(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_UnKillable);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

/** Returns true if the character is currently unkillable */
UFUNCTION()
mixin bool IsImmortal(AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_UnKillable);
}

UFUNCTION()
mixin void GiveKillableWithoutDefeat(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_Killable))
        return;

    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle effect = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_AI_Killable::StaticClass(), 1.0f, Context);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(effect);
}

UFUNCTION()
mixin void RemoveKillableWithoutDefeat(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_Killable);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

/** Returns true if the character is currently unkillable */
UFUNCTION()
mixin bool IsKillableWithoutDefeat(AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Killable);
}

UFUNCTION()
mixin void MakeUnlootable(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_UnLootable))
        return;

    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle effect = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_AI_Unlootable::StaticClass(), 1.0f, Context);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(effect);
}

UFUNCTION()
mixin void MakeLootable(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_UnLootable);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

/** Returns true if the character is currently unlootable (not lootable under any circumstance)*/
UFUNCTION()
mixin bool IsUnlootable(AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_UnLootable);
}

UFUNCTION()
mixin void GivePremiumProtectionByBloodwyn(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_OldCampProtection_Premium))
        return;

    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle effect = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_Protection_Bloodwyn::StaticClass(), 1.0f, Context);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(effect);
}

UFUNCTION()
mixin void RemovePremiumProtectionByBloodwyn(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_OldCampProtection_Premium_Bloodwyn);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

UFUNCTION()
mixin void GivePremiumProtectionByFletcher(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_OldCampProtection_Premium))
        return;

    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle effect = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_Protection_Fletcher::StaticClass(), 1.0f, Context);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(effect);
}

UFUNCTION()
mixin void RemovePremiumProtectionByFletcher(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_OldCampProtection_Premium_Fletcher);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

UFUNCTION()
mixin void GivePremiumProtectionByJackal(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_OldCampProtection_Premium))
        return;

    FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle effect = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_Protection_Jackal::StaticClass(), 1.0f, Context);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(effect);
}

UFUNCTION()
mixin void RemovePremiumProtectionByJackal(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_OldCampProtection_Premium_Jackal);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

UFUNCTION(BlueprintCallable)
mixin void BlockTeleport(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    if (CharacterState.HasGameplayTag(GameplayTag::State_Spell_Teleport_Blocked))
        return;

    FGameplayEffectContextHandle contextHandle = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle EffectBlockSpellTeleport = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_BlockSpellTeleport::StaticClass(), 1.0f, contextHandle);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(EffectBlockSpellTeleport);
}

UFUNCTION(BlueprintCallable)
mixin void UnblockTeleport(AGothicCharacterState CharacterState)
{
    FGameplayTagContainer Tags;
    Tags.AddTag(GameplayTag::State_Spell_Teleport_Blocked);
    CharacterState.AbilitySystemComponent.RemoveActiveEffectsWithAppliedTags(Tags);
}

UFUNCTION(BlueprintCallable)
mixin void BlockFinalCombatTags(AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent))
        return;

    FGameplayEffectContextHandle contextHandle = CharacterState.AbilitySystemComponent.MakeEffectContext();
    FGameplayEffectSpecHandle EffectBlockFinalCombatTags = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_Human_BlockFinalCombatTags::StaticClass(), 1.0f, contextHandle);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(EffectBlockFinalCombatTags);

}

/** Returns true if the character is currently blocked from teleporting */
UFUNCTION()
mixin bool IsTeleportBlocked(AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Spell_Teleport_Blocked);
}

/** Grants the given amount of experience */
UFUNCTION(BlueprintCallable)
mixin void GiveExperience(AGothicCharacterState CharacterState, int Amount) 
{
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_IncreaseExperience(Amount));
}

/** Returns true, if the character was assigned the given daily routine. */
UFUNCTION(BlueprintCallable)
mixin bool HasAssignedDailyRoutine(AGothicCharacterState CharacterState, TSubclassOf<UAIState_DailyRoutine> DailyRoutineClass) 
{
    auto NPCState = Cast<AGothicNPCState>(CharacterState);

    // Must be an NPC to do a daily routine
    if (NPCState == nullptr)
        return false;

    if (NPCState.DailyRoutineTemplate == nullptr)
        return false;

    return NPCState.DailyRoutineTemplate.IsA(DailyRoutineClass);
}

/** Returns true if the character is carrying objects */
UFUNCTION(BlueprintCallable)
mixin bool IsCarryingObject(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::State_BlockState))
        return false;

    return CharacterState.HasGameplayTag(GameplayTag::State_Carrying);
}

/** Returns true if the character is performing alchemy */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingAlchemyInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_HerbAlchemy) ||
            CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_PotionAlchemy);
}

/** Returns true if the character is cooking */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingCookingInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Crafting_Cook);
}

/** Returns true if the character is eating */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingEatingInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Eat);
}

/** Returns true if the character is drinking */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingDrinkingInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Drink);
}

/** Returns true if the character is meditating */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingMeditationInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Meditate) ||
        CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_MeditateYberion);
}

/** Returns true if the character is farming */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingFarmingInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_PickRice) ||
        CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_RiceClean) ||
        CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_SowRice);
}

/** Returns true if the character is mining */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingMiningInteraction(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_PickOre);
}

/** Returns true, if the character is one of the heros */
UFUNCTION(BlueprintCallable)
mixin bool IsHero(const AGothicCharacterState CharacterState) 
{
    return CharacterState.IsA(AGothicPlayerState);
}

/** Kills this Character instantly. 
* bool Instant = false will play death anim
* bool Instant = true will not play any anim
* */
UFUNCTION(BlueprintCallable)
mixin void Kill(AGothicCharacterState CharacterState, bool Instant = true) 
{
    if(Instant){
        CharacterState.AbilitySystemComponent.AddTag(GameplayTag::State_Dead_Instant);
    }
    CharacterState.AbilitySystemComponent.AddTag(GameplayTag::State_Dead);
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_Kill());
}

/** Defeats this Character instantly. */
UFUNCTION(BlueprintCallable)
mixin void Defeat(AGothicCharacterState CharacterState) 
{
    CharacterState.AbilitySystemComponent.SendGameplayEvent(GameplayTag::Action_Defeated);
}

/** Defeats this Character instantly and lets it stay that way until explicitly cancelled. */
UFUNCTION(BlueprintCallable)
mixin void DefeatAndStayDefeated(AGothicCharacterState CharacterState) 
{
    CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(CharacterState.AbilitySystemComponent.GE_StayDefeated());
    CharacterState.AbilitySystemComponent.SendGameplayEvent(GameplayTag::Action_Defeated);
}

/** If this character was set to stay defeated, allows it to stand up again. */
UFUNCTION(BlueprintCallable)
mixin void NoLongerStayDefeated(AGothicCharacterState CharacterState) 
{
    CharacterState.AbilitySystemComponent.RemoveStayDefeatedEffect();
}

UFUNCTION(BlueprintCallable)
mixin void UnlockDocumentSegment(AGothicCharacterState CharacterState, TSubclassOf<UDocument> DocumentClass, TSubclassOf<UDocumentSegment> DocumentSegmentClass)
{
    if (UDocument::IsAllowedToUnlockSegment(CharacterState, DocumentClass, DocumentSegmentClass))
    {
        UDocument::RememberSegmentUnlocked(CharacterState, DocumentClass, DocumentSegmentClass);
    }
}

UFUNCTION(BlueprintCallable)
mixin bool IsPlayerControlled(const AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState.Character))
        return false;

    return CharacterState.Character.IsPlayerControlled();
}

/** Whether this character is a player character, regardless of being player controlled or not. */
UFUNCTION(BlueprintCallable)
mixin bool IsPlayerCharacter(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Character_Player);
}

/** Whether this character is considered to be human. */
UFUNCTION(BlueprintCallable)
mixin bool IsHuman(const AGothicCharacterState CharacterState)
{
    return CharacterState.Species.MatchesTag(GameplayTag::Species_Human);
}

/** Whether this character is considered to be an orc. */
UFUNCTION(BlueprintCallable)
mixin bool IsOrc(const AGothicCharacterState CharacterState)
{
    return CharacterState.Species.MatchesTag(GameplayTag::Species_Orc);
}

/** Whether this character is considered to be undead. */
UFUNCTION(BlueprintCallable)
mixin bool IsUndead(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Character_Undead);
}

/** Whether this character is considered to be a creature. */
UFUNCTION(BlueprintCallable)
mixin bool IsCreature(const AGothicCharacterState CharacterState)
{
    return CharacterState.Species.MatchesTag(GameplayTag::Species_Creature);
}

/** Whether this character is considered the given species */
UFUNCTION(BlueprintCallable)
mixin bool IsSpecies(const AGothicCharacterState CharacterState, FGameplayTag Species)
{
    return CharacterState.Species.MatchesTag(Species);
}

UFUNCTION(BlueprintCallable)
mixin bool IsDead(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Dead);
}

UFUNCTION(BlueprintCallable)
mixin bool IsDefeated(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Defeated);
}

UFUNCTION(BlueprintCallable)
mixin bool IsInjured(const AGothicCharacterState Character, float BelowHealthPercentage = 100.0f)
{
    return Character.GetHealthAttribute() / Character.GetMaxHealthAttribute() < BelowHealthPercentage / 100.0f;
}

UFUNCTION(BlueprintCallable)
mixin bool IsSitting(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::Action_Interact_Sit) && 
          !CharacterState.HasGameplayTag(GameplayTag::State_BlockState);
}

/** Returns true if the character needs some time until it can do actions again (e.g. when stunned or doing another action) */
UFUNCTION(BlueprintCallable)
mixin bool IsBlocked(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_BlockState);
}

/** Returns true if the character is currently flying */
UFUNCTION(BlueprintCallable)
mixin bool IsFlying(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Flying);
}

/** Returns true if the character is currently climbing a ladder or a wall */
UFUNCTION(BlueprintCallable)
mixin bool IsClimbingLadderOrWall(const AGothicCharacterState CharacterState)
{
    return CharacterState.IsClimbingLadder() || CharacterState.IsClimbingWall();
}

/** Returns true if the character is currently climbing a ladder */
UFUNCTION(BlueprintCallable)
mixin bool IsClimbingLadder(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Ladder);
}

/** Returns true if the character is currently climbing a wall */
UFUNCTION(BlueprintCallable)
mixin bool IsClimbingWall(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_WallClimbing);
}

/** Returns true if the character is holding their weapon defensively to block incomming attacks. */
UFUNCTION(BlueprintCallable)
mixin bool IsInBlockingStance(const AGothicCharacterState CharacterState)
{
    return CharacterState.HasGameplayTag(GameplayTag::State_Block);
}

UFUNCTION(BlueprintCallable)
mixin bool ShouldActBrave(const AGothicCharacterState CharacterState)
{
    if (CharacterState.IsCowardPersonality())
        return false;

    if (CharacterState.IsBravePersonality())
        return true;

    if (CharacterState.IsBraveRole())
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool ShouldActCoward(const AGothicCharacterState CharacterState)
{
    if (CharacterState.IsCowardPersonality())
        return true;

    if (CharacterState.HasGameplayTag(GameplayTag::Debuff_Fear))
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsBraveRole(const AGothicCharacterState CharacterState)
{
    FGameplayTagContainer BraveRoles;
    BraveRoles.AddTag(GameplayTag::CampRole_Boss);
    BraveRoles.AddTag(GameplayTag::CampRole_Leadership);
    BraveRoles.AddTag(GameplayTag::CampRole_Guard);

    if (CharacterState.HasAnyGameplayTags(BraveRoles))
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsBravePersonality(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Coward))
        return false;

    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Brave))
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCowardPersonality(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Brave))
        return false;

    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Coward))
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsPatientPersonality(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Patient))
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsGuardRole(const AGothicCharacterState CharacterState)
{
    FGameplayTagContainer GuardRoles;
    GuardRoles.AddTag(GameplayTag::Role_Guard);
    GuardRoles.AddTag(GameplayTag::Role_BodyGuard);
    GuardRoles.AddTag(GameplayTag::Role_PersonalGuard);

    if (CharacterState.HasAnyGameplayTags(GuardRoles))
        return true;

    return false;
}

struct FStoryEventPayload
{
    FStoryEventPayload(FName InEventName)
    {
        EventName = InEventName;
    }

    UPROPERTY()
    FName EventName;
}

UFUNCTION(BlueprintCallable)
mixin void StoreStoryEventInMemory(AGothicCharacterState CharacterState, FName StoryEventName, const AGothicCharacterState Instigator)
{
    FMemorizedEvent StoryEvent;

    StoryEvent.Time = FInGameTime::Now();
    StoryEvent.InstigatorGlobalId = Instigator.CharacterGlobalId;
    StoryEvent.AffectedCharacterGlobalId = CharacterState.CharacterGlobalId;
    StoryEvent.EventTags.AddTag(GameplayTag::Memory_StoryEvent);
    StoryEvent.Payload = FInstancedStruct::Make(FStoryEventPayload(StoryEventName));

    CharacterState.LongTermMemory.MemorizeEvent(StoryEvent);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemory(const AGothicCharacterState CharacterState, FName StoryEventName, const AGothicCharacterState Instigator)
{
    auto Memories = CharacterState.LongTermMemory
        .Filter()
        .WithTag(GameplayTag::Memory_StoryEvent)
        .Affecting(CharacterState.CharacterGlobalId)
        .CausedBy(Instigator.CharacterGlobalId)
        .ArrayNewestToOldest;

    for (auto& Memory : Memories)
    {
        FStoryEventPayload EventData;
        Memory.Payload.Get(EventData);

        if (EventData.EventName == StoryEventName)
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryBeforeTime(const AGothicCharacterState CharacterState, FName StoryEventName, FInGameTime Time, const AGothicCharacterState Instigator)
{
    auto Memories = CharacterState.LongTermMemory
        .Filter()
        .BeforeTime(Time)
        .WithTag(GameplayTag::Memory_StoryEvent)
        .Affecting(CharacterState.CharacterGlobalId)
        .CausedBy(Instigator.CharacterGlobalId)
        .ArrayNewestToOldest;

    for (auto& Memory : Memories)
    {
        FStoryEventPayload EventData;
        Memory.Payload.Get(EventData);

        if (EventData.EventName == StoryEventName)
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryAfterTime(const AGothicCharacterState CharacterState, FName StoryEventName, FInGameTime Time, const AGothicCharacterState Instigator)
{
    auto Memories = CharacterState.LongTermMemory
        .Filter()
        .AfterTime(Time)
        .WithTag(GameplayTag::Memory_StoryEvent)
        .Affecting(CharacterState.CharacterGlobalId)
        .CausedBy(Instigator.CharacterGlobalId)
        .ArrayNewestToOldest;

    for (auto& Memory : Memories)
    {
        FStoryEventPayload EventData;
        Memory.Payload.Get(EventData);

        if (EventData.EventName == StoryEventName)
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryWithAgeAtLeast(const AGothicCharacterState CharacterState, FName StoryEventName, FInGameTime Age, const AGothicCharacterState Instigator)
{
    return CharacterState.HasStoryEventInMemoryBeforeTime(StoryEventName, FInGameTime::Now() - Age, Instigator);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryWithAgeAtMost(const AGothicCharacterState CharacterState, FName StoryEventName, FInGameTime Age, const AGothicCharacterState Instigator)
{
    return CharacterState.HasStoryEventInMemoryAfterTime(StoryEventName, FInGameTime::Now() - Age, Instigator);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryWithAgeAtLeastHours(const AGothicCharacterState CharacterState, FName StoryEventName, float AgeHours, const AGothicCharacterState Instigator)
{
    return CharacterState.HasStoryEventInMemoryBeforeTime(StoryEventName, FInGameTime::Now() - FInGameTime::FromHours(AgeHours), Instigator);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryWithAgeAtMostHours(const AGothicCharacterState CharacterState, FName StoryEventName, float AgeHours, const AGothicCharacterState Instigator)
{
    return CharacterState.HasStoryEventInMemoryAfterTime(StoryEventName, FInGameTime::Now() - FInGameTime::FromHours(AgeHours), Instigator);
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryFromToday(const AGothicCharacterState CharacterState, FName StoryEventName, const AGothicCharacterState Instigator)
{
    auto Memories = CharacterState.LongTermMemory
        .Filter()
        .WithTag(GameplayTag::Memory_StoryEvent)
        .Affecting(CharacterState.CharacterGlobalId)
        .CausedBy(Instigator.CharacterGlobalId)
        .AfterTime(FInGameTime::FromDays(FInGameTime::Now().Day))
        .BeforeTime(FInGameTime::FromDays(FInGameTime::Now().Day + 1))
        .ArrayNewestToOldest;

    for (FMemorizedEvent& Memory : Memories)
    {
        FStoryEventPayload EventData;
        Memory.Payload.Get(EventData);

        if (EventData.EventName == StoryEventName)
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasStoryEventInMemoryFromYesterdayOrBefore(const AGothicCharacterState CharacterState, FName StoryEventName, const AGothicCharacterState Instigator)
{
    auto Memories = CharacterState.LongTermMemory
        .Filter()
        .WithTag(GameplayTag::Memory_StoryEvent)
        .Affecting(CharacterState.CharacterGlobalId)
        .CausedBy(Instigator.CharacterGlobalId)
        .BeforeTime(FInGameTime::FromDays(FInGameTime::Now().Day))
        .ArrayNewestToOldest;

    for (FMemorizedEvent& Memory : Memories)
    {
        FStoryEventPayload EventData;
        Memory.Payload.Get(EventData);

        if (EventData.EventName == StoryEventName)
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsInConflict(const AGothicCharacterState CharacterState)
{
    auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
    for (auto Group : Groups)
    {
        auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
        if (!IsValid(ConflictGroup))
            continue;

        if (!ConflictGroup.IsCharacterInvolved(CharacterState.Character))
            continue;

        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsEnforcerOrLeaderRole(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::CampRole_Guard) || 
        CharacterState.HasGameplayTag(GameplayTag::CampRole_Leadership) ||
        CharacterState.HasGameplayTag(GameplayTag::CampRole_Boss))
        return true;
    
    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool ActsBrave(const AGothicCharacterState CharacterState)
{
    if (CharacterState.IsPersonalityCoward())
        return false;

    if (CharacterState.IsPersonalityBrave())
        return true;

    if (CharacterState.IsEnforcerOrLeaderRole())
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsPersonalityBrave(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Brave))
        return true;
    
    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsPersonalityCoward(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::Character_Personality_Coward))
        return true;
    
    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCharacterStateWithinTerritory(AGothicCharacterState CharacterState, const UTerritoryConfig Territory)
{
    if (!IsValid(CharacterState))
        return false;

    UTerritorySubsystem TerritorySubsystem = UTerritorySubsystem::Get();
    bool bResult = TerritorySubsystem.IsCharacterStateWithinTerritory(CharacterState, Territory);
    return bResult;
}

UFUNCTION(BlueprintCallable)
mixin bool IsDoingMusicListeningInteraction(const AGothicCharacterState CharacterState)
{
    if (CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Dance))
             return true;
    if  (CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Clap))
              return true;
    
    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsDoingListeningInteraction(const AGothicCharacterState CharacterState)
{
    if  (CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Listen))
              return true;
    
    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsDoingPatrollingInteraction(const AGothicCharacterState CharacterState)
{
    if  (CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_GuardPassage))
              return true;

       if  (CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_GuardWatch))
              return true;
    
    return false;
}

UFUNCTION()
mixin bool HasPremiumProtectionByBloodwyn(AGothicCharacterState CharacterState)
{
    if (!CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp_Digger) && !CharacterState.Guild.MatchesTag(GameplayTag::Guild_None))
        return false;

    return CharacterState.HasGameplayTag(GameplayTag::State_OldCampProtection_Premium_Bloodwyn);
}

UFUNCTION()
mixin bool HasPremiumProtectionByJackal(AGothicCharacterState CharacterState)
{
    if (!CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp_Digger) && !CharacterState.Guild.MatchesTag(GameplayTag::Guild_None))
        return false;

    return CharacterState.HasGameplayTag(GameplayTag::State_OldCampProtection_Premium_Jackal);
}
/////


mixin void TeleportToWaypointAndExchangeDailyRoutineToClass(AGothicNPCState NPCState, TSubclassOf<UAIState_DailyRoutine> NewRoutine, FName Waypoint)
{
	FInteractionSpotHandle SpotHandle(Waypoint);

	if (!ensure(SpotHandle.IsValid()))
		return;

	// Make sure to position Character if already spawned On the Floor
	FTransform SpotTransform = SpotHandle.Transform;
	AGothicCharacter Character = NPCState.GetCharacter();
    FHitResult hit;
    if (MagicScript::FindFloorAtLocation(SpotTransform.Location, hit, Character, ECollisionChannel::IKTrace, -200, 10))
    {
        FVector Loc = SpotTransform.Location;
        Loc.Z = hit.ImpactPoint.Z;
        if(Character != nullptr)
        {
            Loc.Z += Character.CapsuleComponent.ScaledCapsuleHalfHeight;
        }

        SpotTransform.SetLocation(Loc);

    }
    SpotTransform.SetRotation(FRotator(0, SpotTransform.Rotation.Rotator().Yaw, 0));

	NPCState.TeleportAndExchangeDailyRoutineToClass(NewRoutine, SpotTransform);
}

mixin void ExchangeDailyRoutineToClass(AGothicCharacterState CharacterState, TSubclassOf<UAIState_DailyRoutine> NewRoutine)
{
    auto NPCState = Cast<AGothicNPCState>(CharacterState);

    if (!IsValid(NPCState))
        return;

    NPCState.ExchangeDailyRoutineToClass(NewRoutine);
}

UFUNCTION()
bool IsCharacterInWorld(const AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState))
        return false;

    auto NPCState = Cast<AGothicNPCState>(CharacterState);

    if (!IsValid(NPCState))
        return !CharacterState.IsABot();

    return !NPCState.RemovedFromWorld;
}

UFUNCTION()
mixin bool HasChatterMemoryEvent(const AGothicCharacterState CharacterState, FGameplayTag EventTag)
{
    if (!IsValid(CharacterState) || !EventTag.IsValid())
        return false;

    if (Math::RandRange(0.0f, 1.0f) < 0.8f)
        return false;

    auto FilterMemoriesWithTag = CharacterState.LongTermMemory.Filter().WithTag(EventTag);
    if (FilterMemoriesWithTag.Count == 0)
        return false;

    auto FilterMemoriesOlderThan = FilterMemoriesWithTag.BeforeTime(FInGameTime::XIngameHoursAgo(24.0f));
    if (FilterMemoriesOlderThan.Count == 0)
        return false;

    auto FilterMemoriesNewerThan = FilterMemoriesOlderThan.AfterTime(FInGameTime::XIngameHoursAgo(72.0f));
    if (FilterMemoriesNewerThan.Count == 0)
        return false;

    return true;
}

UFUNCTION()
mixin bool HasChatterForDefeatedGuild(const AGothicCharacterState CharacterState, FGameplayTag Guild)
{
    if (!IsValid(CharacterState) || !Guild.IsValid())
        return false;

    if (Math::RandRange(0.0f, 1.0f) < 0.8f)
        return false;
    
    auto FilterMemoriesWithTag = CharacterState
        .LongTermMemory
        .FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated)
        .WithTag(Guild);

    if (FilterMemoriesWithTag.Count == 0)
        return false;

    auto FilterMemoriesOlderThan = FilterMemoriesWithTag.BeforeTime(FInGameTime::XIngameHoursAgo(24.0f));
    if (FilterMemoriesOlderThan.Count == 0)
        return false;

    auto FilterMemoriesNewerThan = FilterMemoriesOlderThan.AfterTime(FInGameTime::XIngameHoursAgo(72.0f));
    if (FilterMemoriesNewerThan.Count == 0)
        return false;

    return true;
}

UFUNCTION()
mixin bool HasDefeatedInChatterTimeframe(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    if (!IsValid(CharacterState) || !IsValid(OtherCharacterState))
        return false;

    if (Math::RandRange(0.0f, 1.0f) < 0.8f)
        return false;
    
    auto FilterMemoriesWithTag = CharacterState
        .LongTermMemory
        .FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated)
        .Affecting(OtherCharacterState.CharacterGlobalId);
        
    if (FilterMemoriesWithTag.Count == 0)
        return false;

    auto FilterMemoriesOlderThan = FilterMemoriesWithTag.BeforeTime(FInGameTime::XIngameHoursAgo(24.0f));
    if (FilterMemoriesOlderThan.Count == 0)
        return false;

    auto FilterMemoriesNewerThan = FilterMemoriesOlderThan.AfterTime(FInGameTime::XIngameHoursAgo(72.0f));
    if (FilterMemoriesNewerThan.Count == 0)
        return false;

    return true;
}

UFUNCTION()
mixin bool HasDefeatedFriendsInChatterTimeframe(const AGothicCharacterState CharacterState, const int32 Amount = 1)
{
    if (!IsValid(CharacterState))
        return false;

    if (Math::RandRange(0.0f, 1.0f) < 0.8f)
        return false;
    
    auto FilterMemoriesWithTag = CharacterState
        .LongTermMemory
        .FilterEventsCausedByMe(GameplayTag::Memory_Character_Defeated);
        
    if (FilterMemoriesWithTag.Count == 0)
        return Amount == 0;

    auto FilterMemoriesOlderThan = FilterMemoriesWithTag.BeforeTime(FInGameTime::XIngameHoursAgo(24.0f));
    if (FilterMemoriesOlderThan.Count == 0)
        return Amount == 0;

    auto FilterMemoriesNewerThan = FilterMemoriesOlderThan.AfterTime(FInGameTime::XIngameHoursAgo(72.0f));
    if (FilterMemoriesNewerThan.Count == 0)
        return Amount == 0;

    int32 EventCount = 0;
    for (auto Memory : FilterMemoriesNewerThan.Array)
    {
        if (CharacterState.GetRelationshipTowards(Memory.GetAffectedCharacterState()) == ERelationship::Friend)
        {
            EventCount++;

            if(EventCount >= Amount)
                return Amount == 0;
        }
    }

    return Amount == 0;
}


UFUNCTION()
mixin AGothicCharacterState SummonedBy(const AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState))
        return nullptr;

    auto npcState = Cast<AGothicNPCState>(CharacterState);
    if(npcState == nullptr)
        return nullptr;
    
    auto summonedBy = npcState.GetSummonedBy();
    if(summonedBy == nullptr)
        return nullptr;

    if (!IsValid(summonedBy.Character))
        return nullptr;

    return summonedBy;
}