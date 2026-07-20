// Based on OG fighting AI: https://ataulien.github.io/Inside-Gothic/fight-ai/

/**
 * Base your custom combat moves on this. Create a subclass and override "DoTask()" to do whatever
 * AI commands you need to do in your move.
 */
UCLASS(Abstract)
class UAITask_CombatMove : UGothicCharacterAITask
{
    UAITask_CombatMove()
    {

    }

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_Dodge);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_BeingDraw);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ConsumeItem);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_Interact);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_ExecuteCharacter);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Block);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_MeleeAttack);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::AICombatMove_CastSpell);

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Hit_BreakSuperArmor);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Hit_Parried);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Hit_Riposte);

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Dead);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_Defeated);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::Debuff_Electrified);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::Debuff_Freeze);
    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::Debuff_Sleep);

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_Dead);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_Defeated);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Paralyzed);
    // default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Electrified); // To avoid cancelling ChainLightning upon the caster hitting themselves, other lightning spells come with Paralyzed tag too
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Freeze);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Sleep);

    default CancelIfCharacterLosesAnyOf.AddTag(GameplayTag::State_ItemInHand);

    UPROPERTY(EditDefaultsOnly)
    FGameplayTag ActionTag;

    UPROPERTY()
    UAITask_CombatMove TemplateObject;

    /** If false, incomming reaction-requests will not try to end this move before it finishes on its own. */
    UPROPERTY(EditDefaultsOnly)
    bool bCanBeInterruptedByReaction = true;

    /** If true, whenever any (non-reactions included) new situation triggers, this move will cancel. */
    UPROPERTY(EditDefaultsOnly)
    bool bCanBeInterruptedByEverything = false;

    /** If true, behavior tree node will return running until the task ends. Otherwise it will return success as soon as the task is set ready for activation. */
    UPROPERTY(EditDefaultsOnly)
    bool bReturnRunningUntilTaskEnds = true;

    /** If true, Combat class will store this move's class as LastMove */
    UPROPERTY(EditDefaultsOnly)
    bool bRecordAsLastMove = true;

    UPROPERTY()
    bool bCanWalkDuringCombatMove = false;

    UPROPERTY()
    bool bIsBlockedByBlockStateTag = true;

    UPROPERTY()
    bool bRequiresSpecificRelativeHeight = false;

    FGameplayTagContainer IgnoreBlockIfCharacterHasAnyOf;
    default IgnoreBlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_ResetStates);

    UPROPERTY(EditDefaultsOnly)
    FGameplayTagContainer BlockIfCharacterHasAnyOf;


    /** Cooldown for moves of this exact class and all MoveType-tags that were assigned */
    UPROPERTY(EditDefaultsOnly)
    float CooldownSeconds = 0.0f;

    /** Action tags that will be put into cooldown */
    UPROPERTY(EditDefaultsOnly)
    TMap<FGameplayTag, float> MoveTypeCooldowns;

    /** Type of move this is. This is referred to when checking if this move should be in cooldown. */
    UPROPERTY(EditDefaultsOnly)
    FGameplayTagContainer MoveTypes;

    /** Distance from the target beyond which this move can be done, must be lower than MaxRange. */
    UPROPERTY()
    float MinRange = 0.0f;

    /** Distance from the target beyond which this move cannot be done. */
    UPROPERTY()
    float MaxRange = MAX_flt;

    /** Minimum height relative to the target at which this move can be done. */
    UPROPERTY()
    float MinRelativeHeight = 0.0f;

    /** Maximum height relative to the target at which this move can be done. */
    UPROPERTY()
    float MaxRelativeHeight = 0.0f;

    /** Tags to disallow this move */
    UPROPERTY()
    FGameplayTagContainer DisallowMoveTags;

    UPROPERTY()
    ECombatActionPriority Priority;

    /** Cached CombatState for faster access (we don't want to iterate the OuterChain on every use of this) */
    UAIState_Combat_G1R Combat = FindOuterCombatState();

    /** Access to the combat state that is using this object. */
    UAIState_Combat_G1R FindOuterCombatState() const
    {
        UObject Next = Outer;
        while (IsValid(Next) && !Next.IsA(UAIState_Combat_G1R::StaticClass()))
        {
            Next = Next.Outer;
        }

        return Cast<UAIState_Combat_G1R>(Next);
    }

    UCombatActionsHandler GetActionsHandler() const property
    {
        if (!IsValid(Combat))
            return nullptr;

        return Combat.ActionsHandler;
    }

    bool CancelMovementOnStart() const
    {
        return true;
    }

    /** 
     * Override and return whether this move should be allowed right now. If the
     * move is not allowed, another move will be tried instead.
     */
    UFUNCTION()
    bool IsMoveAllowed(FString&out Reason) const
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UAITask_CombatMove::IsMoveAllowed"));

        if (Combat.CharacterState.HasAnyGameplayTags(DisallowMoveTags))
        {
            Reason = "Move is disallowed.";
            return false;
        }

        if(bIsBlockedByBlockStateTag && Combat.AI.IsBlocked())
        {
            Reason = "Character state is blocked.";
            return false;
        }
        
        FGameplayTagContainer CharacterGameplayTags;
        Combat.AI.Character.GetAbilitySystemComponent().GetOwnedGameplayTags(CharacterGameplayTags);
        if (CharacterGameplayTags.HasAny(IgnoreBlockIfCharacterHasAnyOf))
        {
            return true;
        }

        if (CharacterGameplayTags.HasAny(BlockIfCharacterHasAnyOf))
        {
            Reason = "Character has tag that is in the combatmove blocked tags container.";
            return true;
        }

        return true;
    }

    /** (not a coroutine!) Called after the move as ended, no matter whether this was via Cancel or graceful exit. */
    void OnMoveEnded()
    {
        if (!IsValid(ActionsHandler))
            return;

        if (Outer.IsA(UAITask_CombatMove::StaticClass()))
            return;

        if (!IsValid(Combat))
            return;
        
        Combat.ActionsHandler.OnActionFinished(this);
        Combat.OnCombatMoveFinished(this);
    }

    bool CanWalkDuringCombatMove() const
    {
        return bCanWalkDuringCombatMove;
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished) final
    {
        if (!bInOwnerFinished)
        {
            OnMoveEnded();
        }
    }

    /** Override to modify the cooldown time that is applied for this move. */
    float GetCooldownTime() const
    {
        return CooldownSeconds;
    }

    /** Override to modify the cooldown time that this move applies to the given tag. */
    float GetCooldownTimeForTag(FGameplayTag Tag) const
    {
        float Cooldown = 0.0f;
        if (!MoveTypeCooldowns.Find(Tag, Cooldown))
            return 0.0f;
        
        return Cooldown;
    }

    /** Returns a clean short name for debugging */
    FString GetDisplayName() const
    {
        FString Str = Name.ToString();
        Str.RemoveFromStart("CM");
        Str.RemoveFromStart("_");

        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);

        return FinalName;
    }

#if WITH_IMGUI
    /** Override to define what should be shown in the overview tree for this move. */
    void DisplayImGuiInTreeView(bool bIsActive)
    {        
        if (bIsActive)
        {
            ImGui::PushTextColor(FColor::Emerald);
            ImGui::Text(GetDisplayName());
            ImGui::PopTextColor();
        }
        else
        {
            ImGui::Text(GetDisplayName());
        }

        FString ReasonMoveNotAllowed = "Empty";
        if (!IsMoveAllowed(ReasonMoveNotAllowed))
        {
            ImGui::SameLine();
            ImGui::BoolIcon(false);
            ImGui::SetTooltipOnHover(ReasonMoveNotAllowed);
        }

        if (Combat.IsMoveInCooldown(this))
        {
            ImGui::SameLine();

#if TEST
            switch (int(Combat.World.TimeSeconds * 2) % 4)
            {
            case 0: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_START}"); break;
            case 1: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_HALF}"); break;
            case 2: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_END}"); break;
            case 3: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_O}"); break;
            }
#endif

            ImGui::SameLine();
            ImGui::TextColored(FColor::Orange, f"{Combat.GetMoveCooldownSecondsLeft(this):.2f}s");

            ImGui::SetTooltipOnHover("Move is in cooldown");
        }
    }
#endif
}

/** 
 * Ends the current combat substate and returns to its parent. 
 * If used on the root combat state, combat will end.
 */
UCLASS()
class UCM_ExitState : UAITask_CombatMove
{   
}

UCLASS(DefaultToInstanced, EditInlineNew)
class UFightAI_CombatSituation : UFightAI_StateSituation
{
    /** Cached CombatState for faster access (we don't want to iterate the OuterChain on every use of this) */
    UAIState_Combat_G1R Combat = FindOuterCombatState();

    UPROPERTY(EditDefaultsOnly)
    bool bRequireCharacterOfInterest = false;

    UPROPERTY(EditDefaultsOnly)
    bool bRequireCombat = true;

    /** Access to the combat state that is using this object. */
    UAIState_Combat_G1R FindOuterCombatState() const
    {
        UObject Next = Outer;
        while (IsValid(Next) && !Next.IsA(UAIState_Combat_G1R::StaticClass()))
        {
            Next = Next.Outer;
        }

        return Cast<UAIState_Combat_G1R>(Next);
    }

    /** Returns a clean short name for debugging */
    FString GetDisplayName() const
    {
        FString Str = Name.ToString();
        Str.RemoveFromStart("CS");
        Str.RemoveFromStart("_");
        
        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);

        return FinalName;
    }

    UCM_Attack GetSelectedAttack() const property
    {
        if (!IsValid(Combat))
            return nullptr;

        return Combat.SelectedAttack;
    }

    bool IsInSituation() const override
    {
        if (!IsValid(Combat) && bRequireCombat)
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest) && bRequireCharacterOfInterest)
            return false;

        return true;
    }
};

enum EPreferredDistanceBehavior
{
    Exact,
    CloserThan,
    FartherThan,
    Count
}

struct FCombatConfig
{
    // Taunts
    bool bActiveAttackerCanTaunt = true;
    bool bPassiveAttackerCanTaunt = true;
    bool bObserverCanTaunt = true;

    bool bTargetCharacterOfInterest = true;

    float TauntMinimumDistance_LongTaunt = 500.0f;
    float TauntMinimumDistance_ShortTaunt = 150.0f;

    bool bUseTestTauntCooldown = false;
    float32 TestTauntCooldown = 1.0f;

    float TauntVoiceProbability = 0.3f;
    ////

    float PositioningValuesSizeMultiplier = 1.0f;

    float32 CooldownSwitchWeapon = 2.0f;
    float32 CooldownJustGotHit = 10.0f;

    bool bUseWeaponSkillLevels = false;
    // Skill level cooldown multipliers
    float32 CooldownMultiplier_Master = 0.8f;
    float32 CooldownMultiplier_Trained = 1.0f;
    float32 CooldownMultiplier_Untrained = 1.2f;
    float32 AttackBehaviorCooldownMultiplier_Trained = 0.66f;
    float32 AttackBehaviorCooldownMultiplier_Master = 0.4f;

    EPreferredDistanceBehavior PreferredDistanceBehavior = EPreferredDistanceBehavior::Exact;
    float PreferredDistance = 200.0f;

    float FriendlyFireSafetyDistance = 150.0f;

    bool bDodgeToMoveTowardsTarget = false;
    bool bDodgeToMoveAwayFromTarget = false;

    // Combo closing probabilities
    TArray<float> ChanceToCloseCombo;
    int MaximumNumberOfAttacksPerCombo = 3;
    bool bEndCombosOnMiss = true;

    // Dodge / Wait weights on reacting to incoming attack
    float32 ReactToAttackFrontDodgeChance = 0.25f;
    float32 ReactToAttackBackDodgeChance = 0.2f;

    float32 ReactToAttackFrontDodgeChance_Untrained = 0.33f;
    float32 ReactToAttackBackDodgeChance_Untrained = 0.0f;

    float32 ReactToAttackFrontDodgeChance_Trained = 0.66f;
    float32 ReactToAttackBackDodgeChance_Trained = 0.33f;

    float32 ReactToAttackFrontDodgeChance_Master = 0.75f;
    float32 ReactToAttackBackDodgeChance_Master = 0.4f;

    // Dodge back chance after attack
    float32 DodgeAfterAttackChance = 0.0f;

    // Reactive blocking chances
    float32 ReactiveBlockingChance_Trained = 0.3f;
    float32 ReactiveBlockingChance_Master = 0.5f;   

    float32 BlockingTime = 3.0f;
    float32 ReactiveBlockingTime = 0.5f;
    float32 ProactiveBlockingTime = 3.0f;

    float MeleeAttackCapsuleRadiusMultiplier = 1.0f;
}

UCLASS()
class UAttackMoveHandler : UObject
{
    UPROPERTY()
    UCM_Attack Attack;

    UPROPERTY()
    UCBT_Node AttackSelectorNode;

    UPROPERTY()
    TArray<UBehaviorTreeCooldownProfile> CooldownProfiles;

    UPROPERTY()
    float AttackBehaviorSortLayer = -1.0f;

    UPROPERTY()
    FInGameTime SelectedAtTime;

    UPROPERTY()
    FInGameTime LastTimeCharacterMoveToAttackStarted;

    UPROPERTY()
    FInGameTime LastTimeCharacterMoveToAttackEnded;

    UPROPERTY()
    const float FailsafeTime = 2.0f;

    UFUNCTION()
    bool HasCharacterNotTriedToAttackInFailsafeTime()
    {
        if (!SelectedAtTime.IsValid())
            return false;

        float SelectedAttackAgeInRealtimeSeconds = SelectedAtTime.AgeInRealtimeSeconds;
        if (!LastTimeCharacterMoveToAttackStarted.IsValid() && SelectedAttackAgeInRealtimeSeconds > FailsafeTime)
            return true;

        if (!LastTimeCharacterMoveToAttackStarted.IsValid() || !LastTimeCharacterMoveToAttackEnded.IsValid())
            return false;

        if (LastTimeCharacterMoveToAttackEnded.AgeInRealtimeSeconds <= LastTimeCharacterMoveToAttackStarted.AgeInRealtimeSeconds &&
            SelectedAtTime.AgeInRealtimeSeconds > LastTimeCharacterMoveToAttackEnded.AgeInRealtimeSeconds &&
            LastTimeCharacterMoveToAttackEnded.AgeInRealtimeSeconds >= FailsafeTime)
            return true;

        return false;
    }
}

UCLASS()
class UAIState_Combat_SimplifiedTest : UAIState_Combat_G1R
{
    default AssessmentModuleClass = UAIARM_State_Combat_Simple;
}

UCLASS()
class UAIState_Combat_AnimationTest : UAIState_Combat_G1R
{
    default AssessmentModuleClass = nullptr;
}

struct FCombatBehaviorTreeTickFlags
{
    bool bCooldownEnded = false;
    bool bCombatMoveEnded = false;
    bool bTargetChanged = false;
    bool bBehaviorTreeChanged = false;
    bool bInRangeForSelectedAttack = false;
    bool bAttackSelected = false;
    bool bRoleChanged = false;

    bool bCanReactToIncomingAttack = false;
    bool bDodgeOrComboWindowEntered = false;

    bool HasAllFlagsOf(FCombatBehaviorTreeTickFlags NeccesaryFlags)
    {
        if (NeccesaryFlags.bCooldownEnded && !bCooldownEnded)
            return false;
        
        if (NeccesaryFlags.bCombatMoveEnded && !bCombatMoveEnded)
            return false;

        if (NeccesaryFlags.bTargetChanged && !bTargetChanged)
            return false;

        if (NeccesaryFlags.bBehaviorTreeChanged && !bBehaviorTreeChanged)
            return false;

        if (NeccesaryFlags.bInRangeForSelectedAttack && !bInRangeForSelectedAttack)
            return false;

        if (NeccesaryFlags.bAttackSelected && !bAttackSelected)
            return false;

        if (NeccesaryFlags.bRoleChanged && !bRoleChanged)
            return false;

        if (NeccesaryFlags.bCanReactToIncomingAttack && !bCanReactToIncomingAttack)
            return false;

        if (NeccesaryFlags.bDodgeOrComboWindowEntered && !bDodgeOrComboWindowEntered)
            return false;

        return true;
    }

    void Reset()
    {
        bCooldownEnded = false;
        bCombatMoveEnded = false;
        bTargetChanged = false;
        bBehaviorTreeChanged = false;
        bInRangeForSelectedAttack = false;
        bAttackSelected = false;
        bRoleChanged = false;
        bDodgeOrComboWindowEntered = false;
        bCanReactToIncomingAttack = false;
    }
}

UCLASS()
class UCooldownsOnMoveEndedHandler
{
    TMap<TSubclassOf<UAITask_CombatMove>, UCooldownsOnMoveEndedItem> Items;

    UCooldownsOnMoveEndedItem FindOrAdd(TSubclassOf<UAITask_CombatMove> MoveEndedClass)
    {
        return Items.FindOrAdd(MoveEndedClass, UCooldownsOnMoveEndedItem());
    }
}

UCLASS()
class UCooldownsOnMoveEndedItem
{
    UPROPERTY()
    float _Cooldown = 0.0f;

    UPROPERTY()
    TSet<TSubclassOf<UAITask_CombatMove>> MovesToPutOnCooldown;

    UCooldownsOnMoveEndedItem AddMoveToPutOnCooldown(TSubclassOf<UAITask_CombatMove> CombatMoveClass)
    {
        MovesToPutOnCooldown.Add(CombatMoveClass);
        return this;
    }

    UCooldownsOnMoveEndedItem SetCooldown(float Cooldown)
    {
        _Cooldown = Cooldown;
        return this;
    }
}

UCLASS()
class UAIState_Combat_G1R : UAIState_Combat
{
    UPROPERTY()
    bool bTauntsEnabled = true;

    UPROPERTY()
    const bool bCanDoTauntsWhileSwimming = false;

    UPROPERTY()
    const bool bCanDoTauntsWhileDiving = false;

    // UPROPERTY(EditDefaultsOnly)
    // UCBT_Root CombatBehaviorTree;

    UPROPERTY(EditDefaultsOnly)
    UCombatBehaviorController BehaviorController;


    // Behavior Tree Flags this State currently owns
    UPROPERTY()
    FCombatBehaviorTreeTickFlags OwnedBehaviorTreeTickFlags;

    // Behavior Tree Flags we need to own to tick the High Priority Tree
    UPROPERTY()
    FCombatBehaviorTreeTickFlags HighPriorityTreeRequiredTickFlags;

    default HighPriorityTreeRequiredTickFlags.bCanReactToIncomingAttack = true;
    default HighPriorityTreeRequiredTickFlags.bDodgeOrComboWindowEntered = true;

    // Behavior Tree Flags we need to own to tick the Base Priority Tree
    UPROPERTY()
    FCombatBehaviorTreeTickFlags BasePriorityTreeRequiredTickFlags;

    default BasePriorityTreeRequiredTickFlags.bCooldownEnded = true;
    default BasePriorityTreeRequiredTickFlags.bTargetChanged = true;
    default BasePriorityTreeRequiredTickFlags.bBehaviorTreeChanged = true;
    default BasePriorityTreeRequiredTickFlags.bInRangeForSelectedAttack = true;
    default BasePriorityTreeRequiredTickFlags.bAttackSelected = true;
    default BasePriorityTreeRequiredTickFlags.bRoleChanged = true;

    default FocusPriority = EGothicFocusPriority::CombatBase;

    bool bUseBehaviorController = false;

    bool bUseTrainingArea = false;
    bool bEndCombatEventAssessed = false;

    UPROPERTY()
    private UAttackMoveHandler _SelectedAttackHandler;

    UAttackMoveHandler GetSelectedAttackHandler() const property
    {
        return _SelectedAttackHandler;
    }

    default CombatGroupClass = UAIGroup_Combat::StaticClass();

    UPROPERTY()
    TSubclassOf<UAITask_CombatMove> LastCombatMoveType;

    UPROPERTY()
    EAttackUsageType LastAttackUsageType = EAttackUsageType::None;

    UPROPERTY()
    UAICombatPositioning Positioning;

    UPROPERTY()
    bool bReceivedDamageThisCombat = false;

    UPROPERTY()
    bool bDealtDamageThisCombat = false;

    UPROPERTY()
    bool bShouldFlee = false;

    UPROPERTY()
    bool bShouldSelectTarget = false;

    UPROPERTY()
    AGothicCharacter PriorityTarget;

    UPROPERTY()
    bool bCanDoTauntsWhileMoving = false;
    
    /** 
     * Mapping of MoveType -> last time such a move was done. 
     * 
     * Note that only the combat rootstate contains useful values for this, as
     * that is what all the substates will be accessing!
     */
    UPROPERTY()
    protected TMap<FGameplayTag, float> ActiveMoveTypeCooldowns;

    UPROPERTY()
    protected TMap<TSubclassOf<UAITask_CombatMove>, float> MoveClassCooldowns;

    UPROPERTY()
    protected TMap<FString, FVector2f> BehaviorTreeNodeCooldowns;

    UPROPERTY()
    protected TMap<FString, FGameplayTagContainer> BehaviorTreeNodeCooldownTickBlockingTags;

    UPROPERTY()
    protected TMap<FString, FGameplayTagContainer> BehaviorTreeNodeCooldownTickRequirementTags;

    UPROPERTY()
    protected FGameplayTagContainer ActiveMoveTags;

    default IsTickingTask = true;

    UPROPERTY()
    FCombatConfig Config;

    UPROPERTY()
    ECombatRole RoleLastFrame = ECombatRole::None;

    UPROPERTY()
    ECombatTestingBehaviorType SelectedTestingBehavior = ECombatTestingBehaviorType::None;

    UPROPERTY()
    UTestingBehaviorSet CustomTestingBehavior = UTestingBehaviorSet_Custom();

    UPROPERTY()
    TArray<UTestingBehaviorSet> TestingBehaviorSets;

    UPROPERTY()
    EWalkSpeed BaseSpeed = EWalkSpeed::Walking;

    UPROPERTY()
    EWalkSpeed FarSpeed = EWalkSpeed::Running;

    UPROPERTY()
    float MovementSpeedChangeDistanceToCollisionRadiusRatio = 10.0f;

    FInGameTime TimeOfLastFailureToAttack;

    int FailureToMoveCounter = 0;
    int FailureToAttackCounter = 0;

    UPROPERTY()
    TSet<AGothicCharacterState> TrackerTargetsHaveDrawnWeapon;

    UPROPERTY()
    TSet<TSubclassOf<UAITask_CombatMove>> MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor;

    UPROPERTY()
    UCooldownsOnMoveEndedHandler CooldownsOnMoveEnded = UCooldownsOnMoveEndedHandler();

    UPROPERTY()
    float MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 0.5f;

    UPROPERTY()
    FInGameTime NullTargetEndCombatTime;

    UPROPERTY()
    TMap<TSubclassOf<UCombatBehaviorSet>, int> BehaviorSetUsageCounter;

    UPROPERTY()
    const UTerritoryConfig Territory;

    // This flag will be set to true when Territory Expansion is triggered
    UPROPERTY()
    private bool b_TerritoryExpansionTriggered = false;

    // This distance will be set to the distance from the npc to the conflict start location when Territory Expansion is triggered
    UPROPERTY()
    private float _TerritoryExpansionDistance = 0.0f;

    UFUNCTION()
    bool IsTerritoryExpansionTriggered()
    {
        return b_TerritoryExpansionTriggered;
    }

    float GetTerritoryExpansionDistance() const property
    {
        return _TerritoryExpansionDistance;
    }

    // Test
    UPROPERTY()
    FName CurrentTestWaypoint = n"";
    
    FName SetupBehaviorTreeName = n"SetupBehaviorTree";
    FName TickBehaviorTree_MediumPriority_Name = n"TickBehaviorTree_MediumPriority";
    FName TickBehaviorTree_LowPriority_Name = n"TickBehaviorTree_LowPriority";
    FName TickBehaviorTree_Movement_Name = n"TickBehaviorTree_Movement";
    FName TargetSelectionName = n"TargetSelection";
    FName TickCooldownsName = n"TickCooldowns";

//     UFUNCTION()
//     void LogHistory(FString PrefixText, FString MainText, int IndentationLevel = 0, FColor TextColor = FColor::White, bool bTextDisabled = false)
//     {
// #if WITH_IMGUI
//         AI.AddHistoryLog(FCombatHistoryLogEntry(PrefixText, MainText, IndentationLevel, TextColor, bTextDisabled));        
// #endif
//     }

//     UFUNCTION()
//     void LogHistoryWithoutPrefix(FString MainText, int IndentationLevel = 0, FColor TextColor = FColor::White, bool bTextDisabled = false)
//     {
// #if WITH_IMGUI
//         AI.AddHistoryLog(FCombatHistoryLogEntry(MainText, IndentationLevel, TextColor, bTextDisabled));
// #endif
//     }

    FString GetDisplayName() const override
    {
        return "OG Combat";
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        if (ImGui::BeginTabBar("Combat State Tabs"))
        {
            if (ImGui::BeginTabItem("Behavior Tree"))
            {
#if TEST
                if (IsTestingEnabled)
                {
                    ImGui::TextColored(FColor::Red, "Some behaviors can break if the Character doesn't have the right animations.");

                    if (ImGui::BeginCombo("Selected testing behavior", GetTestingBehaviorName(SelectedTestingBehavior)))
                    {
                        if (ImGui::Selectable("Regular Behaviors", SelectedTestingBehavior == ECombatTestingBehaviorType::None))
                        {
                            SelectedTestingBehavior = ECombatTestingBehaviorType::None;
                            SetupBehaviorTree();
                        }
                        
                        if (ImGui::Selectable("Testing Script", SelectedTestingBehavior == ECombatTestingBehaviorType::Custom))
                        {
                            SelectedTestingBehavior = ECombatTestingBehaviorType::Custom;
                            SetupBehaviorTree();
                        }

                        for (auto TestingBehaviorSet : TestingBehaviorSets)
                        {
                            if (ImGui::Selectable(TestingBehaviorSet.BehaviorSetName, SelectedTestingBehavior == TestingBehaviorSet.TestingBehaviorType))
                            {
                                auto PreviousSelectedBehavior = SelectedTestingBehavior;
                                SelectedTestingBehavior = TestingBehaviorSet.TestingBehaviorType;

                                if (PreviousSelectedBehavior != SelectedTestingBehavior)
                                {
                                    SetupBehaviorTree();
                                }
                            }
                        }

                        ImGui::EndCombo();                       
                    }
                }
                else
                { 
                    if (ImGui::Button(Icon::REFRESH))
                    {
                        SetupBehaviorTree();
                    }
                    ImGui::SetTooltipOnHover("Refresh Behavior Tree (e.g. after script hot-reload)");
                    ImGui::SameLine();
                }
#endif
                DisplayOverview();
                DisplayImGuiInTreeView();
                ImGui::EndTabItem();
            }
            
            if (ImGui::BeginTabItem("Trace"))
            {
                DisplayTrace();
                ImGui::EndTabItem();
            }
            
            if (ImGui::BeginTabItem("Group"))
            {
                if (IsValid(GetRootCombatState()) && IsValid(CombatGroup))
                {
                    CombatGroup.DisplayImGui(Self);
                }
                ImGui::EndTabItem();
            }

            if (ImGui::BeginTabItem("Cooldowns"))
            {
                for (auto& Cooldown : ActiveMoveTypeCooldowns)
                {
                    ImGui::BulletText(f"{Cooldown.Key.ToString()} - {Cooldown.Value}s");
                }

                for (auto& Cooldown : MoveClassCooldowns)
                {
                    if (Cooldown.Key.IsValid())
                    {
                        ImGui::BulletText(f"{Cooldown.Key.Get().Name} - {Cooldown.Value}s");
                    }
                }

                for (auto& Cooldown : BehaviorTreeNodeCooldowns)
                {
                    ImGui::BulletText(f"{Cooldown.Key} - {Cooldown.Value}s");
                }

                if (Self.Perception.Memory.Filter().FilterRecent(World.TimeSeconds - LastAssessTimeSeconds).IsEmpty())
                {
                    ImGui::TextDisabled("[none]");
                }

                ImGui::EndTabItem();
            }

            if (ImGui::BeginTabItem("Tasks"))
            {
                Super::DisplayImGui();

                ImGui::EndTabItem();
            }

            ImGui::EndTabBar();
        }

        if (IsValid(Positioning))
        {
            Positioning.DrawDebug();
        }

        DebugScript::DrawSphere(Self.GetFeetLocation() + FVector::UpVector * 200.0f, 10.0f, FColor::Purple);
        DebugScript::DrawLine(Self.GetFeetLocation() + FVector::UpVector * 200.0f, Self.GetFeetLocation() + FVector::UpVector * 260.0f, FColor::Purple, 5.0f);
    }

    /** Override to define what should be shown for this state before the behavior trees */
    void DisplayOverview()
    {
        // DisplayConflictType();
        DisplayCharacterOfInterest();
        DisplayCurrentBehaviorSet();
        DisplayAvailableBehaviorSets();
        DisplayCurrentWeapon();
        DisplayDistanceStageIndicator();
        DisplayPreferredDistances();
        DisplaySelectedAttack();
        DisplayCurrentActions();
        DisplayCurrentMovement();

        // ImGui::TextColored(FColor::Cyan, "Running Node:");
        // if (IsValid(BehaviorController))
        // {
        //     ImGui::Indent();
        //     DisplayCurrentRunningChildmostNode(BehaviorController.HighPriorityTree);
        //     DisplayCurrentRunningChildmostNode(BehaviorController.MediumPriorityTree);
        //     DisplayCurrentRunningChildmostNode(BehaviorController.LowPriorityTree);
        //     DisplayCurrentRunningChildmostNode(BehaviorController.MovementTree);
        //     ImGui::Unindent();
        // }
    }

    UFUNCTION(BlueprintOverride)
    void DisplayOverheadImGui()
    {
        DisplayDistanceStageIndicator();

        // Display Selected Attack
        ImGui::TextColored(FColor(128.0f, 128.0f, 128.0f), "Sel Atk: ");
        ImGui::SameLine();
        ImGui::Text(IsValid(SelectedAttack) ? f"{SelectedAttack.Name}" : "None");

        if (IsValid(SelectedAttack))
        {            
            FString MinRange = SelectedAttack.MinRange > 100000.0f ? "maxflt" : f"{(SelectedAttack.MinRange):.2f}";
            FString Range = SelectedAttack.Range > 100000.0f ? "maxflt" : f"{(SelectedAttack.Range):.2f}";
            ImGui::Text("R: " + f"{MinRange} to {Range}");
        }

        if (IsValid(CombatGroup))
        {
            ImGui::Text(f"{RoleLastFrame}");
        }

        if (IsValid(SelectedAttack) && SelectedAttack.bRequiresSpecificRelativeHeight)
        {
            ImGui::SameLine();
            ImGui::Text("|");
            ImGui::SameLine();
            ImGui::Text("H: " + f"{SelectedAttack.MinRelativeHeight} to {SelectedAttack.MaxRelativeHeight}");
        }

        // if (IsValid(BehaviorController))
        // {
        //     DisplayCurrentRunningChildmostNode(BehaviorController.HighPriorityTree, "HighPriorityTree_");
        //     DisplayCurrentRunningChildmostNode(BehaviorController.MediumPriorityTree, "MediumPriorityTree_");
        //     DisplayCurrentRunningChildmostNode(BehaviorController.LowPriorityTree, "LowPriorityTree_");
        //     DisplayCurrentRunningChildmostNode(BehaviorController.MovementTree, "MovementTree_");
        // }
    }

    // UFUNCTION()
    // void DisplayConflictType()
    // {
    //     if (!IsValid(ConflictInstanceGroup))
    //     {
    //         ImGui::Text("Conflict group not initialized yet");
    //         return;
    //     }

    //     ImGui::Text(f"Conflict: {ConflictInstanceGroup.ConflictType}");
    // }

    void DisplayDistanceStageIndicator()
    {
        FString IndicatorText = "Enemy too far away";

        if (IsEnemyTooClose())
        {
            IndicatorText = f"Target too close ({DistanceToCharacterOfInterest:.1f})";
            ImGui::Text(IndicatorText);
            return;
        }

        if (IsEnemyClose())
        {
            IndicatorText = f"Enemy close ({DistanceToCharacterOfInterest:.1f})";
            ImGui::Text(IndicatorText);
            return;
        }

        if (IsEnemyAtLungeDistance())
        {
            IndicatorText = f"Enemy at lunge distance ({DistanceToCharacterOfInterest:.1f})";
            ImGui::Text(IndicatorText);
            return;
        }

        if (IsEnemyBarelyOutOfReach())
        {
            IndicatorText = f"Enemy out of reach ({DistanceToCharacterOfInterest:.1f})";
            ImGui::Text(IndicatorText);
            return;
        }

        ImGui::Text(IndicatorText);
    }
    
    void DisplayCharacterOfInterest()
    {
        // Display Character of interest
        ImGui::Text("Enemy: " + CharacterOfInterestDisplayName);
        ImGui::TextDisabled("  Is Targeting:"); ImGui::SameLine(); ImGui::BoolIcon(IsTargetingCharacterOfInterest());
    }

    FString GetCharacterOfInterestDisplayName() const property
    {
        return IsValid(CharacterOfInterest) ? f"{CharacterOfInterest.CharacterUniqueName}" : "None";
    }

    void DisplayCurrentBehaviorSet()
    {
        /// CURREN BEHAVIOR SET
        FString CurrentBehaviorSetName = IsValid(CurrentCombatBehaviorSet) ? CurrentCombatBehaviorSet.GetDisplayName() : "nullptr";
        // Display testing info
        if (IsTestingEnabled) CurrentBehaviorSetName = GetTestingBehaviorName(SelectedTestingBehavior);
        // Display Current behavior set
        ImGui::Text(f"Current Behavior Set: {CurrentBehaviorSetName}");
    }

    void DisplayAvailableBehaviorSets()
    {
        bool bIsBehaviorSetsHeaderOpen = ImGui::CollapsingHeader("Behavior Sets");
        if (bIsBehaviorSetsHeaderOpen)
        {
            ImGui::Separator();
            ImGui::Indent(20.0f);
            for (auto BehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
            {
                FString Reason;
                bool bUse = BehaviorSet.ShouldUseBehaviorAndRoleAllowsTo(Reason);

                ImGui::BoolIcon(bUse);
                if (!bUse)
                {
                    ImGui::SetTooltipOnHover(Reason);
                }
                
                ImGui::SameLine(); ImGui::TextColored(bUse ? FColor::White : FColor(128, 128, 128), BehaviorSet.GetDisplayName());
                
            }
            ImGui::Unindent(20.0f);
            ImGui::Separator();
        }
    }

    void DisplayCurrentWeapon()
    {
        // Display Current Weapon
        ImGui::Text(f"Current Weapon: {Self.GetDrawnWeaponTypeTag()}");
    }

    void DisplayPreferredDistances()
    {
        // Display Preferred Distances
        ImGui::Text(f"Preferred Idle Distance: {Config.PreferredDistance}");
    }

    void DisplaySelectedAttack()
    {
        // Display Selected Attack
        ImGui::TextColored(FColor::Yellow, "Selected Attack: ");
        ImGui::SameLine();
        ImGui::Text(IsValid(SelectedAttack) ? f"{SelectedAttack.Name}" : "None");

        if (IsValid(SelectedAttack))
        {
            FString Reason;
            bool bIsAttackAllowed = SelectedAttack.IsMoveAllowed(Reason);
            ImGui::SameLine();

            if (IsDoingMoveOfClass(SelectedAttack.Class))
            {
                ImGui::TextColored(FColor::Yellow, Icon::PLAY_CIRCLE);
                ImGui::SetTooltipOnHover("Attack already running");
                ImGui::TextDisabled("Attack already running");
            }
            else
            {
                ImGui::BoolIcon(bIsAttackAllowed);
                ImGui::SetTooltipOnHover(bIsAttackAllowed ? "Allowed" : f"Not allowed - {Reason}");
                ImGui::TextDisabled(bIsAttackAllowed ? "Allowed" : f"Not allowed - {Reason}");
            }

            FString MaxRange = SelectedAttack.MaxRange > 100000.0f ? "maxflt" : f"{(SelectedAttack.MaxRange):.2f}";
            FString MinRange = SelectedAttack.MinRange > 100000.0f ? "maxflt" : f"{(SelectedAttack.MinRange):.2f}";
            FString Range = SelectedAttack.Range > 100000.0f ? "maxflt" : f"{(SelectedAttack.Range):.2f}";
            ImGui::TextColored(FColor::Silver, "Attack Range: "); ImGui::SameLine(); ImGui::Text(Range);
            ImGui::TextColored(FColor::Silver, "MaxOverride: "); ImGui::SameLine(); ImGui::BoolIcon(SelectedAttack.bMaxRangeOverride);
            ImGui::TextColored(FColor::Silver, "Min Range: "); ImGui::SameLine(); ImGui::Text(MinRange);
            ImGui::TextColored(FColor::Silver, "Max Range: "); ImGui::SameLine(); ImGui::Text(SelectedAttack.bMaxRangeOverride ? Range : MaxRange);
            ImGui::TextColored(FColor::Silver, "Current Distance: "); ImGui::SameLine(); ImGui::Text(f"{(DistanceToCharacterOfInterest):.2f}");
        }
        ImGui::Text("\n");
    }

    void DisplayCurrentActions()
    {
        // Display Current Actions
        ImGui::TextColored(FColor::Yellow, "Current Actions");
        auto CurrentActionCM = CurrentActionCombatMove;
        if (IsValid(CurrentActionCM))
        {
            ImGui::Text(f"{CurrentActionCM.GetDisplayName()}");
            ImGui::SameLine();
            ImGui::TextColored(FColor::Silver, "Priority: " + FCombatActionPriority::GetPriorityName(ActionsHandler.CurrentAction.Priority));

            if (IsDoingMoveOfClass(CurrentActionCM.Class))
            {
                ImGui::SameLine();
                ImGui::TextColored(FColor::Yellow, Icon::PLAY_CIRCLE);
                ImGui::SetTooltipOnHover("Action already running");
            }
            else
            {
                FString Reason;
                bool bIsCombatMoveAllowed = CurrentActionCM.IsMoveAllowed(Reason);
                ImGui::SameLine();
                ImGui::BoolIcon(bIsCombatMoveAllowed);
                ImGui::SetTooltipOnHover(bIsCombatMoveAllowed ? "Allowed" : f"Not allowed - {Reason}");
            }

            ImGui::SameLine();
            ImGui::TextDisabled(f"Runtime: {CurrentActionCM.RuntimeSeconds:.1f}s");
        }
        else
        {
            ImGui::Text("No current actions");
        }
        ImGui::Text("\n");
    }

    void DisplayCurrentMovement()
    {
        // Display Current Movement
        ImGui::TextColored(FColor::Yellow, "Current Movement");
        if (IsValid(CurrentMovementCombatMove))
        {
            ImGui::TextColored(FColor::Silver, "Movement: ");
            ImGui::SameLine();
            ImGui::Text(f"{CurrentMovementCombatMove.GetDisplayName()}");

            if (IsDoingMoveOfClass(CurrentMovementCombatMove.Class))
            {
                ImGui::SameLine();
                ImGui::TextColored(FColor::Yellow, Icon::PLAY_CIRCLE);
                ImGui::SetTooltipOnHover("Movement already running");
            }
            else
            {
                FString Reason;
                bool bIsCombatMoveAllowed = CurrentMovementCombatMove.IsMoveAllowed(Reason);
                ImGui::SameLine();
                ImGui::BoolIcon(bIsCombatMoveAllowed);
                ImGui::SetTooltipOnHover(bIsCombatMoveAllowed ? "Allowed" : f"Not allowed - {Reason}");
            }
        }
        else
        {
            ImGui::Text("No current movement");
        }
        ImGui::Text("\n");
    }

    bool DisplayCurrentRunningChildmostNode(UCBT_Node PotentialNode, FString TreeIDPrefix = "")
    {
        if (!IsValid(PotentialNode))
            return false;

        if (PotentialNode.GetNodeStatus() != ECBT_NodeStatus::Running)
            return false;

        auto ControlFlow = Cast<UCBT_FlowControlNode>(PotentialNode);

        if (IsValid(ControlFlow))
        {
            for (auto ChildNode : ControlFlow.Nodes)
            {
                if (DisplayCurrentRunningChildmostNode(ChildNode))
                    return true;
            }
        }

        PotentialNode.DisplayImGui(TreeIDPrefix);
        return true;
    }

    /** Override to define what should be shown for this state when looking at it in the overview tree. */
    void DisplayImGuiInTreeView()
    {
        if (!IsValid(BehaviorController))
            return;

        if (!IsValid(BehaviorController.HighPriorityTree) || !IsValid(BehaviorController.MediumPriorityTree) || !IsValid(BehaviorController.LowPriorityTree) || !IsValid(BehaviorController.MovementTree))
            return;
        
        ImGui::Text("");
        ImGui::Separator();
        ImGui::Text("");

        ImGui::TextColored(FColor::Yellow, "High Priority Behaviors");
        bool bBehaviorDisplayed = false;
        BehaviorController.HighPriorityTree.DisplayImGui();
        
        ImGui::Text("");
        ImGui::Separator();
        ImGui::Text("");

        ImGui::TextColored(FColor::Yellow, "Medium Priority Behaviors");
        bBehaviorDisplayed = false;
        BehaviorController.MediumPriorityTree.DisplayImGui();

        ImGui::Text("");
        ImGui::Separator();
        ImGui::Text("");

        ImGui::TextColored(FColor::Yellow, "Low Priority Behaviors");
        bBehaviorDisplayed = false;
        BehaviorController.LowPriorityTree.DisplayImGui();

        ImGui::Text("");
        ImGui::Separator();
        ImGui::Text("");

        ImGui::TextColored(FColor::Yellow, "Movement Behaviors");
        bBehaviorDisplayed = false;
        BehaviorController.MovementTree.DisplayImGui();

        ImGui::Text("");
        ImGui::Separator();
        ImGui::Text("");
    }

    private void DisplayTraceVisitNode(uint32 TraceID, UCBT_Node Node)
    {
        if (!IsValid(Node))
            return;

        if (Node.NodeStatus != ECBT_NodeStatus::Running)
            return;
        
        if (!Node.IsA(UCBT_Root))
        {
            if (Node.IsBehavior)
            {
                ImGui::TraceFrameReportInSection(TraceID, Node, "Behavior : " + Node.GetBehaviorName(), FColor::Emerald);
            }
            else if (!Node.IsA(UCBT_Tree))
            {
                ImGui::TraceFrameReportInSection(TraceID, Node, Node.GetDisplayName());

                ImGui::TraceFrameSetSectionStatus(TraceID, Node, 
                    Node.GetResultString(ECBT_ExecutionResult::Running), 
                    Node.GetResultColor(ECBT_ExecutionResult::Running));

                ImGui::TraceSectionExtraInfo(TraceID, FColor::Silver, Node.GetDisplayName());
            }            
        }

        auto DoMoveNode = Cast<UCBT_DoMove>(Node);
        if (IsValid(DoMoveNode) && IsValid(DoMoveNode.Move) && DoMoveNode.NodeStatusResult == ECBT_NodeStatus::Running)
        {
            ImGui::TraceFrameReportInSection(TraceID, DoMoveNode.Move, DoMoveNode.Move.GetDisplayName());
            ImGui::TraceFrameReportTask(TraceID, DoMoveNode.RunningTask);
            ImGui::TraceFrameSetSectionStatus(TraceID, DoMoveNode.RunningTask, 
                Node.GetResultString(ECBT_ExecutionResult::Running), 
                Node.GetResultColor(ECBT_ExecutionResult::Running));
            ImGui::TraceFrameSetSectionStatus(TraceID, DoMoveNode.Move, 
                Node.GetResultString(ECBT_ExecutionResult::Running), 
                Node.GetResultColor(ECBT_ExecutionResult::Running));
            return;
        }

        auto TreeNode = Cast<UCBT_Tree>(Node);
        if (IsValid(TreeNode))
        {
            DisplayTraceVisitNode(TraceID, TreeNode.Node);
            return;
        }

        auto DoOperation = Cast<UCBT_DoOperation>(Node);
        if (IsValid(DoOperation))
        {
            ImGui::TraceFrameReportInSection(TraceID, DoOperation.Operation, DoOperation.Operation.GetDisplayName());
            ImGui::TraceFrameSetSectionStatus(TraceID, DoOperation.Operation, 
                Node.GetResultString(ECBT_ExecutionResult::Running), 
                Node.GetResultColor(ECBT_ExecutionResult::Running));
            return;
        }

        auto ControlFlow = Cast<UCBT_FlowControlNode>(Node);
        if (IsValid(ControlFlow))
        {
            for (auto ChildNode : ControlFlow.Nodes)
            {
                DisplayTraceVisitNode(TraceID, ChildNode);
            }

            return;
        }
    }

    void DisplayTrace()
    {
        if (!IsValid(BehaviorController))
            return;

        uint32 TraceID_Role = ImGui::MakeTraceID(this, "Role");
        uint32 TraceID_HighPriority = ImGui::MakeTraceID(BehaviorController.HighPriorityTree);
        uint32 TraceID_MediumPriority = ImGui::MakeTraceID(BehaviorController.MediumPriorityTree);
        uint32 TraceID_LowPriority = ImGui::MakeTraceID(BehaviorController.LowPriorityTree);
        uint32 TraceID_Movement = ImGui::MakeTraceID(BehaviorController.MovementTree);

        ImGui::TraceFrameBegin(TraceID_Role, World.TimeSeconds);
        ImGui::TraceFrameBegin(TraceID_HighPriority, World.TimeSeconds);
        ImGui::TraceFrameBegin(TraceID_MediumPriority, World.TimeSeconds);
        ImGui::TraceFrameBegin(TraceID_LowPriority, World.TimeSeconds);
        ImGui::TraceFrameBegin(TraceID_Movement, World.TimeSeconds);

        ImGui::TraceFrameReportInSection(TraceID_Role, FCombatGroupRole::GetRoleName(MyLastKnownOrder), !IsValid(CombatGroup) ? FColor::Transparent : CombatGroup.RoleSystem.GetCharactersRoleGroup(Self).DebugColor);
        ImGui::TraceFrameReportInSection(TraceID_HighPriority, "High Priority");
        ImGui::TraceFrameReportInSection(TraceID_MediumPriority, "Medium Priority");
        ImGui::TraceFrameReportInSection(TraceID_LowPriority, "Low Priority");
        ImGui::TraceFrameReportInSection(TraceID_Movement, "Movement");

        DisplayTraceVisitNode(TraceID_HighPriority,   BehaviorController.HighPriorityTree);
        DisplayTraceVisitNode(TraceID_MediumPriority, BehaviorController.MediumPriorityTree);
        DisplayTraceVisitNode(TraceID_LowPriority,    BehaviorController.LowPriorityTree);
        DisplayTraceVisitNode(TraceID_Movement,       BehaviorController.MovementTree);

        ImGui::TraceFrameEnd(TraceID_Role);
        ImGui::TraceFrameEnd(TraceID_HighPriority);
        ImGui::TraceFrameEnd(TraceID_MediumPriority);
        ImGui::TraceFrameEnd(TraceID_LowPriority);
        ImGui::TraceFrameEnd(TraceID_Movement);

        TArray<uint32> TraceIDs;

        TraceIDs.Add(TraceID_Role);
        TraceIDs.Add(TraceID_HighPriority);
        TraceIDs.Add(TraceID_MediumPriority);
        TraceIDs.Add(TraceID_LowPriority);
        TraceIDs.Add(TraceID_Movement);

        ImGui::TraceDrawMulti(TraceIDs, "Traces");
    }
#endif

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        Perception.HitOnSelf().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnMeHit");
        Perception.HitOnTarget().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnTargetHit");
        Perception.SeenCharacterLaunchMagicProjectileAtMe().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnOtherLaunchedProjectileAtMe");

        Perception.IncomingAttackAtSelf().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnIncomingAttack");

        Perception.IncomingAttackAtSelfReactionNotifyEntered().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnCanReactToIncomingAttack");

        Perception.LostSightOfCharacter().PerceptionLost.BindUFunction(this, n"PerceptionEvent_LostSenseOfCharacter");
    }

    UFUNCTION()
    private void PerceptionEvent_LostSenseOfCharacter(const FRememberedPerception&in Perception,
                                                      const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.Origin.CharacterState) || !IsValid(Perception.Origin.Character))
            return;

        if ((Perception.Origin.CharacterState.HasGameplayTag(GameplayTag::State_Transformed) ||
             Perception.Origin.CharacterState.HasGameplayTag(GameplayTag::State_Transforming)) &&
             Perception.Origin.Character == Perception.Origin.Character.GetActorInstigator())
            return;

        if (Self.Perception.CanSmell(Perception.Origin.Character))
            return;

        auto SensedLivingThreats = GetSensedLivingEnemies();
        SensedLivingThreats.Append(GetSensedLivingHostiles());

        if (SensedLivingThreats.Contains(Perception.Origin.Character))
        {
            SensedLivingThreats.Remove(Perception.Origin.Character);
        }

        if (!SensedLivingThreats.IsEmpty())
            return;

        AI.AssessEvent(GameplayTag::AIEvent_LostSense, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_OnCanReactToIncomingAttack(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        OwnedBehaviorTreeTickFlags.bCanReactToIncomingAttack = true;
    }

    void DefaultConfigValues() 
    {
        Config = FCombatConfig();
    }

    void TestConfigValues() {}

    UFUNCTION()
    bool CanTaunt()
    {
        if (Self.IsSwimming() && !bCanDoTauntsWhileSwimming)
            return false;

        if (Self.IsDiving() && !bCanDoTauntsWhileDiving)
            return false;
        
        auto CurrentRole = GetCurrentRole();
        switch (CurrentRole)
        {
            case ECombatRole::ActiveAttacker:
            {
                return Config.bActiveAttackerCanTaunt;
            }
            case ECombatRole::PassiveAttacker:
            {
                return Config.bPassiveAttackerCanTaunt;
            }
            default:
                return true;
        }
    }

    UFUNCTION()
    bool CanTarget()
    {
        return !Self.HasGameplayTag(GameplayTag::Combat_Disallow_Turns);
    }

    UFUNCTION()
    bool CanSprint()
    {
        return false;
    }

    void DoCombatStartTaunt() override
    {
        AI.ItemActionScoringEntryManager.UpdateAvailableItems();

        if (CanEquipWeapons())
        {
            AI.SelectBestItemActionFromInventory(GameplayTag::Item_Weapon);
            DrawSelectedWeapon();
        }

        if (Self.IsClimbingLadderOrWall())
            return;

        Super::DoCombatStartTaunt();
    }

    void DoPrepareCombatTick() override
    {
        AI.ItemActionScoringEntryManager.UpdateAvailableItems();

        if (CanEquipWeapons())
        {
            if (!CharacterState.HasGameplayTag(GameplayTag::State_Combat))
            {
                AI.SelectBestItemActionFromInventory(GameplayTag::Item_Weapon);
            }
            else
            {
                AI.SelectBestItemActionFromInventory();
            }

            if (IsValid(SelectedItem) && SelectedItem.ItemType.MatchesTag(GameplayTag::Item_Weapon))
            {
                DrawSelectedWeapon();
            }
        }


        UpdateAimingBehavior();

        if (!CanTarget() && IsValid(TargetCharacter))
        {
            AI.StopTargetingEnemy(FocusPriority);
        }

        if (IsValid(CharacterOfInterest) && !IsTargetingCharacterOfInterest() && Self.IsInCombat() && Config.bTargetCharacterOfInterest)
        {
            FHitResult HitResult;
            FVector Start = Self.ActorLocation + FVector::UpVector * Self.BaseEyeHeight;
            FVector End = CharacterOfInterest.ActorLocation + FVector::UpVector * CharacterOfInterest.BaseEyeHeight;
            if (CanTarget() &&
                System::LineTraceSingle(Start, End,
                    ETraceTypeQuery::Visibility, false, TArray<AActor>(), EDrawDebugTrace::None, HitResult, true))
            {
                AI.TargetCharacterOfInterest(FocusPriority, this);
            }
        }

        // Reset failure counters if last failure to attack was long ago
        if (TimeOfLastFailureToAttack.IsValid() && FInGameTime::Now().TotalSeconds - TimeOfLastFailureToAttack.TotalSeconds > 5.0f)
        {
            FailureToAttackCounter = 0;
            FailureToMoveCounter = 0;
        }

        EvaluateTrainingFightConditions();
    }

    void EvaluateTrainingFightConditions()
    {
        if (!CharacterState.IsInTrainingFight())
            return;

        if (!bUseTrainingArea || bEndCombatEventAssessed)
            return;

        if (!IsValid(CharacterOfInterest))
            return;
        
        if (!CharacterOfInterest.HasGameplayTag(GameplayTag::State_InsideTrainingArea))
        {
            FRememberedPerception EndCombatPerception;
            EndCombatPerception.Instigator.CharacterState = CharacterOfInterest.CharacterState;
            AI.AssessEvent(GameplayTag::AIEvent_TrainingFight_Victory, EndCombatPerception);
            bEndCombatEventAssessed = true;
            ResetSelectedAttack();
            return;
        }

        if (!CharacterState.HasGameplayTag(GameplayTag::State_InsideTrainingArea))
        {
            FRememberedPerception EndCombatPerception;
            EndCombatPerception.Instigator.CharacterState = CharacterOfInterest.CharacterState;
            AI.AssessEvent(GameplayTag::AIEvent_TrainingFight_Defeat, EndCombatPerception);
            bEndCombatEventAssessed = true;
            ResetSelectedAttack();
            return;
        }
    }

    void UpdateAimingBehavior()
    {
        if (Self.HasDrawnBow() && !Self.IsAiming())
        {
            AI.EnterAimingStance();
            return;
        }

        if (!Self.HasDrawnBow() && Self.IsAiming() && (!IsValid(CurrentActionCombatMove) || !CurrentActionCombatMove.IsA(UCM_UseArchery)))
        {
            AI.LeaveAimingStance();
            return;
        }
    }

    void DrawSelectedWeapon()
    {
        if (!IsValid(SelectedItem))
            return;

        if (!SelectedItem.IsA(UWeaponDefinition) && !SelectedItem.IsA(USpellContainer))
            return;

        if (SelectedItem == Self.CarryComponent.EquippedItemDefinition)
            return;

        if (!CanSwitchWeaponsRightNow())
            return;

        if (Self.IsDrawingOrUndrawingWeapon())
            return;

        if (Self.HasDrawnWeapon() &&
            (World.TimeSeconds - LastWeaponSwitchTimeSeconds <= 4.0f))
            return;
        
        // if (IsValid(Self.CarryComponent.EquippedItemDefinition))
        // {
        //     Print(f"Trying to draw item: {SelectedItem.Name}; current: {Self.CarryComponent.EquippedItemDefinition.Name}");
        // }
        // else
        // {
        //     Print(f"Trying to draw item: {SelectedItem.Name}; current: None");
        // }
        
        ResetSelectedAttack();
        AI.DrawItem(SelectedItem);
    }

    void OnBehaviorSetChanged() 
    {
        OwnedBehaviorTreeTickFlags.bBehaviorTreeChanged = true;   
    }

    /** Cancels all current actions and movement*/
    private void ResetBehaviors()
    {
        BehaviorController.CancelAllCurrentActionsAndMovement();

        AI.CancelTasksOfClass(UAITask_CombatMove::StaticClass());

        CurrentCombatBehaviorSet = nullptr;
    }

    protected void InitializeBehaviorSetsAndController()
    {
        BehaviorController = UCombatBehaviorController();
        BehaviorController.CreateRootNodes();

        for (auto BehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
        {
            for (auto Node : CommonBehavior_HighPriority.Nodes)
            {
                BehaviorSet.HighPriorityTree.DoNode(Node);
            }
            BehaviorSet.HighPriorityTree.Sort();

            for (auto Node : CommonBehavior_MediumPriority.Nodes)
            {
                BehaviorSet.MediumPriorityTree.DoNode(Node);
            }
            BehaviorSet.MediumPriorityTree.Sort();

            for (auto Node : CommonBehavior_LowPriority.Nodes)
            {
                BehaviorSet.LowPriorityTree.DoNode(Node);
            }
            BehaviorSet.LowPriorityTree.Sort();

            for (auto Node : CommonBehavior_Movement.Nodes)
            {
                BehaviorSet.MovementTree.DoNode(Node);
            }
            BehaviorSet.MovementTree.Sort();
        }
    }

    /** Generates the Cobmat Behavior Tree based on the agent's config parameters. */
    protected void SetupBehaviorTree()
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::SetupBehaviorTree"));

        if (!CanSwitchBehaviorsRightNow())
            return;

        if (Self.IsDoingAttack() || Self.IsDoingMagic())
            return;

        if (Self.IsBlocked())
            return;

        UCombatBehaviorSet SelectedBehaviorSet = nullptr;

        // Select the first allowed behavior set found
        for (auto BehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
        {
            FString Reason;
            if (!BehaviorSet.ShouldUseBehaviorAndRoleAllowsTo(Reason))
                continue;

            SelectedBehaviorSet = BehaviorSet;
            break;
        }

        // Do nothing if selected behavior set is already active
        if (SelectedBehaviorSet == CurrentCombatBehaviorSet)
        {
            return;
        }

        if (IsValid(SelectedBehaviorSet) && SelectedBehaviorSet.bBlockBehaviorSwitchWhenAttackSelected && IsValid(SelectedAttack))
            return;

        // Set current behavior to nullptr if no behavior was selected
        if (!IsValid(SelectedBehaviorSet))
        {
            CurrentCombatBehaviorSet = nullptr;
            return;
        }

        // Activate newly selected behavior set
        ResetBehaviors();
        CurrentCombatBehaviorSet = SelectedBehaviorSet;
        int UsageCount = 0;
        BehaviorSetUsageCounter.Find(CurrentCombatBehaviorSet.Class, UsageCount);
        BehaviorSetUsageCounter.Add(CurrentCombatBehaviorSet.Class, UsageCount + 1);

        BehaviorController.HighPriorityTree = SelectedBehaviorSet.HighPriorityTree;
        BehaviorController.MediumPriorityTree = SelectedBehaviorSet.MediumPriorityTree;
        BehaviorController.LowPriorityTree = SelectedBehaviorSet.LowPriorityTree;
        BehaviorController.MovementTree = SelectedBehaviorSet.MovementTree;
        DefaultConfigValues();
        SelectedBehaviorSet.SetupConfigValues();

        ResetSelectedAttack();
        OnBehaviorSetChanged();
    }

    bool CanSwitchBehaviorsRightNow()
    {
        FGameplayTagContainer BlockBehaviorSwitchTags;
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryAim);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryAimedShot);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryDraw);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryQuickShot);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_CastSpell);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ConsumeItem);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_Dodge);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ExecuteCharacter);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_Interact);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_LockRoles);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_MeleeAttack);
        if (Self.HasAnyGameplayTags(BlockBehaviorSwitchTags))
            return false;

        return true;
    }

    bool CanSwitchWeaponsRightNow()
    {
        FGameplayTagContainer BlockBehaviorSwitchTags;
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryAim);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryAimedShot);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryDraw);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ArcheryQuickShot);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_CastSpell);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ConsumeItem);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_Dodge);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_ExecuteCharacter);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_Interact);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_LockRoles);
        BlockBehaviorSwitchTags.AddTag(GameplayTag::AICombatMove_MeleeAttack);
        if (Self.HasAnyGameplayTags(BlockBehaviorSwitchTags))
            return false;

        return true;
    }

    void SetupFitnessMultipliers() override
    {
        // Try to keep multipliers that can return values < 1.0f at the top
        AddFitnessMultiplier(UCFM_ShouldNotAttack());
        //AddFitnessMultiplier(UCFM_NotInFrontOfTarget());
        AddFitnessMultiplier(UCFM_CurrentlyIsUsingArcherWeapon());
        AddFitnessMultiplier(UCFM_MovementAndAttackFailures());
        //AddFitnessMultiplier(UCFM_StrengthRatio());
        //AddFitnessMultiplier(UCFM_HitByTargetRecently());
        //AddFitnessMultiplier(UCFM_CurrentlyActiveAttacker());
        //AddFitnessMultiplier(UCFM_CurrentlyPassiveAttacker());
        AddFitnessMultiplier(UCFM_Priority());
        AddFitnessMultiplier(UCFM_RangeToTarget());
    }

    /** Called when combat begins, before entering the combat-loop. */
    void DoPrepareForCombat() override
    {
        InitializeCombatPositioning();
        auto test = CharacterState.GetAreaTagOfLocation();
        Territory = UTerritorySubsystem::Get().GetTerritoryByAssociatedAreaTag(CharacterState.GetAreaTagOfLocation(), AbilitySystemComponent);
        
        Super::DoPrepareForCombat();

        // for (auto TestingBehaviorClass : UClass::FindAllClassesInheritingFrom(UTestingBehaviorSet::StaticClass()))
        // {
        //     TestingBehaviorSets.Add(Cast<UTestingBehaviorSet>(NewObject(nullptr, TestingBehaviorClass)));
        // }

        AI.StopFollowingActor(CharacterOfInterest);
        Self.SetMovementLocked(false);

        if (Self.IsHuman() && Self.IsCurrentlyPerceiving(CharacterOfInterest) && Config.bTargetCharacterOfInterest)
        {
            AI.TargetCharacterOfInterest(FocusPriority, this);
        }

        SetupFitnessMultipliers();

        AI.ItemActionScoringEntryManager.UpdateAvailableItems();

        if (CanEquipWeapons())
        {
            AI.SelectBestItemActionFromInventory(GameplayTag::Item_Weapon);
            DrawSelectedWeapon();
        }

        InitializeBehaviorSetsAndController();
        SetupBehaviorTree();

        SetTagCooldown(GameplayTag::Action_Taunt, 5.0f);
        SetClassCooldown(UCM_Taunt, 5.0f);
        NullTargetEndCombatTime = FInGameTime::XRealtimeSecondsFromNow(5.0f);

        SetupTrainingFight();
    }

    void SetupTrainingFight()
    {
        if (!CharacterState.IsInTrainingFight())
            return;

        if (!IsValid(CharacterOfInterest))
            return;
        
        if (CharacterOfInterest.HasGameplayTag(GameplayTag::State_InsideTrainingArea) &&
            CharacterState.HasGameplayTag(GameplayTag::State_InsideTrainingArea))
        {
            bUseTrainingArea = true;
        }
    }

    void InitializeCombatPositioning()
    {
        Positioning = UAICombatPositioning(this);
    }

    /** Is the current state a substate? */
    bool IsCombatSubstate() const
    {
        auto ActiveCombatState = AI.FindActiveStateByClass(UAIState_Combat);
        if (!IsValid(ActiveCombatState))
            return false;

        if (ActiveCombatState == this)
            return false;

        return true;
    }

    bool WasLastCombatMove(TSubclassOf<UAITask_CombatMove> MoveType)
    {
        if (!LastCombatMoveType.IsValid())
            return false;

        return LastCombatMoveType.Get().IsChildOf(MoveType);
    }
    
    /** Called after the combat-loop. The enemy might be dead here or they fled, or maybe we fled? */
    void DoEndCombat() override
    {
        if (!IsCombatSubstate())
        {            
            //AI.StopTargetingEnemy(FocusPriority);
            AI.LeaveGroupsWithClass(UAIGroup_Combat);

            if (AI.IsStrafeMovementEnabled())
            {
                DisableStrafeMovementAndTurnToTargetMode();
            }
        }
    }

    void ValidateSelectedAttack()
    {
        if (!IsAttackSelected())
            return;
        
        if (DistanceToCharacterOfInterest < 0.0f)
        {
            // Print(f"{CharacterState.CharacterUniqueName}: SelectedAttackReset - CharacterOfInterest Invalid");
            ResetSelectedAttack();
            return;
        }

        FString Reason;
        if (!IsSelectedAttackValid(Reason))
        {
// #if WITH_IMGUI
//             FString AttackNotAllowedReason;

//             if (!SelectedAttack.IsMoveAllowed(AttackNotAllowedReason))
//             {
//                 Reason += " " + AttackNotAllowedReason;
//             }

//             DebugScript::DrawText(Self.ActorLocation, ImGuiLastAttackValidationFailReason, FColor::Red, 1, 3);

// #endif
            ResetSelectedAttack();

            return;
        }
    }

    bool ShouldAttack() override
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        if (!CharacterState.IsInTrainingFightAgainst(CharacterOfInterest.CharacterState))
            return true;

        if (!TrackerTargetsHaveDrawnWeapon.Contains(CharacterOfInterest.CharacterState))
            return false;

        return true;
    }

    bool IsSelectedAttackValid(FString& Reason)
    {
        if (!IsValid(SelectedAttack))
        {
            Reason = "Invalid SelectedAttack Object";
            return false;
        }
        
        FString NotSelectableReason;
        if (!SelectedAttack.IsSelectable(NotSelectableReason))
        {
            Reason = "Attack no longer Selectable (" + NotSelectableReason + ")";
            return false;
        }

        if (IsValid(CharacterOfInterest) && CharacterOfInterest.IsDead())
        {
            Reason = "CharacterOfInterest is dead";
            return false;
        }

        if (!ShouldAttack() || SelectedAttack.ShouldInvalidateAttack())
        {
            Reason = "Should no longer attack";
            return false;
        }

        // if (SelectedAttackHandler.IsAttackSelectionOlderThanFailsafeTime() && 
        //     !IsDoingMoveOfClass(UCM_Movement) && !IsDoingMoveOfClass(UCM_Attack))
        // {
        //     Reason = "Failsave timeout";
        //     return false;
        // }

        if (!IsValid(AI))
        {
            Reason = "AI Invalid";
            return false;        
        }
        
        // if (IsValid(CharacterOfInterest) && AI.GetPreferredLocationConflictDistanceFromCharacter(CharacterOfInterest) >= AI.GetConflictDistanceToPreferredLocationThreshold() + SelectedAttack.Range)
        //     return false;

        return true;
    }

    void ResetSelectedAttack()
    {
        if (!IsValid(_SelectedAttackHandler) || !IsValid(SelectedAttack))
            return;

        _SelectedAttackHandler = nullptr;
        OnSelectedAttackChanged();
    }

    void DoCombatAction() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::DoCombatAction")); 
        Super::DoCombatAction();

        if (bEndCombatEventAssessed)
            return;

        // EvaluateDisengage();
        ValidateSelectedAttack();
        SetStrafing();

        AGothicCharacter PreviousTarget = CharacterOfInterest;
        AGothicCharacter NewTarget = PreviousTarget;

        // Queue target selection onto budget
        if (BudgetSystem::BeginTickRequest(this, BudgetWorkload::CombatAI, TargetSelectionName))
        {
            auto AvailableTargets = AI.GetAvailableTargets();
            AI.CombatTargetScoringEntryManager.UpdateAvailableTargets(AvailableTargets);

            NewTarget = SelectTarget();
            if (IsValid(NewTarget))
            {
                NullTargetEndCombatTime = FInGameTime::XRealtimeSecondsFromNow(2.0f);
            }
            else
            {
                // Print("No valid target");
            }

            // Has been without a target for too long
            if (NullTargetEndCombatTime.IsTimeInThePast())
            {
                FRememberedPerception FakePerception;
                AI.AssessEvent(GameplayTag::AIEvent_State_Done, FakePerception);
                BudgetSystem::EndTickRequest();
                
                WaitSeconds(1.0f);
                EndTaskAsSuccess();
                return;
            }

            BudgetSystem::EndTickRequest();
        }

        if (IsValid(CharacterOfInterest) && CharacterOfInterest.HasDrawnWeapon())
        {
            TrackerTargetsHaveDrawnWeapon.Add(CharacterOfInterest.CharacterState);
        }

        CheckTargetChanged(PreviousTarget, NewTarget);        

        if (!IsValid(CombatGroup)) 
            return;

        ECombatRole Role = CombatGroup.RoleSystem.GetCharactersRoleType(Self);
        if (RoleLastFrame != Role)
        {
            OnCombatRoleChanged();
        }
        
        // Tick high priority only or medium and low trees based on Tree tick flags
        if (OwnedBehaviorTreeTickFlags.HasAllFlagsOf(HighPriorityTreeRequiredTickFlags))
        {
            OwnedBehaviorTreeTickFlags.Reset();
            TickHighPriorityBehaviorTree();
        }
        else
        {
            SetupBehaviorTree();

            if (OwnedBehaviorTreeTickFlags.HasAllFlagsOf(BasePriorityTreeRequiredTickFlags) || !IsValid(CurrentActionCombatMove))
            {
                OwnedBehaviorTreeTickFlags.Reset();
                QueueBehaviorTreesOntoBudget();
            }
        }

        RoleLastFrame = Role;
    }

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::TickTask"));     
        Super::TickTask(DeltaTimeSecs);        

        if (IsValid(CurrentCombatBehaviorSet))
        {
            FScopeCycleCounter ScopeCycleCounterBehaviorSet(FStatID(n"AIState_Combat_G1R::TickTask/TickBehaviorSet"));

            CurrentCombatBehaviorSet.TickBehaviorSet(DeltaTimeSecs);
        }

        TickCooldowns(float32(DeltaTimeSecs));
    }

    void TickHighPriorityBehaviorTree()
    {
        if (!IsValid(BehaviorController))
            return;

        if (!IsValid(BehaviorController.HighPriorityTree))
            return;

        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::TickMainBehaviorTree"));

        BehaviorController.HighPriorityTree.ExecuteTick();
    }

    void QueueBehaviorTreesOntoBudget()
    {
        if (!IsValid(BehaviorController))
            return;

        if (!IsValid(BehaviorController.MediumPriorityTree) || !IsValid(BehaviorController.LowPriorityTree) || !IsValid(BehaviorController.MovementTree))
            return;

        // Queue main behavior tree tick onto budget
        if (BudgetSystem::BeginTickRequest(this, BudgetWorkload::CombatAI, TickBehaviorTree_MediumPriority_Name))
        {
            FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::TickBehaviorTree_MediumPriority"));

            BehaviorController.MediumPriorityTree.ExecuteTick();

            BudgetSystem::EndTickRequest();
        }

        // Queue secondary behavior tree tick onto budget
        if (BudgetSystem::BeginTickRequest(this, BudgetWorkload::CombatAI, TickBehaviorTree_LowPriority_Name))
        {
            FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::TickBehaviorTree_LowPriority"));

            BehaviorController.LowPriorityTree.ExecuteTick();

            BudgetSystem::EndTickRequest();
        }

        // Queue movement behavior tree tick onto budget
        if (BudgetSystem::BeginTickRequest(this, BudgetWorkload::CombatAI, TickBehaviorTree_Movement_Name))
        {
            FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::TickBehaviorTree_Movement"));

            BehaviorController.MovementTree.ExecuteTick();

            BudgetSystem::EndTickRequest();
        }
    }

    protected void ResetCooldowns()
    {
        ActiveMoveTypeCooldowns.Reset();
        MoveClassCooldowns.Reset();
        BehaviorTreeNodeCooldowns.Reset();
    }

    /** Updates all active cooldowns. To be called every tick combat is active. */
    protected void TickCooldowns(float32 DeltaTimeSecs)
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::TickCooldowns"));

        for (auto& Pair : ActiveMoveTypeCooldowns)
        {
            Pair.SetValue(Pair.Value - DeltaTimeSecs);

            if (Pair.Value <= 0.0f)
            {
                Pair.RemoveCurrent();
            }
        }

        for (auto& Pair : MoveClassCooldowns)
        {
            Pair.SetValue(Pair.Value - DeltaTimeSecs);

            if (Pair.Value <= 0.0f)
            {
                Pair.RemoveCurrent();
            }
        }

        TMap<FString, float> FinishedCooldowns;
        for (auto& Pair : BehaviorTreeNodeCooldowns)
        {
            FGameplayTagContainer RequiredTags;
            if (BehaviorTreeNodeCooldownTickRequirementTags.Find(Pair.Key, RequiredTags) && !CharacterState.HasAllGameplayTags(RequiredTags))
                continue;
            
            FGameplayTagContainer BlockingTags;
            if (BehaviorTreeNodeCooldownTickBlockingTags.Find(Pair.Key, BlockingTags) && CharacterState.HasAnyGameplayTags(BlockingTags))
                continue;

            Pair.SetValue(FVector2f(Pair.Value.X - DeltaTimeSecs, Pair.Value.Y));

            if (Pair.Value.X <= 0.0f)
            {
                BehaviorTreeNodeCooldownTickRequirementTags.Remove(Pair.Key);
                BehaviorTreeNodeCooldownTickBlockingTags.Remove(Pair.Key);
                
                FinishedCooldowns.Add(Pair.Key, Pair.Value.Y);
                Pair.RemoveCurrent();
            }
        }

        for (auto Cooldown : FinishedCooldowns)
        {
            OnBehaviorTreeNodeCooldownEnded(Cooldown.Key, Cooldown.Value);
        }

        if (!FinishedCooldowns.IsEmpty())
        {
            OnCooldownEnded();
        }
    }

    void OnCooldownEnded()
    {
        
    }

    void OnBehaviorTreeNodeCooldownEnded(FString ID, float SortLayer)
    {        
        if (!IsValid(BehaviorController) || !IsValid(BehaviorController.MediumPriorityTree) || !IsValid(BehaviorController.MediumPriorityTree.CurrentMoveNode))
            return;
        
        bool bMainActionBTIsWaitingToAttack = BehaviorController.MediumPriorityTree.CurrentMoveNode.IsA(UCBT_ExecuteSelectedAttack::StaticClass()) && !Self.IsDoingAttack();
        bool bAttackSelected = IsAttackSelected();

        if (bMainActionBTIsWaitingToAttack && !bAttackSelected)
        {
            BehaviorController.CancelAllCurrentActions();
            return;
        }

        if (!bAttackSelected)
            return;

        if (SelectedAttackHandler.AttackBehaviorSortLayer <= SortLayer)
            return;

        ResetSelectedAttack();

        if (!bMainActionBTIsWaitingToAttack)
            return;

        BehaviorController.CancelAllCurrentActions();
    }

    void SetTagCooldown(FGameplayTag Tag, float Cooldown)
    {
        auto RootState = GetRootCombatState();

        float ExistingCooldown = 0.0f;
        if (RootState.ActiveMoveTypeCooldowns.Find(Tag, ExistingCooldown))
        {
            RootState.ActiveMoveTypeCooldowns[Tag] = Math::Max(ExistingCooldown, Cooldown);
        }
        else
        {
            RootState.ActiveMoveTypeCooldowns.Add(Tag, Cooldown);
        }
    }

    void SetClassCooldown(TSubclassOf<UAITask_CombatMove> ClassToSetOnCooldown, float Cooldown)
    {
        MoveClassCooldowns.Add(ClassToSetOnCooldown, Cooldown);
    }

    void SetBehaviorTreeNodeCooldown(UBehaviorTreeCooldownProfile BTCooldownProfile)
    {
        if (BTCooldownProfile.MaxCooldownTimeSeconds <= 0.0f)
            return;

        if (BTCooldownProfile.MaxCooldownTimeSeconds == BTCooldownProfile.MinCooldownTimeSeconds)
        {
            BehaviorTreeNodeCooldowns.Add(BTCooldownProfile.Id, FVector2f(BTCooldownProfile.MaxCooldownTimeSeconds, BTCooldownProfile.SortLayer));
            
            if (!BTCooldownProfile.BlockTickingOnOwnedTags.IsEmpty())
            {
                BehaviorTreeNodeCooldownTickBlockingTags.Add(BTCooldownProfile.Id, BTCooldownProfile.BlockTickingOnOwnedTags);
            }

            if (!BTCooldownProfile.RequireOwnedTagsToTick.IsEmpty())
            {
                BehaviorTreeNodeCooldownTickRequirementTags.Add(BTCooldownProfile.Id, BTCooldownProfile.RequireOwnedTagsToTick);
            }
            return;
        }

        BehaviorTreeNodeCooldowns.Add(BTCooldownProfile.Id, FVector2f(Math::RandRange(BTCooldownProfile.MinCooldownTimeSeconds, BTCooldownProfile.MaxCooldownTimeSeconds), BTCooldownProfile.SortLayer));
        return;
    }

    /** Returns how much time of cooldown is left for the given move. */
    float GetMoveCooldownSecondsLeft(UAITask_CombatMove MoveToBePerformed) const
    {
        float MaxTime = 0.0f;

        if (MoveClassCooldowns.Contains(MoveToBePerformed.Class))
        {
            MaxTime = MoveClassCooldowns[MoveToBePerformed.Class];
        }

        for (auto& MoveType : MoveToBePerformed.MoveTypes.GameplayTags)
        {
            float TagCooldown = GetTagCooldownSecondsLeft(MoveType);
            if (MaxTime >= TagCooldown)
                continue;

            MaxTime = TagCooldown;
        }

        return MaxTime;
    }

    /** Returns how much time of cooldown is left for the given tag */
    float GetTagCooldownSecondsLeft(FGameplayTag Tag) const
    {
        for (auto& ActiveCooldown : ActiveMoveTypeCooldowns)
        {
            if (!Tag.MatchesTag(ActiveCooldown.Key))
                continue;

            return ActiveCooldown.Value;
        }

        return 0.0f;
    }

    /** Returns how much time of cooldown is left for the given Behavior Tree Branch Cooldown node */
    float GetBehaviorTreeNodeCooldownSecondsLeft(UBehaviorTreeCooldownProfile BTCooldownProfile) const
    {
        FVector2f BehaviorTreeNodeCooldownData = FVector2f();
        BehaviorTreeNodeCooldowns.Find(BTCooldownProfile.Id, BehaviorTreeNodeCooldownData);
        float CooldownRemaining = BehaviorTreeNodeCooldownData.X;

        return CooldownRemaining;
    }

    void HandlePerformedMove(TSubclassOf<UAITask_CombatMove> CombatMoveClass, FGameplayTagContainer CombatMoveTypes)
    {
        if (!IsValid(CombatGroup))
            return;

        CombatGroup.HandleMemberPerformedMove(Self, CombatMoveTypes);
    }

    /** Returns true if this move has been done recently and is still cooling down. */
    bool IsMoveInCooldown(UAITask_CombatMove MoveToBePerformed) const
    {
        return GetMoveCooldownSecondsLeft(MoveToBePerformed) > 0.0f;
    }

    /** Access to the main combat state. Returns this*/
    UAIState_Combat_G1R GetRootCombatState() const
    {
        return AI.FindActiveStateByClass(UAIState_Combat_G1R);
    }

    TSubclassOf<UAIGroup_Combat> GetCombatGroupClass() const
    {
        return CombatGroupClass;
    }

    void SetCombatGroupClass(TSubclassOf<UAIGroup_Combat> InCombatGroupClass)
    {
        CombatGroupClass = InCombatGroupClass;
    }

    /** Whether we're currently doing any move that matches the given tag. */
    bool IsDoingMoveWithTag(FGameplayTag Tag) const
    {
        if (IsValid(ActionsHandler) && IsValid(ActionsHandler.CurrentAction) &&
            ActionsHandler.CurrentAction.CombatMove.MoveTypes.HasTag(Tag))
            return true;

        if (IsValid(ActionsHandler) && IsValid(ActionsHandler.CurrentMovement) &&
            ActionsHandler.CurrentMovement.CombatMove.MoveTypes.HasTag(Tag))
            return true;

        for (auto Task : AI.ActiveAITasks)
        {
            auto Move = Cast<UAITask_CombatMove>(Task);

            if (!IsValid(Move))
                continue;

            if (Move.MoveTypes.HasTag(Tag))
                return true;
        }

        return false;
    }

    bool IsDoingMoveOfClass(TSubclassOf<UAITask_CombatMove> CombatMoveClass)
    {
        if (IsValid(ActionsHandler) && IsValid(ActionsHandler.CurrentAction) &&
            ActionsHandler.CurrentAction.CombatMove.IsA(CombatMoveClass))
            return true;

        if (IsValid(ActionsHandler) && IsValid(ActionsHandler.CurrentMovement) &&
            ActionsHandler.CurrentMovement.CombatMove.IsA(CombatMoveClass))
            return true;

        for (auto Task : AI.ActiveAITasks)
        {
            if (Task.IsA(CombatMoveClass))
                return true;
        }

        return false;
    }

    /** Selects the starting target and sets Other to it, should leave the current combat group and join / create one with the selected target */
    AGothicCharacter SelectTarget()
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat_G1R::SelectTarget"));

        AGothicCharacter Target = nullptr;
        AGothicCharacter BestTarget = AI.CombatTargetScoringEntryManager.HighestScoredTargetCharacter;
        if (IsValid(PriorityTarget) && !PriorityTarget.IsDead() && !PriorityTarget.IsDefeated() && Self.IsEnemyTowards(PriorityTarget))
        {
            if (IsValid(BestTarget) && BestTarget.CharacterState.SummonedBy() == PriorityTarget.CharacterState)
            {
                Target = BestTarget;
            }
            else
            {
                Target = PriorityTarget;
            }
        }

        if (!IsValid(Target))
        {
            if (!IsValid(BestTarget))
            {
                ResetTarget();
                return Target;
            }

            Target = BestTarget;

            if (!IsValid(Target))
            {
                ResetTarget();
                return Target;
            }
        }

        if (Target == CharacterOfInterest && IsValid(CombatGroup) && CombatGroup.TargetEnemy == Target)
            return Target;

        UnbindCharacterOfInterestOnOwnedTagUpdated();
        JoinGroupAgainstTarget(Target);
        TryBindCharacterOfInterestOnOwnedTagUpdated();
        CharacterOfInterest = Target;

        if (IsGroupLeader()) 
        {
            CombatGroup.SetGroupTarget(CharacterOfInterest);
        }

        return CharacterOfInterest;
    }

    void ResetTarget()
    {
        UnbindCharacterOfInterestOnOwnedTagUpdated();
        AI.LeaveGroupsWithClass(UAIGroup_Combat);
        CharacterOfInterest = nullptr;
        AI.StopTargetingEnemy(FocusPriority);
    }

    void UnbindCharacterOfInterestOnOwnedTagUpdated()
    {
        if (IsValid(CharacterOfInterest))
        {
            CharacterOfInterest.GetGothicAbilitySystemComponent().OnOwnedTagUpdated.UnbindObject(this);
        }
    }

    void TryBindCharacterOfInterestOnOwnedTagUpdated()
    {
        if (IsValid(CharacterOfInterest))
        {
            CharacterOfInterest.GetGothicAbilitySystemComponent().OnOwnedTagUpdated.AddUFunction(this, n"HandleTargetTagUpdated");
        }
    }

    void CheckTargetChanged(AGothicCharacter PreviousTarget, AGothicCharacter NewTarget)
    {
        FScopeCycleCounter ScopeCycleCounterBehaviorSet(FStatID(n"AIState_Combat_G1R::CheckTargetChanged"));

        if (PreviousTarget == NewTarget)
            return;

        OnTargetChanged();
    }

    void OnTargetChanged()
    {
        OwnedBehaviorTreeTickFlags.bTargetChanged = true;
        // AI.CheckAnyHostilesOrEnemiesSensed(FRememberedPerception(), true);

        BehaviorController.CancelCurrentMovement();

        DefaultConfigValues();
        
        if (IsValid(CurrentCombatBehaviorSet))
        {
            CurrentCombatBehaviorSet.SetupConfigValues();
        }
    }

    void OnCombatRoleChanged()
    {
        OwnedBehaviorTreeTickFlags.bRoleChanged = true;

        BehaviorController.CancelCurrentMovement();

        DefaultConfigValues();

        if (IsValid(CurrentCombatBehaviorSet))
        {
            CurrentCombatBehaviorSet.SetupConfigValues();
        }
    }

    UFUNCTION()
    private void HandleTargetTagUpdated(const FGameplayTag&in Tag, bool TagExists)
    {
        FGameplayTagContainer AlteredStateTags;
        AlteredStateTags.AddTag(GameplayTag::Debuff_Freeze);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Burn);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Paralyzed);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Electrified);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Charm);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Fear);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Sleep);
        AlteredStateTags.AddTag(GameplayTag::Debuff_Wind);

        if (!Tag.MatchesAny(AlteredStateTags))
            return;

        if (!TagExists)
        {
            SetupBehaviorTree();
        }
    }

    /** Calculates the target from sensed enemies based on prefferences and returns it */
    AGothicCharacter GetPreferredTarget()
    {
        // TODO
        return nullptr;
    }

    float64 DamageReceivedInTheLastSeconds(float64 TimeSeconds)
    {
        return Self.Perception.Memory
            .Filter()
            .FilterRecent(TimeSeconds)
            .FilterAffectedCharacterIs(Self)
            .FilterByType(GameplayTag::Perception_Attack_Hit_Damaged)
            .MagnitudeSum;
    }

    float64 DamageDealtInTheLastSeconds(float64 TimeSeconds)
    {
        return Self.Perception.Memory
            .Filter()
            .FilterRecent(TimeSeconds)
            .FilterInstigatorCharacterIs(Self)
            .FilterByType(GameplayTag::Perception_Attack_Hit_Damaged)
            .MagnitudeSum;
    }

    int HitsReceivedInTheLastSeconds(float64 TimeSeconds)
    {
        int Sum = 0;
        
        Sum += Self.Perception.Memory
            .Filter()
            .FilterAffectedCharacterIs(Self)
            .FilterByType(GameplayTag::Perception_Attack_Hit)
            .FilterRecent(TimeSeconds)
            .Count;

        return Sum;
    }

    int HitsDealtInTheLastSeconds(float64 TimeSeconds)
    {
        int Sum = 0;

        Sum += Self.Perception.Memory
            .Filter()
            .FilterInstigatorCharacterIsNot(Self)
            .FilterByType(GameplayTag::Perception_Attack_Hit_Blocked)
            .FilterRecent(TimeSeconds)
            .Count;

        Sum += Self.Perception.Memory
            .Filter()
            .FilterInstigatorCharacterIsNot(Self)
            .FilterByType(GameplayTag::Event_Damaged_Me_After)
            .FilterRecent(TimeSeconds)
            .Count;

        return Sum;
    }

    UFUNCTION()
    private void PerceptionEvent_OnMeHit(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        bForgotLastHit = false;

        if (IsValid(CombatGroup))
        {
            CombatGroup.HandleMemberGotHit(Self, Cast<AGothicCharacter>(Perception.Instigator.Character));
        }        

        if (Perception.Magnitude <= 0.0f)
            return;

        bReceivedDamageThisCombat = true;
        
        if (Perception.Instigator.Character == Perception.EffectCauser)
            return;

        PutCooldownsOnDamagedIfNotImmuneSuperArmor();
    }

    UFUNCTION()
    private void PerceptionEvent_OnOtherHit(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        
    }

    UFUNCTION()
    private void PerceptionEvent_OnOtherLaunchedProjectileAtMe(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {

    }

    UFUNCTION()
    private void PerceptionEvent_OnTargetHit(const FRememberedPerception&in Perception,
                                            const FPerceptionShortTermMemory&in Memory)
    {
        bDealtDamageThisCombat = true;
    }

    UFUNCTION()
    private void PerceptionEvent_OnIncomingAttack(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        SensedIncomingAttacks.Add(USensedIncommingAttack(Perception));
    }

    UFUNCTION()
    void OnCombatMoveFinished(UAITask_CombatMove CombatMove)
    {
        OwnedBehaviorTreeTickFlags.bCombatMoveEnded = true;

        if(!IsValid(this))
            return;

        PutCooldownsOnMoveEnded(CombatMove.Class);
    }

    bool HasEnemyDamagedAnyAllyThisCombat()
    {
        if (!IsValid(CombatGroup))
            return bReceivedDamageThisCombat;

        return CombatGroup.bMemberDamaged;
    }

    void PutCooldownsOnMoveEnded(TSubclassOf<UAITask_CombatMove> MoveEndedClass)
    {
        if (!CooldownsOnMoveEnded.Items.Contains(MoveEndedClass))
            return;

        for (auto MoveToPutIntoCooldown : CooldownsOnMoveEnded.Items[MoveEndedClass].MovesToPutOnCooldown)
        {
            PutMoveOnCooldown(MoveToPutIntoCooldown, CooldownsOnMoveEnded.Items[MoveEndedClass]._Cooldown);
        }
    }

    void PutCooldownsOnDamagedIfNotImmuneSuperArmor()
    {
        if (Self.HasImmunitySuperArmorTag())
            return;

        for (auto MoveToPutIntoCooldown : MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor)
        {
            PutMoveOnCooldown(MoveToPutIntoCooldown, MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor);
        }
    }

    void PutMoveOnCooldown(TSubclassOf<UAITask_CombatMove> MoveToPutIntoCooldownClass, float Cooldown)
    {
        for (auto& MoveTypeCooldown : Cast<UAITask_CombatMove>(MoveToPutIntoCooldownClass.Get().DefaultObject).MoveTypeCooldowns)
        {
            SetTagCooldown(MoveTypeCooldown.Key, Cooldown);
        }

        SetClassCooldown(MoveToPutIntoCooldownClass, Cooldown);
    }

    float32 GetAttackBehaviorCooldownMultiplierBasedOnSkill()
    {
        if (Self.IsCurrentlyDrawnWeaponSkillTrained())
        {
            return Config.AttackBehaviorCooldownMultiplier_Trained;
        }
        else if (Self.IsCurrentlyDrawnWeaponSkillMaster())
        {
            return Config.AttackBehaviorCooldownMultiplier_Master;
        }

        return 1.0f;
    }

    float GetChanceToCloseCombo(int NumAttacksDone)
    {
        if (Config.ChanceToCloseCombo.Num() < NumAttacksDone)
        {
            if (NumAttacksDone >= Config.MaximumNumberOfAttacksPerCombo)
                return 1.0f;
            else
                return 0.0f;
        }

        return Config.ChanceToCloseCombo[NumAttacksDone - 1];
    }

    /** Set the chance for a combo to be closed afer doing NumAttacksDone attacks */
    void SetChanceToCloseCombo(int NumAttacksDone, float Probability)
    {
        if (NumAttacksDone == 0)
            return;

        int AmountToAdd = NumAttacksDone - Config.ChanceToCloseCombo.Num();

        if (AmountToAdd != 0)
        {
            int AmountToSet = Math::Max(0, Config.ChanceToCloseCombo.Num() + AmountToAdd);
            Config.ChanceToCloseCombo.SetNum(AmountToSet);
        }

        Config.ChanceToCloseCombo[NumAttacksDone - 1] = Probability;
    }

    UAITask_CombatMove GetCurrentActionCombatMove() const property
    {
        if (!IsValid(ActionsHandler))
            return nullptr;

        if (!IsValid(ActionsHandler.ActiveActionTask))
            return nullptr;

        return ActionsHandler.ActiveActionTask;
    }

    UAITask_CombatMove GetCurrentMovementCombatMove() const property
    {
        if (!IsValid(ActionsHandler))
            return nullptr;

        if (!IsValid(ActionsHandler.ActiveMovementTask))
            return nullptr;

        return ActionsHandler.ActiveMovementTask;
    }

    UCombatActionsHandler GetActionsHandler() const property
    {
        if (!IsValid(BehaviorController))
            return nullptr;
        
        return BehaviorController.ActionsHandler;
    }

    bool IsTargetReachableInMelee(float MeleeReach = 150.0f) const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        if (!Self.IsSwimming() && !Self.IsDiving() && 
            IsTargetInWater() &&
            !AI.bCanReachSwimmingTargetFromLand)
        {
            return false;
        }
        
        float HorizontalReach = MeleeReach;
        float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 2 + CharacterOfInterest.SimpleCollisionHalfHeight;

        FVector Location;
        if (UNavigationSystemV1::CanTargetBeReached3D(
                AI.Character, 
                CharacterOfInterest, 
                HorizontalReach, 
                VerticalReach, 
                false, Location))
        {
            return true;
        }
        
        return false;
    }

    bool IsOnNavmesh() const
    {
        FVector ProjectedPosition;
        return UNavigationSystemV1::ProjectPoint(Self, Self.FeetLocation, ProjectedPosition);
    }

    float CalculateCurrentChanceToDodgeAnAttack(USensedIncommingAttack Attack) const
    {
        float DodgeChance = 0.0f;

        if (!IsValid(Attack))
            return DodgeChance;

        if (Attack.bReactionDone)
            return DodgeChance;

        if (Attack.Reaction != EIncomingAttackReaction::Count)
            return DodgeChance;

        if (Attack.EstimatedTimeLeftUntilImpact <= 0.0f)
            return DodgeChance;

        if (!IsValid(Attack.Instigator))
            return DodgeChance;

        if (!Attack.Instigator.IsDoingAttack())
            return DodgeChance;

        if (!Self.IsBackFacingOtherCharacterDirectly(Attack.Instigator))
        {
            DodgeChance = Config.ReactToAttackFrontDodgeChance;
        }
        else
        {
            DodgeChance = Config.ReactToAttackBackDodgeChance;
        }

        float Result = DodgeChance;

        return Result;
    }

    float CalculateCurrentChanceToBlockAnAttack(USensedIncommingAttack Attack) const
    {
        float BlockChance = 0.0f;

        return BlockChance;
    }

    float GetCurrentChanceToDodgeAnAttack(USensedIncommingAttack Attack) const final
    {
        if (CharacterState.HasGameplayTag(GameplayTag::Combat_Enforce_Dodge))
            return 1.0f;

        if (CharacterState.HasGameplayTag(GameplayTag::Combat_Disallow_Dodge))
            return 0.0f;

        if (Attack.Instigator.IsFacingAwayFromOtherCharacter(Self))
            return 0.0f;

        auto CombatDataModule = DataModule::GetCombatDataModule(Attack.Instigator);
        float DistanceToAttacker = Self.GetDistanceTo(Attack.Instigator);
        if (!IsValid(CombatDataModule))
        {
            if (DistanceToAttacker > 150.0f)
                return 0.0f;
            
            return Math::Clamp(CalculateCurrentChanceToDodgeAnAttack(Attack), 0.0f, 1.0f);
        }

        auto ComboConfig = CombatDataModule.GetNextAttackConfig(Attack.AttackTypeTag);
        float TrueRange = CombatDataModule.GetAttackRange(ComboConfig);

        if (TrueRange > DistanceToAttacker + 30.0f)
            return 0.0f;

        return Math::Clamp(CalculateCurrentChanceToDodgeAnAttack(Attack), 0.0f, 1.0f);
    }

    float GetCurrentChanceToBlockAnAttack(USensedIncommingAttack Attack) const final
    {
        if (CharacterState.HasGameplayTag(GameplayTag::Combat_Enforce_Parry))
            return 1.0f;

        if (CharacterState.HasGameplayTag(GameplayTag::Combat_Disallow_Parry))
            return 0.0f;

        if (Attack.Instigator.IsFacingAwayFromOtherCharacter(Self))
            return 0.0f;

        auto CombatDataModule = DataModule::GetCombatDataModule(Attack.Instigator);
        float DistanceToAttacker = Self.GetDistanceTo(Attack.Instigator);
        if (!IsValid(CombatDataModule))
        {
            if (DistanceToAttacker > 150.0f)
                return 0.0f;
            
            return Math::Clamp(CalculateCurrentChanceToBlockAnAttack(Attack), 0.0f, 1.0f);
        }

        auto ComboConfig = CombatDataModule.GetNextAttackConfig(Attack.AttackTypeTag);
        float TrueRange = CombatDataModule.GetAttackRange(ComboConfig);

        if (TrueRange > DistanceToAttacker + 30.0f)
            return 0.0f;

        return Math::Clamp(CalculateCurrentChanceToBlockAnAttack(Attack), 0.0f, 1.0f);
    }

    bool HasDamageSpellAndManaToUseIt() const
    {        
        FGameplayTagContainer DamageSpellKeywords;
        DamageSpellKeywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
        for (auto Spell : Self.Inventory.GetItemsMatchingAllSpecsOf(DamageSpellKeywords))
        {
            if (Self.CanUseSpell(Cast<USpellContainer>(Spell)))
                return true;
        }

        return false;
    }

    TArray<FScoredItemAction> GetUsableScoredItemActionsInInventory() const
    {
        return AI.GetUsableScoredItemActionsInInventory();
    }

    bool GetIsTestingEnabled() property
    {
        return false;
    }

    void SetupTestingBehaviors()
    {
        SelectedTestingBehavior = ECombatTestingBehaviorType::Custom;
        SetupBehaviorTree();
    }

    int GetSelfDrawnWeaponSkillDifferenceWithOtherCharacter(AGothicCharacter OtherCharacter) const
    {
        int SelfSkillLevel = Self.GetCurrentlyDrawnWeaponSkillLevel();
        int OtherSkillLevel = OtherCharacter.GetCurrentlyDrawnWeaponSkillLevel();

        return SelfSkillLevel - OtherSkillLevel;
    }

    float GetDistanceToClosestFriendly() const property
    {
        float QueryRadius = EnemyCombatDistance;
        FVector QueryLocation = Self.GetFeetLocation() + Self.ActorForwardVector * (QueryRadius - 200.0f);
        auto FriendlyCharactersInRange = Self.Relationship.FindAllCharactersWithRelationshipAt(QueryLocation, QueryRadius, ERelationship::Friend);
        
        float ClosestDistance = MAX_flt;
        for (auto FriendlyCharacter : FriendlyCharactersInRange)
        {
            float Distance = Self.GetFeetLocation().Distance(FriendlyCharacter.Character.GetFeetLocation());
            if (Distance >= ClosestDistance)
                continue;

            ClosestDistance = Distance;
        }
        return ClosestDistance;
    }

    FString GetTestingBehaviorName(ECombatTestingBehaviorType TestingBehaviorType)
    {
        if (TestingBehaviorType == ECombatTestingBehaviorType::None)
            return "None";

        for (UTestingBehaviorSet TestingBehaviorSet : TestingBehaviorSets)
        {
            if (TestingBehaviorSet.TestingBehaviorType == TestingBehaviorType)
                return TestingBehaviorSet.BehaviorSetName;
        }

        return "None";
    }

    bool IsAttackSelected() const
    {
        if (!IsValid(SelectedAttackHandler) || !IsValid(SelectedAttackHandler.Attack))
            return false;

        return true;
    }

    bool IsSpellSelected() const
    {
        if (!IsValid(SelectedSpellAction))
            return false;

        return true;
    }

    bool SelectedSpellActionHasTag(FGameplayTag Tag) const
    {
        if (!Tag.IsValid())
            return false;
        
        if (!IsValid(SelectedSpellAction))
            return false;

        return SelectedSpellAction.Keywords.HasTag(Tag);
    }

    UCM_Attack GetSelectedAttack() const property
    {
        if (!IsAttackSelected())
            return nullptr;

        return SelectedAttackHandler.Attack;
    }

    void SelectAttack(UAttackMoveHandler AttackToSelect)
    {
        _SelectedAttackHandler = AttackToSelect;
        OnAttackSelected();
        OnSelectedAttackChanged();
    }

    void OnSelectedAttackChanged()
    {
        BehaviorController.CancelCurrentMovement();
    }

    void OnAttackSelected()
    {
        OwnedBehaviorTreeTickFlags.bAttackSelected = true;
    }

    bool WouldMeleeAttackCollideWithWall()
    {
        TArray<FHitResult> HitResults;
        FVector EndToStart;
        bool bHit = WouldMeleeAttackCollideWithSomething(HitResults, EndToStart, n"IgnoreOnlyPawn");

        if (!bHit)
            return false;

        float PerpendicularTolerance = 0.35f;
        // Check if the impact surface is nearly perpendicular to the attack direction
        for (auto HitResult : HitResults)
        {
            if (!HitResult.bBlockingHit)
                continue;

            float DotProduct = HitResult.ImpactNormal.DotProduct(EndToStart);

            // Only consider hit blocking if not near-perpendicular
            if (Math::Abs(DotProduct) > PerpendicularTolerance)
                return true;
        }

        return false;
    }

    bool WouldMeleeAttackCollideWithFriendly()
    {
        TArray<FHitResult> HitResults;
        FVector EndToStart;
        bool bHit = WouldMeleeAttackCollideWithSomething(HitResults, EndToStart, n"Gothic_Character");

        if (!bHit)
            return false;

        float PerpendicularTolerance = 0.35f;
        // Check if the impact surface is nearly perpendicular to the attack direction
        for (auto HitResult : HitResults)
        {
            auto CharacterHit = Cast<AGothicCharacter>(HitResult.Actor);
            
            if (!IsValid(CharacterHit))
                continue;

            if (CharacterState.IsFriendlyTowards(CharacterHit.CharacterState))
                return true;
        }

        return false;
    }

    private bool WouldMeleeAttackCollideWithSomething(TArray<FHitResult>& HitResults, FVector& EndToStart, FName Profile)
    {
        // Can't check if there's no target
        if (!IsValid(CharacterOfInterest))
            return false;

        // Offset to adjust trace height for human characters
        FVector SphereHumanOffset = FVector::UpVector * 1.5f * Self.SimpleCollisionRadius;
        FVector SphereStartOffset = FVector::ZeroVector;
        FVector SphereEndOffset = FVector::ZeroVector;

        // Adjust start and end offsets if characters are human
        if (Self.IsHuman())
        {
            SphereStartOffset = SphereHumanOffset;
        }

        if (Self.IsHuman() && CharacterOfInterest.IsHuman())
        {
            SphereEndOffset = SphereHumanOffset;
        }        
        
        float SphereRadius = Self.CrowdAgentRadius * Config.MeleeAttackCapsuleRadiusMultiplier;

        if (!ensure(Self.CrowdAgentRadius < Self.SimpleCollisionRadius * 4))
        {
            // CrowdAgentRadius got so large that we can no longer expect on a working calculation here, please check why this is!
            SphereRadius *= 0.5f;
        }

        // Prevent floor object collisions by raising the trace origin
        if (Self.FeetLocation.Distance(Self.ActorLocation) - SphereRadius < 30.0f)
        {
            SphereStartOffset += FVector::UpVector * (30.0f - (Self.FeetLocation.Distance(Self.ActorLocation) - SphereRadius));
        }

        if (CharacterOfInterest.FeetLocation.Distance(Self.ActorLocation) - SphereRadius < 30.0f)
        {
            SphereEndOffset += FVector::UpVector * (30.0f - (CharacterOfInterest.FeetLocation.Distance(Self.ActorLocation) - SphereRadius));
        }

        // Ignore self and target character during trace
        TArray<AActor> ActorsToIgnore;
        ActorsToIgnore.Add(Self);
        ActorsToIgnore.Add(CharacterOfInterest);

        // Compute the start and end points of the trace
        FVector TraceStartLocation = Self.ActorLocation + SphereStartOffset;
        FVector TraceEndLocation = CharacterOfInterest.ActorLocation + SphereEndOffset;

        // Compute direction vector from end to start
        EndToStart = TraceStartLocation - TraceEndLocation;
        EndToStart.Normalize();

        // Extend the trace endpoint slightly to account for character collision radius
        TraceEndLocation = TraceEndLocation + EndToStart * (SphereRadius + CharacterOfInterest.SimpleCollisionRadius * 0.75f);

        // Perform the sphere trace
        bool bHit = System::SphereTraceMultiByProfile(
            TraceStartLocation,
            TraceEndLocation,
            SphereRadius,
            Profile, // Ignores characters but collides with environment
            false,
            ActorsToIgnore,
            EDrawDebugTrace::None,
            HitResults,
            false,
            FLinearColor::Green, FLinearColor::Red);

        return bHit;
    } 

    bool CanMoveToTargetIntoAttackReachInStraightLine(float AttackReach)
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        if (UNavigationSystemV1::CanMoveInDirection(Self, Self.NavAgentLocation, CharacterOfInterest.FeetLocation, AttackReach))
            return true;

        FVector SphereHumanOffset = FVector::UpVector * -0.5f * Self.SimpleCollisionRadius;

        FVector SphereStartOffset = FVector::ZeroVector;
        FVector SphereEndOffset = FVector::ZeroVector;
        if (Self.IsHuman())
        {
            SphereStartOffset = SphereHumanOffset;

            if (CharacterOfInterest.IsHuman())
            {
                SphereEndOffset = SphereHumanOffset;
            }
        }

        TArray<AActor> ActorsToIgnore;
        ActorsToIgnore.Add(Self);
        ActorsToIgnore.Add(CharacterOfInterest);

        FVector TraceStartLocation = Self.ActorLocation + SphereStartOffset;
        FVector TraceEndLocation = CharacterOfInterest.ActorLocation + SphereEndOffset;

        float SphereRadius = Self.CapsuleComponent.ScaledCapsuleRadius;

        FHitResult HitResult;
        bool bHit = System::SphereTraceSingleByProfile(
            TraceStartLocation,
            TraceEndLocation,
            SphereRadius,
            n"IgnoreOnlyPawn",
            false,
            ActorsToIgnore,
            EDrawDebugTrace::None,
            HitResult,
            false,
            FLinearColor::Green, FLinearColor::Red);

        if (!bHit)
            return true;

        float CollisionRadiusDifference = Self.SimpleCollisionRadius - CharacterOfInterest.SimpleCollisionRadius;
        float HitLocationDistanceToTargetLocation = HitResult.ImpactPoint.Distance(CharacterOfInterest.ActorLocation);

        float PossibleDistance = HitLocationDistanceToTargetLocation + CollisionRadiusDifference;
        float AttackReachScaled = AttackReach * 0.6f;

        return  PossibleDistance < AttackReachScaled;
    }

    bool ShouldStrafe()
    {
        if (!CharacterState.Character.CanStrafe())
            return false;

        return true;
    }

    void SetStrafing()
    {
        bool bShouldStrafe = ShouldStrafe();
        bool bIsStrafeEnabled = IsStrafeMovementEnabled();

        if (bShouldStrafe && !bIsStrafeEnabled)
        {
            EnableStrafeMovementAndTurnToTargetMode();
            return;
        }

        if (!bShouldStrafe && bIsStrafeEnabled)
        {
            DisableStrafeMovementAndTurnToTargetMode();
        }        
    }

    UFUNCTION(BlueprintCallable)
    void SetUseTestTauntCooldown(bool bValue)
    {
        Config.bUseTestTauntCooldown = bValue;
    }

    UFUNCTION(BlueprintCallable)
    void SetTestTauntCooldownSeconds(float32 Value)
    {
        Config.TestTauntCooldown = Value;
    }

    UFUNCTION(BlueprintCallable)
    void TriggerTerritoryExpansion()
    {
        // if (!AI.InitialConflictPosition.IsSet())
        //     return;

        AI.InitialConflictPosition.Set(Self.NavAgentLocation);

        // _TerritoryExpansionDistance = Self.NavAgentLocation.Distance(AI.InitialConflictPosition.Value);
        b_TerritoryExpansionTriggered = true;
    }
}

// TODO: put into own script?
namespace CombatScriptRoleSets
{
    UFUNCTION()
    TSet<ECombatRole> GetAttackerRoleSet()
    {
        TSet<ECombatRole> Set;
        Set.Add(ECombatRole::ActiveAttacker);
        Set.Add(ECombatRole::PassiveAttacker);

        return Set;
    }

    UFUNCTION()
    TSet<ECombatRole> GetObserverRoleSet()
    {
        TSet<ECombatRole> Set;
        Set.Add(ECombatRole::Observer);

        return Set;
    }
    UFUNCTION()
    TSet<ECombatRole> GetRoleSet(ECombatRole Role)
    {
        TSet<ECombatRole> Set;
        Set.Add(Role);

        return Set;
    }
}