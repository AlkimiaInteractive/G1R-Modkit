enum EPerceptionCharacterType
{
    None,
    CharacterOfInterest,
    SensedCharacter,
    Instigator,
    Target,
    SensedCharactersTarget,
    AffectedCharacter,
    Self,
    AllSensedHostiles,
    AllSensedEnemies,
    AllSensedNonTrainingHostiles
}

namespace FPerceptionCharacterType
{
    /** Returns the name of the role as string. */
    FString GetName(EPerceptionCharacterType CharacterType)
    {
        FString FullName = "" + CharacterType;

        int32 IndexColon = 0;
        int32 IndexSpace = 0;
        FullName.FindLastChar(':', IndexColon);
        FullName.FindChar(' ', IndexSpace);

        return FullName.Mid(IndexColon + 1, IndexSpace - IndexColon - 1);
    }
}

class UGothicAIEventResponse : UAIEventResponse
{
    /** Access to the base AI of this Response. */
    UGameplayAbility_CharacterAI_Gothic GetAI() const property
    {
        return Cast<UGameplayAbility_CharacterAI_Gothic>(OwningAIAbility);
    }

    FString GetDisplayName() const
    {
        FString DisplayName = Class.Name.ToString();
        DisplayName.RemoveFromStart("AIEventResponse_");

        return DisplayName;
    }    

    #if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGuiShortDesc() const
    {
        ImGui::Button(GetDisplayName());                      
    }

    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        ImGui::Text("Category: " + Category.ToString());
    }
    #endif

    void CheckAndRejoinParty(AGothicCharacterState TargetCharacter) const
    {
        if (TargetCharacter == nullptr)
            return;

        // Check memory of being in the party
        auto Memories = AI.CharacterState.LongTermMemory.GetLongTermMemoriesMatching(
            GameplayTag::Memory_WasInPartyBeforeConflict,
            AI.CharacterState, // Instigator (Self)
            TargetCharacter    // Affected (Target)
        );

        if (Memories.Num() > 0)
        {
             // Rejoin the party
             AI.CharacterState.JoinPartyOf(TargetCharacter);
             
             // Forget the memory
             FMemoryFilter Filter = AI.CharacterState.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_WasInPartyBeforeConflict)
                 .Affecting(TargetCharacter.CharacterGlobalId);
                 
             AI.CharacterState.LongTermMemory.ForgetEventsMatchingFilter(Filter);
        }
    }    

    void ForgetCombatMemories(AGothicCharacterState TargetCharacter) const
    {
        if (TargetCharacter == nullptr)
            return;

        // Forget intentional and unintentional hits
        FMemoryFilter Filter = AI.CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Combat_WasDamaged)
            .CausedBy(TargetCharacter.CharacterGlobalId);
            
        AI.CharacterState.LongTermMemory.ForgetEventsMatchingFilter(Filter);
    }
}

class UAIEventResponse_SingleTarget : UGothicAIEventResponse
{
    AGothicCharacterState TargetCharacterState(EPerceptionCharacterType TargetType, FRememberedPerception Perception) const
    {
        switch(TargetType)
        {
            case EPerceptionCharacterType::None:
                return nullptr;
            case EPerceptionCharacterType::Self:
                return AI.Self.CharacterState;
            case EPerceptionCharacterType::SensedCharacter:
                return Perception.Origin.CharacterState;
            case EPerceptionCharacterType::Instigator:
                return Perception.Instigator.CharacterState;
            case EPerceptionCharacterType::AffectedCharacter:
                return Perception.Affected.CharacterState;
            case EPerceptionCharacterType::Target:
                return Perception.Target.CharacterState;
            case EPerceptionCharacterType::CharacterOfInterest:
                return AI.CharacterOfInterest == nullptr ? nullptr : AI.CharacterOfInterest.CharacterState;
            case EPerceptionCharacterType::SensedCharactersTarget:
            {
                AGothicCharacterState ResultCharacterState = nullptr;
                UGameplayAbility_CharacterAI_Gothic OtherAI = nullptr;

                if (!Perception.Origin.Character.IsPlayerControlled())
                {
                    OtherAI = Perception.Origin.Character.GetGothicAI();
                }

                if (OtherAI != nullptr && OtherAI.CharacterOfInterest != nullptr)
                {
                    return OtherAI.CharacterOfInterest.CharacterState;
                }

                auto TargetedCharacter = Cast<AGothicCharacter>(Perception.Origin.Character.GetTargetedActor());

                if (TargetedCharacter != nullptr)
                    return TargetedCharacter.CharacterState;

                auto LookedAtCharacter = Perception.Origin.Character.GetCharacterThisCharacterIsLookingAt();

                if (LookedAtCharacter != nullptr)
                    return LookedAtCharacter.CharacterState;

                return nullptr;
            }
            default:
                return nullptr;
        }
    }
}

class UAIEventResponse_SingleTargetDetermined : UAIEventResponse_SingleTarget
{
    UPROPERTY()
    EPerceptionCharacterType TargetType = EPerceptionCharacterType::None;

    AGothicCharacterState GetTargetCharacterState(FRememberedPerception Perception) const
    {
        return TargetCharacterState(TargetType, Perception);
    }

    FString GetDisplayName() const override
    {
        if (TargetType == EPerceptionCharacterType::None)
            return Super::GetDisplayName();

        return Super::GetDisplayName() + " against " + FPerceptionCharacterType::GetName(TargetType);
    }
}

class UAIEventResponse_MultipleTarget : UGothicAIEventResponse
{
    UPROPERTY()
    EPerceptionCharacterType TargetType;

    TArray<AGothicCharacterState> TargetCharacterStates(FRememberedPerception Perception) const
    {
        return GetCharacterStatesFromCharacterType(TargetType, Perception);
    }

    TArray<AGothicCharacterState> GetCharacterStatesFromCharacterType(EPerceptionCharacterType CharacterType, FRememberedPerception Perception) const
    {
        auto CharacterStates = TArray<AGothicCharacterState>();
        switch(CharacterType)
        {
            case EPerceptionCharacterType::SensedCharacter:
            {
                CharacterStates.Add(Perception.Origin.CharacterState);
                break;
            }
            case EPerceptionCharacterType::Instigator:
                CharacterStates.Add(Perception.Instigator.CharacterState);
                break;
            case EPerceptionCharacterType::AffectedCharacter:
                CharacterStates.Add(Perception.Affected.CharacterState);
                break;
            case EPerceptionCharacterType::Target:
                CharacterStates.Add(Perception.Target.CharacterState);
                break;
            case EPerceptionCharacterType::CharacterOfInterest:
                CharacterStates.Add(AI.CharacterOfInterest.CharacterState);
                break;
            case EPerceptionCharacterType::SensedCharactersTarget:
            {
                if (!Perception.Origin.Character.IsPlayerControlled())
                {
                    if (Perception.Origin.Character == nullptr)
                        break;
                
                    auto OtherAI = Perception.Origin.Character.GetGothicAI();

                    if (OtherAI == nullptr)
                        break;

                    if (OtherAI.CharacterOfInterest == nullptr)
                        break;

                    CharacterStates.Add(OtherAI.CharacterOfInterest.CharacterState);
                    break;
                }
                else
                {
                    auto TargetedCharacter = Cast<AGothicCharacter>(Perception.Origin.Character.GetTargetedActor());

                    if (TargetedCharacter == nullptr)
                        break;

                    CharacterStates.Add(TargetedCharacter.CharacterState);
                    break;
                }
            }
            case EPerceptionCharacterType::AllSensedHostiles:
            {
                for (auto SensedHostileCharacter : AI.GetSensedLivingHostiles())
                {
                    CharacterStates.Add(SensedHostileCharacter.CharacterState);
                }
                break;
            }
            case EPerceptionCharacterType::AllSensedEnemies:
            {
                for (auto SensedEnemyCharacter : AI.GetSensedLivingEnemies())
                {
                    CharacterStates.Add(SensedEnemyCharacter.CharacterState);
                }
                break;
            }
            case EPerceptionCharacterType::AllSensedNonTrainingHostiles:
            {
                for (auto SensedHostileCharacter : AI.GetSensedLivingHostiles())
                {
                    if (AI.CharacterState.IsInTrainingFightAgainst(SensedHostileCharacter.CharacterState) ||
                        SensedHostileCharacter.CharacterState.IsInTrainingFightAgainst(AI.CharacterState))
                        continue;
                    
                    CharacterStates.Add(SensedHostileCharacter.CharacterState);
                }
                break;
            }
            case EPerceptionCharacterType::None:
            case EPerceptionCharacterType::Self:
                break;
        }

        return CharacterStates;
    }

    FString GetDisplayName() const override
    {
        if (TargetType == EPerceptionCharacterType::None)
            return Super::GetDisplayName();
        
        return Super::GetDisplayName() + " against " + FPerceptionCharacterType::GetName(TargetType);
    }
}

class UAIEventResponse_SwitchState : UAIEventResponse_SingleTargetDetermined
{
    default Category = GameplayTag::AIResponse_SwitchState;
    default bExecuteImmediately = true;

    UAIEventResponse_SwitchState(FGameplayTag _AIStateType, EPerceptionCharacterType _TargetType, bool b_TargetRequired = true, bool b_TargetIsPriority = false)
    {
        AIStateType = _AIStateType;
        TargetType = _TargetType;
        bTargetRequired = b_TargetRequired;
        bTargetIsPriority = b_TargetIsPriority;

        if (bTargetIsPriority)
        {
            bTargetRequired = true;
        }
    }

    UPROPERTY()
    private TSubclassOf<UAIState_PerceptionResponse> BaseNewStateClass;

    UPROPERTY()
    FGameplayTag AIStateType = FGameplayTag::Empty;

    UPROPERTY()
    bool bTargetRequired;

    UPROPERTY()
    bool bTargetIsPriority;

    UPROPERTY()
    FGameplayTagContainer Context;

    UPROPERTY()
    EConflictType ConflictType = EConflictType::None;

    FString GetDisplayName() const override
    {
        if (AIStateType == FGameplayTag::Empty)
            return Super::GetDisplayName() + " to Empty";

        if (AIStateType.MatchesTag(GameplayTag::AIState_DailyRoutine))
            return Super::GetDisplayName() + " to DailyRoutine";

        if (NewStateClass == nullptr)
            return Super::GetDisplayName() + " to nullptr";

        return Super::GetDisplayName() + " to " + Cast<UAIState_PerceptionResponse>(NewStateClass.Get().DefaultObject).GetDisplayName();
    }

    #if WITH_IMGUI    
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();
        
        if (Context.IsEmpty())
        {
            ImGui::Text("No Context");
            return;
        }

        ImGui::Text("Context: ");
        ImGui::Indent(5.0f);
        for (auto Tag : Context.GameplayTags)
        {
            ImGui::Text("- " + Tag);
        }
        ImGui::Unindent(5.0f);
    }
    #endif

    TSubclassOf<UAIState_PerceptionResponse> GetNewStateClass() const property
    {
        if (AIStateType.IsValid() && AI.States.Contains(AIStateType))
        {
            return AI.States[AIStateType];
        }

        return BaseNewStateClass;
    }
    
    AGothicCharacterState OtherCharacterState(FRememberedPerception Perception) const
    {
        return GetTargetCharacterState(Perception);
    }

    void PrepareNewState(UAIState_PerceptionResponse State, FGameplayTag AssessmentTag, FRememberedPerception Perception) const 
    {
        if (!State.IsA(UAIState_Conflict))
        {
            // Resetting Conflict Position 
            AI.InitialConflictPosition.Reset();
        }

        if (IsValid(State))
        {
            State.SetupRememberedPerception(AssessmentTag, Perception);
            
            FGameplayTagContainer NewContext = Context;
            for (auto Tag : Perception.EffectCauserTags.GameplayTags)
            {
                NewContext.AddTag(Tag);
            }

            if (AI.CharacterState.HasGameplayTag(GameplayTag::State_Ambush))
            {
                NewContext.AddTag(GameplayTag::State_Ambush);
            }

            State.Context = NewContext;
            State.InitialConflictType = ConflictType;
        }

        auto OtherCharcterState = OtherCharacterState(Perception);        
        if (IsValid(OtherCharcterState))
        {
            State.Other = OtherCharcterState.Character;
        }

        if (State.IsA(UAIState_Combat_G1R) && bTargetIsPriority)
        {
            AGothicCharacterState TargetCharacterState = GetTargetCharacterState(Perception);
            auto CombatState = Cast<UAIState_Combat_G1R>(State);
            if (TargetCharacterState != nullptr)
            {
                CombatState.PriorityTarget = TargetCharacterState.Character;
            }
        }

        AI.CharacterState.AbilitySystemComponent.GetOwnedGameplayTags(State.CharacterTagsBeforeStateSwitch);
    }

    UFUNCTION()
    bool IsPlayerInvolvedInPerception(FRememberedPerception Perception) const
    {
        TSet<AGothicCharacterState> EventCharacterStates;
        if (IsValid(Perception.Origin.CharacterState)) EventCharacterStates.Add(Perception.Origin.CharacterState);
        if (IsValid(Perception.Instigator.CharacterState)) EventCharacterStates.Add(Perception.Instigator.CharacterState);
        if (IsValid(Perception.Affected.CharacterState)) EventCharacterStates.Add(Perception.Affected.CharacterState);
        if (IsValid(Perception.Target.CharacterState)) EventCharacterStates.Add(Perception.Target.CharacterState);
        
        for (auto EventCharacterState : EventCharacterStates)
        {
            if (EventCharacterState.IsPlayerCharacter() || EventCharacterState.IsPlayerControlled())
                return true;

            auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
            if (EventCharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
                return true;

            auto SummonerCharacterState = EventCharacterState.SummonedBy();
            if (!IsValid(SummonerCharacterState))
                continue;

            if (SummonerCharacterState.IsPlayerCharacter() || SummonerCharacterState.IsPlayerControlled())
                return true;

            if (SummonerCharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
                return true;
        }

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {        
        if (!ShouldSwitchState(Perception))
            return;

        if (!IsValid(AI))
            return;

        if (!AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict) && AIStateType.MatchesTag(GameplayTag::AIState_Conflict))
        {
            // Remember conflict start
            FMemorizedEvent Event = FMemorizedEvent();
            Event.Position = AI.CharacterState.ActorLocation;
            Event.EventTags.AddTag(GameplayTag::Memory_Conflict_Start);

            if (IsPlayerInvolvedInPerception(Perception))
            {
                Event.EventTags.AddTag(GameplayTag::Character_Player);
            }        

            AI.CharacterState.LongTermMemory.MemorizeEvent(Event);
        }
        else if (AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict) && !AIStateType.MatchesTag(GameplayTag::AIState_Conflict))
        {
            // Remeber conflict end
            FMemorizedEvent Event = FMemorizedEvent();
            Event.Position = AI.CharacterState.ActorLocation;
            Event.EventTags.AddTag(GameplayTag::Memory_Conflict_End);
            AI.CharacterState.LongTermMemory.MemorizeEvent(Event);
        }

        if (AIStateType == GameplayTag::AIState_DailyRoutine)
        {
            AI.LeaveGroupsWithClass(UAIGroup_Warning_Base);
            AI.LeaveGroupsWithClass(UAIGroup_Search_Trespassing);
            AI.LeaveGroupsWithClass(UAIGroup_Attackers);
            AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);
            AI.UpdateCrimeSeverityTowardsPlayer();
            AI.SwitchToDailyRoutine();
            return;
        }

        if (NewStateClass == nullptr)
            return;

        if (AI.IsInState(NewStateClass))
            return;

        ManageStateEventGroup(Perception);
        
        auto StateTemplate = AI.CreateAIStateFromClass(NewStateClass);

        PrepareNewState(StateTemplate, AIEvent, Perception);

        AI.CharacterOfInterest = StateTemplate.Other;
        SwitchAIState(StateTemplate);
    }

    void ManageStateEventGroup(FRememberedPerception Perception) const
    {
        AGothicCharacterState Target = GetTargetCharacterState(Perception);
        AGothicCharacter TargetCharacter = nullptr;
        if (IsValid(Target))
        {
            TargetCharacter = Target.Character;
        }

        AI.LeaveGroupsWithClass(UAIGroup_StateEvent);

        auto NewStateDefaultObject = Cast<UGothicCharacterAIState>(NewStateClass.DefaultObject);
        if (NewStateDefaultObject.StateGroupClass != nullptr)
        {
            // Find available groups of the required class
            auto AvailableGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(NewStateDefaultObject.StateGroupClass);

            bool bJoinedGroup = false;

            for (auto Group : AvailableGroups)
            {
                UAIGroup_StateEvent StateEventGroup = Cast<UAIGroup_StateEvent>(Group);
                if (!IsValid(StateEventGroup) || (IsValid(Target) && !StateEventGroup.TargetedCharacterStates.Contains(Target)))
                    continue;

                if (StateEventGroup.IsCharacterAlreadyInGroup(AI.Character))
                {
                    bJoinedGroup = true;
                    break;
                }

                if (!StateEventGroup.IsCharacterAllowedToJoinForTarget(AI.Character, TargetCharacter))
                    return;
                
                AI.LeaveGroupsWithClass(UAIGroup_StateEvent);
                AI.JoinGroup(StateEventGroup);
                bJoinedGroup = true;
                break;
            }

            if (!bJoinedGroup)
            {
                auto NewGroup = Cast<UAIGroup_StateEvent>(AI.CreateAndJoinGroup(NewStateDefaultObject.StateGroupClass));

                if (IsValid(Target))
                {
                    NewGroup.SourceCharacterState = Target;
                    NewGroup.TargetedCharacterStates.Add(Target);
                }
            }
        }
    }

    void SwitchAIState(UAIState_PerceptionResponse StateTemplate) const
    {
        if (!IsValid(StateTemplate))
            return;

        switch (StateTemplate.SwitchAIStateMode)
        {
            case ESwitchAIStateMode::Interrupt:
            {
                // Interrupt current daily routine if template state doesn't cancel
                if (AI.IsDoingDailyRoutine() && IsValid(AI.DailyRoutineIfActive))
                {
                    AI.DailyRoutineIfActive.DoInterruptState(StateTemplate);
                    return;
                }

                AI.SwitchAIStateImmediately(StateTemplate);
                return;             
            }
            case ESwitchAIStateMode::EndState_Cancel:
            {
                 if (IsValid(AI.CurrentState) && !AI.CurrentState.IsA(UAIState_PerceptionResponse))
                 {
                      AI.CurrentState.EndTaskAsCancelled();
                 }
                            
                 AI.SwitchAIStateImmediately(StateTemplate);
                 return;
            }
            case ESwitchAIStateMode::EndState_DisallowGracefulExit:
            {
                AI.SwitchAIStateImmediately(StateTemplate);
                return;
            }
        }
    }

    bool ShouldSwitchState(FRememberedPerception Perception) const
    {
        AGothicCharacterState Other = nullptr;

        Other = OtherCharacterState(Perception);

        if (Other == nullptr && bTargetRequired && TargetType != EPerceptionCharacterType::None)
            return false;

        if (AIStateType.MatchesTag(GameplayTag::AIState_Conflict_Combat))
        {
            return true;
            // if (Other == nullptr)
            //     return false;

            // if (!AI.Self.Relationship.IsEnemyTowards(Other))
            //     return false;
        }

        return true;
    }

    UAIEventResponse_SwitchState AddContextTag(FGameplayTag Tag)
    {
        Context.AddTag(Tag);
        return this;
    }
}

class UAIEventResponse_SwitchStateWithConflictType : UAIEventResponse_SwitchState
{
    UAIEventResponse_SwitchStateWithConflictType(FGameplayTag _AIStateType, EPerceptionCharacterType _TargetType, EConflictType _ConflictType, bool b_TargetRequired = true, bool b_TargetIsPriority = false)
    {
        AIStateType = _AIStateType;
        ConflictType = _ConflictType;
        TargetType = _TargetType;
        bTargetRequired = b_TargetRequired;
        bTargetIsPriority = b_TargetIsPriority;

        if (bTargetIsPriority)
        {
            bTargetRequired = true;
        }
    }

    #if WITH_IMGUI    
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();

        ImGui::Text("Conflict Type: ");
        ImGui::SameLine();
        ImGui::Text(f"{ConflictType}");
    }
    #endif
}

class UAIEventResponse_NoStateSwitch : UGothicAIEventResponse
{
    default Category = GameplayTag::AIResponse_SwitchState;
}

class UAIEventResponse_DailyRoutineInterruptState : UGothicAIEventResponse
{
    UAIEventResponse_DailyRoutineInterruptState(UCharacterAIState _NewStateTemplate)
    {
        NewStateTemplate = _NewStateTemplate;
    }

    UAIEventResponse_DailyRoutineInterruptState(TSubclassOf<UCharacterAIState> _NewStateClass)
    {
        NewStateTemplate = Cast<UCharacterAIState>(_NewStateClass.Get().DefaultObject);
    }

    UPROPERTY()
    UCharacterAIState NewStateTemplate;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!AI.IsDoingDailyRoutine())
            return;
        
        
        AI.GetDailyRoutineIfActive().DoInterruptState(NewStateTemplate);
    }
}

class UAIState_Interrupt_InteractHere : UGothicCharacterSimulateableAIState
{
    UAIState_Interrupt_InteractHere(FGameplayTag _ActionTag)
    {
        ActionTag = _ActionTag;
    }

    UPROPERTY()
    FGameplayTag ActionTag;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.TryInteractionWithoutSpot(ActionTag);
    }
}

class UAIEventResponse_DailyRoutineInterruptInteractHere : UGothicAIEventResponse
{
    UAIEventResponse_DailyRoutineInterruptInteractHere(FGameplayTag _ActionTag)
    {
        ActionTag = _ActionTag;
    }

    UPROPERTY()
    FGameplayTag ActionTag;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!AI.IsDoingDailyRoutine())
            return;

        AI.GetDailyRoutineIfActive().DoInterruptState(UAIState_Interrupt_InteractHere(ActionTag));
    }
}

// --- Specialized responses ----------------------------------------------------------------------

class UAIEventResponse_Modifier : UAIEventResponse_MultipleTarget
{
    default bExecuteImmediately = true;
    
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        for (auto CharacterState : TargetCharacterStates(Perception))
        {
            if (CharacterState == nullptr)
                continue;

            UseModifierTargetingCharacter(CharacterState);
        }
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const
    {
        return true;
    }
}

UCLASS(Abstract)
class UAIEventResponse_RemoveModifiers_Targetless : UAIEventResponse_Modifier
{
    TArray<TSubclassOf<UActivePersonalRelationshipModifier_SingleCharacter>> ModifierClassesToRemove;

    void RemoveModifiers() const
    {
        TArray<UActivePersonalRelationshipModifier> ToDiscard;

        if (!IsValid(AI.Character))
            return;

        for (auto Modifier : AI.Character.Relationship.ActivePersonalModifiers)
        {
            if (!ModifierClassesToRemoveContainsClassOf(Modifier))
                continue;

            ToDiscard.Add(Modifier);
        }

        for (auto Modifier : ToDiscard)
        {
            Modifier.Discard();
        }
    }

    bool ModifierClassesToRemoveContainsClassOf(UActivePersonalRelationshipModifier Modifier) const
    {
        if (!IsValid(Modifier))
            return false;

        for (auto ModifierClass : ModifierClassesToRemove)
        {
            if (Modifier.IsA(ModifierClass))
                return true;
        }

        return false;
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        RemoveModifiers();       
    }
}

UCLASS(Abstract)
class UAIEventResponse_RemoveSingleCharacterModifier : UAIEventResponse_Modifier
{
    TArray<TSubclassOf<UActivePersonalRelationshipModifier_SingleCharacter>> ModifierClassesToRemove;

    bool RemoveModifiersTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        TArray<UActivePersonalRelationshipModifier> ToDiscard;
        bool bRemovedAny = false;

        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!ModifierClassesToRemoveContainsClassOf(Modifier))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_SingleCharacter>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            ToDiscard.Add(Modifier);
        }

        for (auto Modifier : ToDiscard)
        {
            Modifier.Discard();
            bRemovedAny = true;
        }

        return bRemovedAny;
    }

    bool ModifierClassesToRemoveContainsClassOf(UActivePersonalRelationshipModifier Modifier) const
    {
        for (auto ModifierClass : ModifierClassesToRemove)
        {
            if (Modifier.IsA(ModifierClass))
                return true;
        }

        return false;
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return RemoveModifiersTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_RemoveEnemyModifier : UAIEventResponse_RemoveSingleCharacterModifier
{
    default ModifierClassesToRemove.Add(UActivePersonalRelationshipModifier_Enemy);

    UAIEventResponse_RemoveEnemyModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }
}

class UAIEventResponse_RemoveTrainingModifier : UAIEventResponse_RemoveSingleCharacterModifier
{
    default ModifierClassesToRemove.Add(UActivePersonalRelationshipModifier_Enemy_Training);

    UAIEventResponse_RemoveTrainingModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_RemoveTrainingModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }
}

class UAIEventResponse_RemoveAllEnemyModifiers : UAIEventResponse_RemoveModifiers_Targetless
{
    default ModifierClassesToRemove.Add(UActivePersonalRelationshipModifier_Enemy);
}

class UAIEventResponse_RemoveAllTrainingModifiers : UAIEventResponse_RemoveModifiers_Targetless
{
    default ModifierClassesToRemove.Add(UActivePersonalRelationshipModifier_Enemy_Training);
}

class UAIEventResponse_AddHostileModifier : UAIEventResponse_Modifier
{
    UAIEventResponse_AddHostileModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddHostileModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddHostileModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_Enemy) && 
                !Modifier.IsA(UActivePersonalRelationshipModifier_Hostile))
                continue;

            if (Modifier.IsA(UActivePersonalRelationshipModifier_Enemy) &&
                Cast<UActivePersonalRelationshipModifier_Enemy>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            if (Modifier.IsA(UActivePersonalRelationshipModifier_Hostile) &&
                Cast<UActivePersonalRelationshipModifier_Hostile>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Hostile(TargetedCharacterState));
        return true;
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return AddHostileModifierTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_AddEnemyModifier : UAIEventResponse_Modifier
{
    UAIEventResponse_AddEnemyModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddEnemyModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_Enemy))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_Enemy>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Enemy(TargetedCharacterState));
        return true;
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return AddEnemyModifierTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_AddEnemyModifierTraining : UAIEventResponse_AddEnemyModifier
{
    UAIEventResponse_AddEnemyModifierTraining()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddEnemyModifierTraining(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddEnemyModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const override
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_Enemy_Training))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_Enemy_Training>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Enemy_Training(TargetedCharacterState));
        return true;  
    }
}

class UAIEventResponse_AddAngryModifier : UAIEventResponse_Modifier
{
    UAIEventResponse_AddAngryModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddAngryModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddAngryModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_AngryToCharacter))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_AngryToCharacter>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_AngryToCharacter(TargetedCharacterState));
        return true; 
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return AddAngryModifierTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_AddExecuteModifier : UAIEventResponse_Modifier
{
    UAIEventResponse_AddExecuteModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddAngryModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_ExecuteCharacter))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_ExecuteCharacter>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_ExecuteCharacter(TargetedCharacterState));
        return true; 
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return AddAngryModifierTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_AddLootModifier : UAIEventResponse_Modifier
{
    UAIEventResponse_AddLootModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddLootModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddAngryModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_LootCharacter))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_LootCharacter>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_LootCharacter(TargetedCharacterState));
        return true; 
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return AddAngryModifierTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_AddUseFistsModifier : UAIEventResponse_Modifier
{
    UAIEventResponse_AddUseFistsModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    bool AddModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_UseFists))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_UseFists>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_UseFists(TargetedCharacterState));
        return true; 
    }

    bool UseModifierTargetingCharacter(AGothicCharacterState CharacterState) const override
    {
        return AddModifierTargetingCharacter(CharacterState);
    }
}

class UAIEventResponse_RemoveAllUseFistsModifiers : UAIEventResponse_RemoveModifiers_Targetless
{
    default ModifierClassesToRemove.Add(UActivePersonalRelationshipModifier_UseFists);
}

class UAIEventResponse_RemoveUseFistsModifier : UAIEventResponse_RemoveSingleCharacterModifier
{
    default ModifierClassesToRemove.Add(UActivePersonalRelationshipModifier_UseFists);

    UAIEventResponse_RemoveUseFistsModifier()
    {
        TargetType = EPerceptionCharacterType::None;
    }

    UAIEventResponse_RemoveUseFistsModifier(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }
}

class UAIEventResponse_ForceAwarenessOfCharacter : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense _Sense, EPerceptionCharacterType _TargetType)
    {
        Sense = _Sense;
        TargetType = _TargetType;
    }

    UPROPERTY()
    EPerceptionSense Sense = EPerceptionSense::None;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AGothicCharacterState Target = GetTargetCharacterState(Perception);
        if (Target == nullptr)
            return;

        if (!IsValid(AI.Character))
            return;

        AI.Character.Perception.SetAwarenessToCharacter(Target.Character, Sense, 100.0f);
    }
}

class UAIEventResponse_AssessEnemiesAndHostilesAround : UGothicAIEventResponse
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AI.AssessHostilesAndEnemiesAround(Perception);
    }
}

///////////////////////////
// VOICE REACTION RESPONSE
///////////////////////////
class UAIEventResponse_VoiceReaction : UAIEventResponse_SingleTarget
{
    UAIEventResponse_VoiceReaction(bool b_CancelCurrentSpeech)
    {
        bCancelCurrentSpeech = b_CancelCurrentSpeech;
    }

    UAIEventResponse_VoiceReaction(FGameplayTag VoiceReactionTag, EPerceptionCharacterType Target = EPerceptionCharacterType::None, bool b_CancelCurrentSpeech = true)
    {
        bCancelCurrentSpeech = b_CancelCurrentSpeech;
        VoiceReactionTreeDataArray.Add(UVoiceReactionTreeNodeData(this, FVoiceReactionData(VoiceReactionTag, Target)));
    }

    UPROPERTY()
    TArray<UVoiceReactionTreeNodeData> VoiceReactionTreeDataArray;

    UPROPERTY()
    FGenericVoicelineRequestContext VoicelineContext;

    UPROPERTY()
    bool bCancelCurrentSpeech = true;

    UFUNCTION()
    UAIEventResponse_VoiceReaction AddContextTagToSpeaker(FGameplayTag Tag)
    {
        VoicelineContext.TagsMe.AddTag(Tag);
        return this;
    }

    UFUNCTION()
    UAIEventResponse_VoiceReaction AddContextTagToTarget(FGameplayTag Tag)
    {
        VoicelineContext.TagsOther.AddTag(Tag);
        return this;
    }

    UFUNCTION()
    UVoiceReactionTreeNodeData AddReaction(FGameplayTag VoiceReactionTag, EPerceptionCharacterType TargetCharacterType = EPerceptionCharacterType::None)
    {
        UVoiceReactionTreeNodeData VoiceReactionTreeNodeData = UVoiceReactionTreeNodeData(this, FVoiceReactionData(VoiceReactionTag, TargetCharacterType));
        VoiceReactionTreeDataArray.Add(VoiceReactionTreeNodeData);

        return VoiceReactionTreeDataArray.Last();
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        FGenericVoicelineRequestContext FinalVoicelineContext = VoicelineContext;

        for (FGameplayTag ContextTag : Perception.ContextTags.GameplayTags)
        {
            if (ContextTag.MatchesTag(GameplayTag::VoicelineContext))
                continue;

            FinalVoicelineContext.TagsOther.AddTag(ContextTag);
        }

        if (!IsValid(AI.Character) || AI.Character.HasGameplayTag(GameplayTag::Debuff_Paralyzed))
            return;

        if (VoiceReactionTreeDataArray.IsEmpty())
            return;

        if (bCancelCurrentSpeech && AI.CharacterState.IsSpeaking())
            return;

        // TODO: Clear any existing queue
        TArray<UVoiceReactionTreeNode> Options;
        
        for (auto VoiceTreeNodeData : VoiceReactionTreeDataArray)
        {
            UVoiceReactionTreeNode LocalVoiceReactionTreeNode = UVoiceReactionTreeNode(VoiceTreeNodeData);
            LocalVoiceReactionTreeNode.SetCharacter(Perception);

            Options.Add(LocalVoiceReactionTreeNode);
        }

        TArray<FGameplayTag> VoicelinesToEnqueue;

        AGothicCharacter PlaceHolderTargetCharacter = nullptr;


        // Queue continues as long as the current node has existing next options
        // A single option is executed at each level

        while (!Options.IsEmpty())
        {
            TArray<UVoiceReactionTreeNode> SayableOptions;

            // Check options until one can be said
            for (auto VoiceReactionTreeNode : Options)
            {
                UVoiceReactionHandle VoiceReactionHandle = VoiceReactionTreeNode.VoiceReactionHandle;

                // If tag invalid, check next option
                if (!VoiceReactionHandle.Data.Tag.IsValid())
                    continue;

                // If character has no voiceline for tag, check next option
                if (!AI.CharacterState.Voiceline.HasVoicelineFor(VoiceReactionHandle.Data.Tag, OptionalOther = VoiceReactionHandle.TargetCharacter))
                    continue;

                // IF any condition fails, check next option
                // bool bConditionsPassed = true;
                // for (auto Condition : VoiceReactionTreeNode.Conditions)
                // {
                //     Condition.Data.SituationClass.AI = AI;

                //     if (Condition.Data.SituationClass.IsInSituation())
                //         continue;
                    
                //     bConditionsPassed = false;
                //     break;
                // }
                // if (!bConditionsPassed)
                //     continue;

                SayableOptions.Add(VoiceReactionTreeNode);
                break;
            }

            if (SayableOptions.IsEmpty())
                break;

            int Index = 0;
            int Size = SayableOptions.Num();
            if (Size > 1)
            {
                Index = Math::RandRange(0, Size - 1);
            }

            auto OptionToSay = SayableOptions[Index];
            UVoiceReactionHandle VoiceReactionHandle = OptionToSay.VoiceReactionHandle;
            AGothicCharacter TargetCharacter = VoiceReactionHandle.TargetCharacter != nullptr ? VoiceReactionHandle.TargetCharacter.Character : nullptr;
            // TODO: Use target
            // TODO: Use loudness

            PlaceHolderTargetCharacter = PlaceHolderTargetCharacter == nullptr ? TargetCharacter : PlaceHolderTargetCharacter;

            VoicelinesToEnqueue.Add(VoiceReactionHandle.Data.Tag);

            // Set next options after used option
            Options = OptionToSay.Next;
        }

        if (VoicelinesToEnqueue.IsEmpty())
            return;

        if (PlaceHolderTargetCharacter == nullptr)
        {
            PlaceHolderTargetCharacter = AI.Self;
        }

        // Finish speaking before ending the state        
        AI.CharacterState.Voiceline.SayMultipleVoicelinesWithContext(VoicelinesToEnqueue, PlaceHolderTargetCharacter.CharacterState, VoicelineContext, EPerceptionNoiseLoudness::Loud);
    }

    FString GetDisplayName() const override
    {
        return Super::GetDisplayName();
    }

    #if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();
        
        ImGui::Text(" ");
        ImGui::Text("Voice Line Queue:");

        for (auto Node : VoiceReactionTreeDataArray)
        {
            Node.DrawImGui();
        }

        ImGui::Text("With Context:");
        ImGui::Indent(10.0f);
        
        ImGui::Text("{Self}");
        ImGui::Indent(10.0f);

        bool bAnyMe = false;
        for (auto Tag : VoicelineContext.TagsMe.GameplayTags)
        {
            ImGui::Text(f"- {Tag}");
            bAnyMe = true;
        }

        if (!bAnyMe)
        {
            ImGui::Text("(No Context)");
        }
        ImGui::Unindent(10.0f);

        ImGui::Text("{Other}");
        ImGui::Indent(10.0f);

        bool bAnyOther = false;
        for (auto Tag : VoicelineContext.TagsOther.GameplayTags)
        {
            ImGui::Text(f"- {Tag}");
            bAnyOther = true;
        }

        if (!bAnyOther)
        {
            ImGui::Text("(No Context)");
        }
        ImGui::Unindent(10.0f);

        ImGui::Unindent(10.0f);
    }
    #endif
}

USTRUCT()
struct FVoiceReactionData
{
    FVoiceReactionData(FGameplayTag InTag, EPerceptionCharacterType InTargetType)
    {
        Tag = InTag;
        TargetType = InTargetType;
    }

    UPROPERTY()
    FGameplayTag Tag;

    UPROPERTY()
    EPerceptionCharacterType TargetType;
}

UCLASS()
class UVoiceReactionHandle
{
    UVoiceReactionHandle(const UAIEventResponse_VoiceReaction Response, FVoiceReactionData ReactionData)
    {
        ParentResponse = Response;
        Data = ReactionData;
    }

    UPROPERTY()
    const UAIEventResponse_VoiceReaction ParentResponse;

    UPROPERTY()
    FVoiceReactionData Data;

    UPROPERTY()
    AGothicCharacterState TargetCharacter;

    UFUNCTION()
    void SetCharacter(FRememberedPerception Perception)
    {
        TargetCharacter = ParentResponse.TargetCharacterState(Data.TargetType, Perception);
    }
}

USTRUCT()
struct FVoiceReactionSituationData
{
    FVoiceReactionSituationData(USS_CharacterCheck StateSituation, EPerceptionCharacterType InCharacterToCheckType)
    {
        Situation = StateSituation;
        CharacterToCheckType = InCharacterToCheckType;
    }

    FVoiceReactionSituationData(UFightAI_StateSituation StateSituation)
    {
        Situation = StateSituation;
    }

    UPROPERTY()
    UFightAI_StateSituation Situation;

    UPROPERTY()
    EPerceptionCharacterType CharacterToCheckType = EPerceptionCharacterType::None;
}

UCLASS()
class UVoiceReactionSituationHandle
{
    UVoiceReactionSituationHandle(const UAIEventResponse_VoiceReaction Response, FVoiceReactionSituationData SituationData)
    {
        ParentResponse = Response;
        Data = SituationData;
    }

    UPROPERTY()
    const UAIEventResponse_VoiceReaction ParentResponse;

    UPROPERTY()
    AGothicCharacterState CharacterToCheck;

    UPROPERTY()
    FVoiceReactionSituationData Data;

    UFUNCTION()
    void SetCharacter(FRememberedPerception Perception)
    {
        if (Data.CharacterToCheckType == EPerceptionCharacterType::None)
            return;

        CharacterToCheck = ParentResponse.TargetCharacterState(Data.CharacterToCheckType, Perception);
    }
}

UCLASS()
class UVoiceReactionTreeNodeData
{
    UVoiceReactionTreeNodeData(const UAIEventResponse_VoiceReaction Response, FVoiceReactionData VoiceReactionData)
    {
        Data = VoiceReactionData;
        ParentResponse = Response;
    }

    UVoiceReactionTreeNodeData(const UAIEventResponse_VoiceReaction Response, UVoiceReactionTreeNodeData TreeNodeData, FVoiceReactionData VoiceReactionData)
    {
        Data = VoiceReactionData;
        ParentResponse = Response;
        ParentTreeNodeData = TreeNodeData;
    }
    
    UPROPERTY()
    const UAIEventResponse_VoiceReaction ParentResponse;

    UPROPERTY()
    UVoiceReactionTreeNodeData ParentTreeNodeData;

    UPROPERTY()
    FVoiceReactionData Data;

    UPROPERTY()    
    TArray<FVoiceReactionSituationData> Conditions;

    UPROPERTY()
    TArray<UVoiceReactionTreeNodeData> Next;

    UVoiceReactionTreeNodeData AddReaction(FGameplayTag VoiceReactionTag, EPerceptionCharacterType TargetCharacterType = EPerceptionCharacterType::None)
    {
        UVoiceReactionTreeNodeData VoiceReactionTreeNodeData = UVoiceReactionTreeNodeData(ParentResponse, this, FVoiceReactionData(VoiceReactionTag, TargetCharacterType));
        Next.Add(VoiceReactionTreeNodeData);

        return Next.Last();
    }

    UVoiceReactionTreeNodeData BackNode() const
    {
        return ParentTreeNodeData;
    }

    const UAIEventResponse_VoiceReaction BackToResponse() const
    {
        return ParentResponse;
    }

    UVoiceReactionTreeNodeData AddCondition(UFightAI_StateSituation Situation)
    {
        Conditions.Add(FVoiceReactionSituationData(Situation));
        return this;
    }

    UVoiceReactionTreeNodeData AddCondition(USS_CharacterCheck Situation, EPerceptionCharacterType CharacterToCheckType)
    {
        Conditions.Add(FVoiceReactionSituationData(Situation, CharacterToCheckType));
        return this;
    }

    #if WITH_IMGUI
    void DrawImGui()
    {
        if (Data.TargetType == EPerceptionCharacterType::None)
        {
            ImGui::Text(" - " + Data.Tag.TagName);
        }
        else
        {
            ImGui::Text(" - " + Data.Tag.TagName + " at " + FPerceptionCharacterType::GetName(Data.TargetType));
        }

        for (auto NextNodeData : Next)
        {
            NextNodeData.DrawImGui();
        }            
    }
    #endif
}

UCLASS()
class UVoiceReactionTreeNode
{
    UVoiceReactionTreeNode(UVoiceReactionTreeNodeData TreeNodeData)
    {
        VoiceReactionHandle = UVoiceReactionHandle(TreeNodeData.ParentResponse, TreeNodeData.Data);
        for (auto Condition : TreeNodeData.Conditions)
        {
            Conditions.Add(UVoiceReactionSituationHandle(TreeNodeData.ParentResponse, Condition));
        }

        for (auto NextNodeData : TreeNodeData.Next)
        {
            Next.Add(UVoiceReactionTreeNode(NextNodeData));
        }
    }

    UPROPERTY()
    UVoiceReactionHandle VoiceReactionHandle;

    UPROPERTY()    
    TArray<UVoiceReactionSituationHandle> Conditions;

    UPROPERTY()
    TArray<UVoiceReactionTreeNode> Next;

    void SetCharacter(FRememberedPerception Perception)
    {
        VoiceReactionHandle.SetCharacter(Perception);

        for (auto Condition : Conditions)
        {
            Condition.SetCharacter(Perception);
        }

        for (auto Node : Next)
        {
            Node.SetCharacter(Perception);
        }
    }
}

////////////////////////////////
// PARTY
////////////////////////////////

// LeavePartyOf

UCLASS()
class UAIEventResponse_LeavePartyOf : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_LeavePartyOf(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    void LeavePartyOf(AGothicCharacterState TargetCharacter) const
    {
        if (TargetCharacter == nullptr)
            return;

        if (AI.CharacterState.IsInPartyWith(TargetCharacter))
        {
             AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(
                 GameplayTag::Memory_WasInPartyBeforeConflict,
                 TargetCharacter, 
                 AI.CharacterState
             );
        }

        AI.CharacterState.LeavePartyOf(TargetCharacter);        
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        LeavePartyOf(GetTargetCharacterState(Perception));
    }
}

/** When this NPC sees a character return to human (transform end on other), forgets Memory_WitnessedTransformation. */
UCLASS()
class UAIEventResponse_ForgetWitnessedTransformation : UGothicAIEventResponse
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!IsValid(Perception.Origin.Character) || !IsValid(AI.CharacterState))
            return;
        AGothicCharacterState CasterState = nullptr;
        if (IsValid(Perception.Instigator.Character) && IsValid(Perception.Instigator.CharacterState))
            CasterState = Perception.Instigator.CharacterState;
        if (CasterState == nullptr)
        {
            AGothicCharacter CasterCharacter = Cast<AGothicCharacter>(Perception.Origin.Character.GetActorInstigator());
            if (IsValid(CasterCharacter) && IsValid(CasterCharacter.CharacterState))
                CasterState = CasterCharacter.CharacterState;
        }
        if (CasterState == nullptr)
            return;
        FMemoryFilter Filter = AI.CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_WitnessedTransformation)
            .CausedBy(CasterState.CharacterGlobalId);
        AI.CharacterState.LongTermMemory.ForgetEventsMatchingFilter(Filter);
    }
}

/** When this NPC sees a transform, memorizes that the caster (Hero) was witnessed transforming, so we can stay friendly to the beast. Skips write if already memorized. */
UCLASS()
class UAIEventResponse_MemorizeWitnessedTransformation : UGothicAIEventResponse
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!IsValid(Perception.Origin.Character) || !IsValid(AI.CharacterState))
            return;
        // Caster: from perception Instigator or from Origin's instigator (transform end: Origin = wolf, GetActorInstigator = Hero).
        AGothicCharacterState CasterState = nullptr;
        if (IsValid(Perception.Instigator.Character) && IsValid(Perception.Instigator.CharacterState))
            CasterState = Perception.Instigator.CharacterState;
        if (CasterState == nullptr)
        {
            AGothicCharacter CasterCharacter = Cast<AGothicCharacter>(Perception.Origin.Character.GetActorInstigator());
            if (IsValid(CasterCharacter) && IsValid(CasterCharacter.CharacterState))
                CasterState = CasterCharacter.CharacterState;
        }
        if (CasterState == nullptr)
            return;
        if (AI.CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_WitnessedTransformation)
                .CausedBy(CasterState.CharacterGlobalId)
                .Count >= 1)
            return;
        AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(
            GameplayTag::Memory_WitnessedTransformation,
            AI.CharacterState,
            CasterState
        );
    }
}

/** When instigator is transformed (e.g. wolf), leaves party of the caster (e.g. Hero). */
UCLASS()
class UAIEventResponse_LeavePartyOfInstigatorCaster : UGothicAIEventResponse
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!IsValid(Perception.Instigator.Character))
            return;
        AGothicCharacter CasterCharacter = Cast<AGothicCharacter>(Perception.Instigator.Character.GetActorInstigator());
        if (!IsValid(CasterCharacter) || !IsValid(CasterCharacter.CharacterState))
            return;
        AGothicCharacterState CasterState = CasterCharacter.CharacterState;
        if (AI.CharacterState.IsInPartyWith(CasterState))
        {
            AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(
                GameplayTag::Memory_WasInPartyBeforeConflict,
                CasterState,
                AI.CharacterState
            );
        }
        AI.CharacterState.LeavePartyOf(CasterState);
    }
}

UCLASS()
class UAIEventResponse_JoinPartyOf : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_JoinPartyOf(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    void JoinPartyOf(AGothicCharacterState TargetCharacter) const
    {
        if (TargetCharacter == nullptr)
            return;

        AI.CharacterState.JoinPartyOf(TargetCharacter);        
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        JoinPartyOf(GetTargetCharacterState(Perception));
    }
}

///////////////////////
// LONG TERM MEMORY
//////////////////////

class UAIEventResponse_RememberForgiving : UAIEventResponse_MultipleTarget
{
    UAIEventResponse_RememberForgiving(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        for (auto CharacterState : TargetCharacterStates(Perception))
        {
            AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Combat_Forgive, CharacterState, AI.CharacterState);
        }
    }
}

///////////////////////////
// PRIORITY TARGET
///////////////////////////

class UAIEventResponse_SetCombatPriorityTarget : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_SetCombatPriorityTarget(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AGothicCharacterState TargetCharacterState = GetTargetCharacterState(Perception);
        if (TargetCharacterState == nullptr)
            return;

        auto CombatState = Cast<UAIState_Combat_G1R>(AI.CurrentRootState);
        if (CombatState == nullptr)
            return;

        CombatState.PriorityTarget = TargetCharacterState.Character;
    }
}

/////////////////////////
// CHECK CHARACTERS
/////////////////////////


class UAIEventResponse_CheckHostilesOrEnemiesSensed : UGothicAIEventResponse
{
    default Category = GameplayTag::AIResponse_CheckHostilesOrEnemiesSensed;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AI.CheckAnyHostilesOrEnemiesSensed(Perception);
    }
}


//////////////////////////
// CRIME
//////////////////////////
UCLASS(Abstract)
class UAIEventResponse_UpdateAllCrimesOfType : UAIEventResponse_SingleTargetDetermined
{
    UPROPERTY()
    FGameplayTag CrimeTypeTag;

    #if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();
        
        ImGui::Text(" ");
        ImGui::Text("CrimeType: " + CrimeTypeTag.TagName);
    }
    #endif
}

class UAIEventResponse_ForgiveAllCrimesOfTypeRelevantToSelf : UAIEventResponse_UpdateAllCrimesOfType
{
    UAIEventResponse_ForgiveAllCrimesOfTypeRelevantToSelf(EPerceptionCharacterType CriminalType, FGameplayTag CrimeType)
    {
        TargetType = CriminalType;
        CrimeTypeTag = CrimeType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;

        if (!CrimeTypeTag.IsValid())
            return;

        AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, CriminalCharacterState, CrimeTypeTag);
        
        CheckAndRejoinParty(CriminalCharacterState);
        ForgetCombatMemories(CriminalCharacterState);
    }
}

class UAIEventResponse_SuppressAllCrimesOfType : UAIEventResponse_UpdateAllCrimesOfType
{
    UAIEventResponse_SuppressAllCrimesOfType(EPerceptionCharacterType CriminalType, FGameplayTag CrimeType)
    {
        TargetType = CriminalType;
        CrimeTypeTag = CrimeType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;

        if (!CrimeTypeTag.IsValid())
            return;

        AI.CrimeProcessingSubsystem.SuppressWitnessRelativeCrimes(AI.CharacterState, CriminalCharacterState, CrimeTypeTag);
    }
}

class UAIEventResponse_ForgiveAllCrimesRelevantToSelf : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_ForgiveAllCrimesRelevantToSelf(EPerceptionCharacterType CriminalType)
    {
        TargetType = CriminalType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;

        AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, CriminalCharacterState, FGameplayTag::Empty, false, bSkipTheftAndPickpocketSuccessForLootReclaim = true);
        
        CheckAndRejoinParty(CriminalCharacterState);
        ForgetCombatMemories(CriminalCharacterState);
    }
}

class UAIEventResponse_SuppressAllCrimes : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_SuppressAllCrimes(EPerceptionCharacterType CriminalType)
    {
        TargetType = CriminalType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;

        AI.CrimeProcessingSubsystem.SuppressWitnessRelativeCrimes(AI.CharacterState, CriminalCharacterState);
    }
}

UCLASS(Abstract)
class UAIEventResponse_UpdateLastCrimeOfType : UAIEventResponse_SingleTargetDetermined
{
    UPROPERTY()
    FGameplayTag CrimeTypeTag;

    #if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();
        
        ImGui::Text(" ");
        ImGui::Text("CrimeType: " + CrimeTypeTag.TagName);
    }
    #endif
}

class UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf : UAIEventResponse_UpdateLastCrimeOfType
{
    UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType CriminalType, FGameplayTag CrimeType)
    {
        TargetType = CriminalType;
        CrimeTypeTag = CrimeType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;

        if (!CrimeTypeTag.IsValid())
            return;

        AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, CriminalCharacterState, CrimeTypeTag, bLatestOnly = true);

        CheckAndRejoinParty(CriminalCharacterState);
        ForgetCombatMemories(CriminalCharacterState);
    }
}

class UAIEventResponse_SuppressLastCrimeOfType : UAIEventResponse_UpdateLastCrimeOfType
{
    UAIEventResponse_SuppressLastCrimeOfType(EPerceptionCharacterType CriminalType, FGameplayTag CrimeType = FGameplayTag::Empty)
    {
        TargetType = CriminalType;
        CrimeTypeTag = CrimeType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;
        
        if (!CrimeTypeTag.IsValid())
            return;
        
        AI.CrimeProcessingSubsystem.SuppressWitnessRelativeCrimes(AI.CharacterState, CriminalCharacterState, CrimeTypeTag, bLatestOnly = true);
    }
}

class UAIEventResponse_ForgetAllCrimesOfType : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType CriminalType, FGameplayTag CrimeType)
    {
        TargetType = CriminalType;
        CrimeTypeTag = CrimeType;
    }

    UPROPERTY()
    FGameplayTag CrimeTypeTag;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CriminalCharacterState = GetTargetCharacterState(Perception);
        if (!IsValid(CriminalCharacterState))
            return;

        if (!CrimeTypeTag.IsValid())
            return;
        
        AI.CrimeProcessingSubsystem.ForgetCrimes(CriminalCharacterState, CrimeTypeTag);
    }

    #if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();
        
        ImGui::Text(" ");
        ImGui::Text("CrimeType: " + CrimeTypeTag.TagName);
    }
    #endif
}

// class UAIEventResponse_ForgetLastCrimeOfType : UAIEventResponse_SingleTarget
// {
//     UAIEventResponse_ForgetLastCrimeOfType(EPerceptionCharacterType CriminalType, FGameplayTag CrimeType, EPerceptionCharacterType AffectedType = EPerceptionCharacterType::None)
//     {
//         CriminalCharacterType = CriminalType;
//         CrimeTypeTag = CrimeType;
//         AffectedCharacterType = AffectedType;
//     }

//     UPROPERTY()
//     FGameplayTag CrimeTypeTag;

//     UPROPERTY()
//     EPerceptionCharacterType CriminalCharacterType;

//     UPROPERTY()
//     EPerceptionCharacterType AffectedCharacterType;

//     UFUNCTION(BlueprintOverride)
//     void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
//     {
//         AGothicCharacterState CriminalCharacterState = TargetCharacterState(CriminalCharacterType, Perception);

//         if (!IsValid(CriminalCharacterState))
//             return;

//         if (!CrimeTypeTag.IsValid())
//             return;
        
//         AI.CrimeProcessingSubsystem.ForgetCrimes(CriminalCharacterState, CrimeTypeTag, bLatestOnly = true);
//     }
// }

class UAIEventResponse_SyncronizeMemorizedCrimes : UAIEventResponse_SingleTarget
{
    UAIEventResponse_SyncronizeMemorizedCrimes( EPerceptionCharacterType Source)
    {
        SourceCharacterType = Source;
    }

    UPROPERTY()
    EPerceptionCharacterType SourceCharacterType = EPerceptionCharacterType::None;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (SourceCharacterType == EPerceptionCharacterType::None)
            return;

        AGothicCharacterState SourceCharacterState = TargetCharacterState(SourceCharacterType, Perception);

        AI.CrimeProcessingSubsystem.SynchronizeRelativeCrimesFromSource(AI.CharacterState, SourceCharacterState);
    }
}

UCLASS(Abstract)
class UAIEventResponse_AlertVictimOfCrime : UGothicAIEventResponse
{
    UPROPERTY()
    FGameplayTag CrimeAlertEventTag;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!AIEvent.MatchesTag(GameplayTag::Crime))
            return;

        auto Victim = Perception.Affected.Character;
        auto Thief = Perception.Instigator.Character;

        if (Victim == nullptr)
            return;

        /// Alert the victim
        
        // Force victim hearing awareness towards us
        auto VictimAI = Victim.GetCharacterAI();

        if (VictimAI != nullptr)
        {
            VictimAI.ForceHearingPerception(AI.CharacterState);
        }

        ///////////////////////////////
        //  PLACEHOLDER
        ///////////////////////////////

        // Bypass victim perception system for testing
        FRememberedPerception FakePerception;

        FakePerception.EventTag = CrimeAlertEventTag;
        FakePerception.Origin.Character = AI.Self;
        FakePerception.Target.Character = Victim;
        FakePerception.Instigator.Character = Thief;
        FakePerception.Affected.Character = Victim;

        VictimAI.AssessEvent(CrimeAlertEventTag, FakePerception);

        /////////////////////////////////
        /////////////////////////////////
    }
}

class UAIEventResponse_AlertVictimOfPickpocketing : UAIEventResponse_AlertVictimOfCrime
{
    default CrimeAlertEventTag = GameplayTag::AIEvent_Heard_Alert_Pickpocket;
}

class UAIEventResponse_RelayEventToOtherStateGroupMembers : UAIEventResponse_SingleTarget
{
    UAIEventResponse_RelayEventToOtherStateGroupMembers(FGameplayTag EventTag)
    {
        _EventTag = EventTag;
    }

    UPROPERTY()
    FGameplayTag _EventTag;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto State = Cast<UGothicCharacterAIState>(AI.CurrentState);
        if (!IsValid(State))
            return;

        if (!IsValid(State.StateGroup))
            return;

        if (!_EventTag.IsValid())
            return;

        for (auto Member : State.StateGroup.JoinedCharacters)
        {
            if (Member == AI.Character)
                continue;

            auto OtherAI = Member.GetCharacterAI();
            if (!IsValid(OtherAI))
                continue;            
            
            OtherAI.AssessEvent(_EventTag, Perception);
        }
    }
}

class UAIEventResponse_SynchronizeAwareness : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_SynchronizeAwareness(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;       
    }

    // If the source character is closer than this distance, MaxDistanceFromSensedCharacters will be ignored
    UPROPERTY()
    float MinDistanceThreshold = 1000.0f;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto OtherCharacterState = GetTargetCharacterState(Perception);

        if (!IsValid(OtherCharacterState) || !IsValid(OtherCharacterState.Character))
            return;

        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.CharacterState.Character) || !IsValid(AI.Character))
            return;

        auto OtherCharacter = OtherCharacterState.Character;
        auto SelfCharacter = AI.Character;

        float Distance = SelfCharacter.GetDistanceTo(OtherCharacter);

        if (Distance > AI.MaxDistanceFromSourceCharacterToSynchAwareness)
            return;

        SelfCharacter.Perception.SetAwarenessToCharacter(OtherCharacter, EPerceptionSense::See, 100.0f);
        SelfCharacter.Perception.SetAwarenessToCharacter(OtherCharacter, EPerceptionSense::Smell, 100.0f);
        SelfCharacter.Perception.SetAwarenessToCharacter(OtherCharacter, EPerceptionSense::Hear, 100.0f);

        float WithinDistance = Distance < MinDistanceThreshold ? MAX_flt : AI.MaxDistanceFromSensedCharacterToSynchAwareness;
        
        SelfCharacter.Perception.ApplyAwarenessOfAllCharactersSensedBy(OtherCharacter, WithinDistance);
    }
}

class UAIEventResponse_CopyAllActiveModifiersFromTransformedCharacter : UAIEventResponse_SingleTarget
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        for (auto ActiveModifier : AI.CharacterState.Relationship.ActivePersonalModifiers)
        {
            if (!ActiveModifier.IsA(UActivePersonalRelationshipModifier_SingleCharacter))
                continue;

            auto SingleCharacterActiveModifier = Cast<UActivePersonalRelationshipModifier_SingleCharacter>(ActiveModifier);

            if (SingleCharacterActiveModifier.TargetCharacter.InstigatorCharacter != Perception.Origin.Character)
                continue;
            
            SingleCharacterActiveModifier.TargetCharacter = Perception.Origin.CharacterState;
        }
    }
}

class UAIEventResponse_EscalateConflict : UGothicAIEventResponse
{
    UAIEventResponse_EscalateConflict(EConflictType EscalateTo)
    {
        _EscalateTo = EscalateTo;
    }

    UPROPERTY()
    EConflictType _EscalateTo = EConflictType::TrueFight;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
        for (auto Group : Groups)
        {
            auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
            if (!IsValid(ConflictGroup))
                continue;

            if (!ConflictGroup.IsCharacterInvolved(AI.Character))
                continue;

            ConflictGroup.EscalateConflictTo(_EscalateTo);
        }
    }
}

class UAIEventResponse_BroadcastEventInRange : UAIEventResponse_SingleTarget
{
    UAIEventResponse_BroadcastEventInRange(FGameplayTag EventTag, float ToRange,
            EPerceptionCharacterType Target = EPerceptionCharacterType::None,
            EPerceptionCharacterType Affected = EPerceptionCharacterType::None,
            EPerceptionCharacterType Instigator = EPerceptionCharacterType::None
        )
    {
        _EventTag = EventTag;
        _Range = ToRange;
        TargetType = Target;
        AffectedType = Affected;
        InstigatorType = Instigator;
    }

    UPROPERTY()
    private FGameplayTag _EventTag;

    UPROPERTY()
    private float _Range = 700.0f;

    UPROPERTY()
    EPerceptionCharacterType TargetType;

    UPROPERTY()
    EPerceptionCharacterType AffectedType;

    UPROPERTY()
    EPerceptionCharacterType InstigatorType;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!_EventTag.IsValid() || !IsValid(AI) || !IsValid(AI.Character))
            return;

        AGothicCharacterState Target = TargetCharacterState(TargetType, Perception);
        AGothicCharacterState Affected = TargetCharacterState(AffectedType, Perception);
        AGothicCharacterState Instigator = TargetCharacterState(InstigatorType, Perception);

        AI.Character.Perception.BroadcastAreaEvent(
            _EventTag,
            2000.0f,
            SensedActor = AI.Character,
            TargetActor = IsValid(Target) ? Target.Character : nullptr,
            AffectedActor = IsValid(Affected) ? Affected.Character : nullptr,
            InstigatorActor = IsValid(Instigator) ? Instigator.Character : nullptr
        );
    }
}

/**
 * Each listener around the criminal receives a synthetic perception of the creeping crime.
 */
class UAIEventResponse_RelayCreepingAlertAroundInstigator : UAIEventResponse_SingleTarget
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
            return;

        auto Barker = AI.Character;
        auto BarkerState = AI.CharacterState;

        // Direct sightings put the criminal in Origin; relayed ones populate both.
        AGothicCharacterState CriminalState = Perception.Origin.CharacterState;
        if (!IsValid(CriminalState) || !IsValid(CriminalState.Character))
            CriminalState = Perception.Instigator.CharacterState;
        if (!IsValid(CriminalState) || !IsValid(CriminalState.Character))
            return;

        auto BarkerCrimeSubsystem = AI.CrimeProcessingSubsystem;
        if (!IsValid(BarkerCrimeSubsystem) || !IsValid(BarkerCrimeSubsystem.CreepingTuning))
            return;

        float Radius = BarkerCrimeSubsystem.CreepingTuning.BarkRelayRadius;
        if (Radius <= 0.0f)
            return;

        auto NearbyActorSubsystem = UNearbyActorsSubsystem::Get();
        if (!IsValid(NearbyActorSubsystem))
            return;

        TArray<AGothicCharacter> Listeners;
        for (auto OtherActor : NearbyActorSubsystem.FindActorsOfClassInRadius(AGothicCharacter, CriminalState.Character.ActorLocation, Radius))
        {
            auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);
            if (!IsValid(OtherCharacter) || !IsValid(OtherCharacter.CharacterState))
                continue;

            if (OtherCharacter == Barker || OtherCharacter == CriminalState.Character)
                continue;

            if (OtherCharacter.IsPlayerCharacterOrPlayerControlled())
                continue;

            // Friend + Neutral pass; Angry/Enemy/Hostile reject.
            ERelationship RelToListener = BarkerState.GetRelationshipTowards(OtherCharacter.CharacterState);
            if (RelToListener == ERelationship::Angry
                || RelToListener == ERelationship::Enemy
                || RelToListener == ERelationship::Hostile)
            {
                continue;
            }

            auto OtherAI = Cast<UGameplayAbility_CharacterAI_Gothic>(OtherCharacter.AI);
            if (!IsValid(OtherAI) || !IsValid(OtherAI.CrimeProcessingSubsystem) || !IsValid(OtherAI.CrimeProcessingSubsystem.CreepingTuning))
                continue;

            if (!OtherCharacter.CharacterState.AreaTagOfLocation.MatchesAny(OtherAI.CrimeProcessingSubsystem.CreepingTuning.ApplicableAreaTags))
                continue;

            // Eye-to-eye Visibility raycast to avoids false negatives
            ETraceTypeQuery LoSTraceType = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);
            const float EyeHeightOffset = 90.0f;
            FVector ListenerEye = OtherCharacter.ActorLocation + FVector(0.0f, 0.0f, EyeHeightOffset);
            FVector CriminalEye = CriminalState.Character.ActorLocation + FVector(0.0f, 0.0f, EyeHeightOffset);

            TArray<AActor> LoSActorsIgnore;
            LoSActorsIgnore.Add(OtherCharacter);
            LoSActorsIgnore.Add(CriminalState.Character);
            LoSActorsIgnore.Add(Barker);

            FHitResult LoSHit;
            bool bLoSBlocked = System::LineTraceSingle(
                ListenerEye,
                CriminalEye,
                LoSTraceType,
                false,
                LoSActorsIgnore,
                EDrawDebugTrace::None,
                LoSHit,
                true);
            if (bLoSBlocked)
                continue;

            Listeners.Add(OtherCharacter);
        }

        for (auto Listener : Listeners)
        {
            auto ListenerAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Listener.AI);
            if (!IsValid(ListenerAI))
                continue;

            ListenerAI.ForceHearingPerception(CriminalState);
            ListenerAI.ForceSightPerception(CriminalState);

            FRememberedPerception FakePerception;
            FakePerception.EventTag = GameplayTag::AIEvent_Seen_Creeping;
            FakePerception.Origin.Character = CriminalState.Character;
            FakePerception.Origin.CharacterState = CriminalState;
            FakePerception.Origin.AtPosition = CriminalState.CharacterLocation;
            FakePerception.Instigator.Character = CriminalState.Character;
            FakePerception.Instigator.CharacterState = CriminalState;
            FakePerception.Instigator.AtPosition = CriminalState.CharacterLocation;
            FakePerception.Affected.Character = Listener;
            FakePerception.Affected.CharacterState = Listener.CharacterState;
            FakePerception.ContextTags.AddTag(GameplayTag::Perception_Context_FromCreepingBark);

            ListenerAI.AssessEvent(GameplayTag::AIEvent_Seen_Creeping, FakePerception);
        }
    }
}

class UAIEventResponse_JoinTrainingFight : UAIEventResponse_SingleTarget
{
    UAIEventResponse_JoinTrainingFight(EPerceptionCharacterType Target, EPerceptionCharacterType Ally = EPerceptionCharacterType::None)
    {
        TargetType = Target;
        AllyType = Ally;
    }

    UPROPERTY()
    EPerceptionCharacterType TargetType = EPerceptionCharacterType::None;

    UPROPERTY()
    EPerceptionCharacterType AllyType = EPerceptionCharacterType::None;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AGothicCharacterState Target = TargetCharacterState(TargetType, Perception);
        AGothicCharacterState Ally = nullptr;

        if (AllyType != EPerceptionCharacterType::None)
        {
            Ally = TargetCharacterState(AllyType, Perception);
        }

        auto TrainingSubsystem = UManagedFightSubsystem::Get();
        if (!IsValid(TrainingSubsystem))
            return;

        TrainingSubsystem.StartTrainingFight(AI.CharacterState, Target, Ally);
    }
}

class UAIEventResponse_EndTrainingFight : UAIEventResponse_SingleTarget
{
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto TrainingSubsystem = UManagedFightSubsystem::Get();
        if (!IsValid(TrainingSubsystem))
            return;

        TrainingSubsystem.EndTrainingFightOf(AI.CharacterState);
    }
}