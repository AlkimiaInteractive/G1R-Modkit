
/** Special locations to be used with daily routines (PreferredLocation) */
namespace Location
{
    /** Where the character was initially spawned */
    const FName Spawnpoint = n"LOCATION_Spawnpoint";

    /** No restrictions, can be anywhere. */
    const FName Anywhere = NAME_None;

    /** --- Custom --- */

    const FName Home = n"LOCATION_Home";
    const FName WaterSpot = n"LOCATION_WaterSpot";
    const FName SleepingSpot = n"LOCATION_SleepingSpot";
    
    const FName Bed = n"LOCATION_Bed";
};

/** Similar to AIStates, but multiple can be run in parallel. They don't have a parent/child structure. */
UCLASS()
class UGothicCharacterAITask : UAbilityTask_AI
{
    /** Cached owning AIAbility of the right type, this is accessed often and needs to be fast. */
    UGameplayAbility_CharacterAI_Gothic AI;

    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        AI = Cast<UGameplayAbility_CharacterAI_Gothic>(Ability);
    }
}

UCLASS()
class UGothicCharacterAIState : UCharacterAIState
{
    UPROPERTY()
    float64 LastWeaponSwitchTimeSeconds = -MAX_flt;

    UPROPERTY()
    TSubclassOf<UAIGroup_StateEvent> StateGroupClass;

    /** Cached owning AIAbility of the right type, this is accessed often and needs to be fast. */
    UGameplayAbility_CharacterAI_Gothic AI;

    UFUNCTION(BlueprintOverride)
    void OnActivate()
    {
        AI = Cast<UGameplayAbility_CharacterAI_Gothic>(Ability);
    }

    /** State group we're currently part of (might be null) */
    UAIGroup_StateEvent GetStateGroup() const property
    {
        if (!IsValid(AI))
            return nullptr;

        return AI.GetGroupOfClass(UAIGroup_StateEvent);
    }

    /** Starts the given Substate object and waits for the state to finish. */
    FAbilityTaskExecutor DoSubstate(UGothicCharacterAIState Substate)
    {
        Substate.Other = Other;

        return FAbilityTaskExecutor(Substate);
    }
   
    /** Starts the given Substate object and waits for the state to finish. */
    FAbilityTaskExecutor DoSubstate(UCharacterAIState Substate)
    {
        Substate.Other = Other;

        return FAbilityTaskExecutor(Substate);
    }

    /** Creates and starts a Substate of the given class and waits for the state to finish. */
    FAbilityTaskExecutor DoSubstate(TSubclassOf<UCharacterAIState> SubstateClass)
    {
        auto State = CreateAIStateFromClass(SubstateClass);

        if (State == nullptr)
            return FAbilityTaskExecutor();

        return DoSubstate(State);
    }

    UGothicCharacterAIState CreateAIStateFromClass(TSubclassOf<UGothicCharacterAIState> StateClass)
    {        
        auto State = Cast<UGothicCharacterAIState>(UAngelscriptAbilityTask::CreateAbilityTask(StateClass.Get(), Ability));

        if (State == nullptr)
            return nullptr;

        return State;
    }

    UCharacterAIState CreateAIStateFromClass(TSubclassOf<UCharacterAIState> StateClass)
    {        
        auto State = Cast<UCharacterAIState>(UAngelscriptAbilityTask::CreateAbilityTask(StateClass.Get(), Ability));

        if (State == nullptr)
            return nullptr;

        return State;
    }

    void EndState()
    {
        EndTaskAsSuccess();
        return;
    }

    void DoStartState()
    {

    }

    void DoEndState()
    {
        
    }

    TArray<AGothicCharacter> GetSensedLivingCharacters() const property
    {
        if (AI == nullptr)
            return TArray<AGothicCharacter>();

        return AI.GetSensedLivingCharacters();
    }

    TArray<AGothicCharacter> GetSensedLivingHostiles() const property
    {
        if (AI == nullptr)
            return TArray<AGothicCharacter>();

        return AI.GetSensedLivingHostiles();
    }

    TArray<AGothicCharacter> GetSensedLivingEnemies() const property
    {
        if (AI == nullptr)
            return TArray<AGothicCharacter>();

        return AI.GetSensedLivingEnemies();
    }

    AGothicCharacter GetTargetCharacter() const property
    {
        return AI.TargetEnemy;
    }

    int GetNumberOfEnemiesSensed() const
    {
        return AI.GetNumberOfEnemiesSensed();
    }

    const UItemDefinition GetSelectedItem() const property
    {
        return AI.SelectedItemAction.ItemDefinition;
    }

    UActionKeywords GetSelectedItemAction() const property
    {
        if (AI.SelectedItemAction.ItemDefinition == nullptr)
            return nullptr;

        if (!AI.SelectedItemAction.ItemActionClass.IsValid())
            return nullptr;

        return Cast<UActionKeywords>(AI.SelectedItemAction.ItemActionClass.Get().DefaultObject);
    }

    USpellActionKeywords GetSelectedSpellAction() const property
    {
        auto ItemAction = GetSelectedItemAction();

        if (ItemAction == nullptr)
            return nullptr;

        return Cast<USpellActionKeywords>(ItemAction);
    }

    FGameplayTagContainer GetSelectedItemActionKeywords() const property
    {
        if (AI.SelectedItemAction.ItemDefinition == nullptr)
            return FGameplayTagContainer();

        if (!AI.SelectedItemAction.ItemActionClass.IsValid())
            return FGameplayTagContainer();

        return Cast<UActionKeywords>(AI.SelectedItemAction.ItemActionClass.Get().DefaultObject).Keywords;
    }

    FString GetDisplayName() const
    {
        return "Generic State";
    }

    /** Override to set the conditions for the state to be over */
    bool IsStateOver()
    {
        return IsFinished();
    }

    AGothicCharacter GetCharacterOfInterest() const property
    {
        if (nullptr == AI)
            return nullptr;
        
        return AI.CharacterOfInterest;
    }

    void SetCharacterOfInterest(AGothicCharacter Value) const property
    {
        AI.CharacterOfInterest = Value;
    }

    bool IsTargetingCharacterOfInterest() const
    {
        return CharacterOfInterest != nullptr && TargetCharacter != nullptr && TargetCharacter == CharacterOfInterest;
    }

    bool IsStrafeMovementEnabled()
    {
        return Self.HasGameplayTag(GameplayTag::State_Movement_PreferStrafe);
    }

    void EnableStrafeMovementAndTurnToTargetMode()
    {
        if (!Self.CanStrafe())
            return;

        AddDynamicOwnedGameplayTagToOwner(GameplayTag::State_Movement_PreferStrafe);
    }

    void DisableStrafeMovementAndTurnToTargetMode()
    {
        RemoveDynamicOwnedGameplayTagFromOwner(GameplayTag::State_Movement_PreferStrafe);
    }

    TSubclassOf<UNavigationQueryFilter> GetNavigationQueryFilterForAgent(const UObject Querier)
    {
        return nullptr;
    }
}

UCLASS()
class UGothicCharacterSimulateableAIState : UGothicCharacterAIState
{
    default bSupportsSimulatedSteps = true;
}

enum EFleeOnUnfavorableCombatMode
{
    Never, /** Only flee by Magic / Disengage */
    OnUnfavorable_PredatorOnly, /** Flee by Magic / Disengage or in unfavorable combat against at least 1 predator */
    OnUnfavorable, /** Flee by Magic / Disengage or in unfavorable combat */
    Always_PredatorOnly, /** Flee by Magic / Disengage, always flee from predators, and flee when in unfavorable combat */
    Always /** Flee from all enemies */
}

UCLASS()
class UGameplayAbility_CharacterAI_Gothic : UGameplayAbility_CharacterAI
{
    /** Object that stores Item Action scoring modifiers for this AI */
    UPROPERTY()
    UGothicAIItemActionScoringEntryManager ItemActionScoringEntryManager = UGothicAIItemActionScoringEntryManager();
    
    UPROPERTY()
    UGothicAICombatTargetScoringEntryManager CombatTargetScoringEntryManager = UGothicAICombatTargetScoringEntryManager();

    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_DisableUnequipableWeapons());

    UPROPERTY()
    FItemActionHandler SelectedItemAction;

    UPROPERTY()
    TMap<FGameplayTag, float> LastTimeItemActionUsages;

    UPROPERTY()
    TSubclassOf<UCrimeProcessingSubsystem> CrimeProcessingSubsystemClass;

    UPROPERTY()
    ECrimeSeverityLevel CrimeSeverityTowardsPlayer = ECrimeSeverityLevel::None;

    UPROPERTY()
    int CurrentFineValueForPlayer;

    UPROPERTY()
    int CurrentFineCrimeCountForPlayer;

    UPROPERTY()
    bool bCanForgivePlayerWithFine = false;

    /** AI State map */
    UPROPERTY()
    TMap<FGameplayTag, TSubclassOf<UAIState_PerceptionResponse>> States;

    UPROPERTY()
    private AGothicCharacterState CurrentCharacterStateOfInterest = nullptr;

    bool bPrintAssessmentResponseDebugInfo = false;

    UPROPERTY(EditDefaultsOnly)
    bool bEnableDisengage = true;

    UPROPERTY(EditDefaultsOnly)
    float DisengageDistanceFromPreferredLocation = 2000.0f;

    UPROPERTY(EditDefaultsOnly)
    float MinimumPreferredLocationConflictRadius = 2000.0f;

    UPROPERTY(EditDefaultsOnly)
    float CombatDistancePreferredLocationRadiusMultiplier = 1.5f;

    UPROPERTY(EditDefaultsOnly)
    float WarnignHostileDistance = 2000.0f;

    UPROPERTY(EditDefaultsOnly)
    float MaximumRangedAttackHorizontalDistance = 3000.0f;

    UPROPERTY(EditDefaultsOnly)
    bool bRangedAttackRequiresRangedWeapon = true;

    UPROPERTY(EditDefaultsOnly)
    bool bCanReachSwimmingTargetFromLand = false;

	FPerceptionHandlerHandle PredatorFilterHandler_LivingOnly;
    FPerceptionHandlerHandle HostileCharacterFilterHandler_LivingOnly;
    FPerceptionHandlerHandle EnemyCharacterFilterHandler_LivingOnly;
    FPerceptionHandlerHandle FriendlyCharacterFilterHandler_LivingOnly;

    FPerceptionHandlerHandle PredatorFilterHandler_LivingOrDefeated;
    FPerceptionHandlerHandle HostileCharacterFilterHandler_LivingOrDefeated;
    FPerceptionHandlerHandle EnemyCharacterFilterHandler_LivingOrDefeated;
    FPerceptionHandlerHandle FriendlyCharacterFilterHandler_LivingOrDefeated;

    UPROPERTY()
    FGameplayTagContainer AllowInstantCancelInteractions;

    /** If a Character is closer than this distance, we might want to engage in conflict even if they are in a different territory */
	UPROPERTY(EditDefaultsOnly)
	float EngageConflictDistance = 2500.0f;

    /** If the height between this and another character is higher than this, we don#t want to engage conflict if they are in a different territory*/
    UPROPERTY(EditDefaultsOnly)
	float EngageConflictHeightLimit = 1500.0f;

    /** Maximum distance from other NPC to synchronize perceptions to join combat*/
    UPROPERTY(EditDefaultsOnly)
    float MaxDistanceFromSourceCharacterToSynchAwareness = 1000.0f;

    /** Maximum distance from sensed character to synch awareness from source NPC to join combat */
    UPROPERTY(EditDefaultsOnly)
    float MaxDistanceFromSensedCharacterToSynchAwareness = 1500.0f;

	/** Position of this Character when entered Conflict State */
	UPROPERTY()
	TOptional<FVector> InitialConflictPosition;

    EFleeOnUnfavorableCombatMode ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Never;

    /** Min level gap before any flee chance. */
    UPROPERTY(EditDefaultsOnly)
    float FleeCurve_BaseThreshold = 3.0f;

    /** Extra threshold per creature level. */
    UPROPERTY(EditDefaultsOnly)
    float FleeCurve_ThresholdScale = 0.3f;

    /** How fast flee probability ramps. */
    UPROPERTY(EditDefaultsOnly)
    float FleeCurve_Steepness = 0.15f;

    /** Opponent level at which low-level shield maxes out. */
    UPROPERTY(EditDefaultsOnly)
    float FleeCurve_LevelShield = 12.0f;

    /** Flee reduction per additional living ally. */
    UPROPERTY(EditDefaultsOnly)
    float FleeCurve_GroupConfidence = 0.4f;

    /// AIStates
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Flee, UAIState_Flee);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, UAIState_ChaseAndLookForHidingCharacter);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_Creature);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing, UAIState_InvestigateSuspiciousSound_Trespassing);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Item, UAIState_InvestigateSuspiciousSound_Item);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateCombatSound, UAIState_InvestigateCombatSound);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, UAIState_InvestigateIdentifiedSound);
    default SetAIStateClassForType(GameplayTag::AIState_AssessGoToDailyRoutine, UAIState_AssessGoToDailyRoutine);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Paralyzed, UAIState_Paralyzed);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_ReactToTakingDamage, UAIState_ReactToTakingDamage);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Disengage, UAIState_Disengage);
    default SetAIStateClassForType(GameplayTag::AIState_Follow, UAIState_FollowCharacterWhileAware);

    default InterruptedSomeoneWaitingAIStateClass = UAIState_InterruptedSomeoneWaiting;

//     TArray<FCombatHistoryLogEntry> HistoryLog;
//     UFUNCTION()
//     void AddHistoryLog(FCombatHistoryLogEntry LogEntry)
//     {
// #if WITH_IMGUI
//         if (HistoryLog.Num() == 512)
//         {
//             HistoryLog.RemoveAt(0);
//         }

//         HistoryLog.Add(LogEntry);
// #endif
//     }

    UFUNCTION()
    UCrimeProcessingSubsystem GetCrimeProcessingSubsystem() const property
    {
        return Subsystem::GetWorldSubsystem(CrimeProcessingSubsystemClass);
    }

    AGothicCharacter GetCharacterOfInterest() const property
    {
        if (CurrentCharacterStateOfInterest == nullptr)
            return nullptr;

        return CurrentCharacterStateOfInterest.Character;
    }

    void SetCharacterOfInterest(AGothicCharacter Value) property
    {
        if (Value == nullptr)
        {
            CurrentCharacterStateOfInterest = nullptr;
            return;
        }

        CurrentCharacterStateOfInterest = Value.CharacterState;
    }

    void UpdateItemActionUsageTime(FGameplayTag ItemActionTag)
    {
        LastTimeItemActionUsages.FindOrAdd(ItemActionTag, -MAX_flt) = World.TimeSeconds;
    }

    void AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry Entry, float Weight)
    {
        for (auto ExistingEntry : CombatTargetScoringEntryManager.TargetScoringEntryGroups)
        {
            if (!ExistingEntry.IsA(Entry.Class))
                continue;

            ExistingEntry.Weight = Weight;
            return;
        }
        
        Entry.Weight = Weight;
        CombatTargetScoringEntryManager.Add(Entry);
    }

    void TargetCharacter(AGothicCharacter OtherCharacter, EGothicFocusPriority FocusPriority, UAbilityTaskGeneric TaskLifeAnchor)
    {
        CharacterOfInterest = OtherCharacter;

        SetTargetEnemy(CharacterOfInterest, FocusPriority, TaskLifeAnchor);
    }

    void TargetCharacterOfInterest(EGothicFocusPriority FocusPriority, UAbilityTaskGeneric TaskLifeAnchor)
    {
        TargetCharacter(CharacterOfInterest, FocusPriority, TaskLifeAnchor);
    }

    void StopTargetCharacter(EGothicFocusPriority FocusPriority)
    {
        CharacterOfInterest = nullptr;

        StopTargetingEnemy(FocusPriority);
    }

    /** Override to change what this character considers a threat when someone pulls it out. */
    bool IsWeaponConsideredAThreat(AGothicCharacter WeaponOwner) const
    {
        // Be scared of the player only for now
        // if (!WeaponOwner.IsPlayerControlled() && !WeaponOwner.IsPlayerCharacter())
        //     return false;

        return WeaponOwner.CarryComponent.IsEquippedWeaponAThreat();
    }

    bool HasRangedAttackOptions() const
    {
        if (!IsValid(Character))
            return false;

        if (!Character.Inventory.HasUsableRangedWeaponInInventory())
            return false;

        return true;
    }

    /** 
     * Override and return a value stating how "good" the given weapon is for this character. 
     * This could be a function of weapon damage and skill level, for example.
     * 
     * You can expect this character to be able to hold any weapon that is passed in here (stats wise).
     */

    UFUNCTION(BlueprintOverride)
    float RateMeleeWeaponStrength(UWeaponMeleeDefinition Weapon)
    {
        float BestDamage = 0.0f;

        for (auto& Type : Weapon.DamageTypes)
        {
            BestDamage = Math::Max(BestDamage, Weapon.GetDamage(Type));
        }

        float Multiplier = 1.0f;

        if (Weapon.HasItemSpec(GameplayTag::Item_Grip_TwoHand))
        {
            Multiplier *= 1.0f + Self.GetCombatAttribute_TwoHandCritical();
        }
        else if (Weapon.HasItemSpec(GameplayTag::Item_Grip_TwoHand))
        {
            Multiplier *= 1.0f + Self.GetCombatAttribute_OneHandCritical();
        }
        else
        {
            // Keep modifer as is
        }

        return BestDamage * Multiplier;
    }

    /** 
     * Override and return a value stating how "good" the given weapon is for this character. 
     * This could be a function of weapon damage and skill level, for example.
     * 
     * You can expect this character to be able to hold any weapon that is passed in here (stats wise).
     */
    UFUNCTION(BlueprintOverride)
    float RateRangedWeaponStrength(UWeaponArcheryDefinition Weapon)
    {
        float BestDamage = 0.0f;

        for (auto& Type : Weapon.DamageTypes)
        {
            BestDamage = Math::Max(BestDamage, Weapon.GetDamage(Type));
        }

        float Multiplier = 1.0f;

        // TODO: Evaluate character skills

        return BestDamage * Multiplier;
    }

    /** Looks through the inventory to find the best melee weapon for this character. */
    UFUNCTION(BlueprintOverride)
    UWeaponMeleeDefinition FindBestMeleeWeapon()
    {
        float BestWeaponRating = 0.0f;
        UWeaponMeleeDefinition BestWeapon = nullptr;

        for (auto Weapon : Self.Inventory.AllMeleeWeapons)
        {
            float Rating = RateMeleeWeaponStrength(Weapon);

            if (Rating > BestWeaponRating)
            {
                BestWeaponRating = Rating;
                BestWeapon = Weapon;
            }
        }

        return BestWeapon;
    }

    /** Looks through the inventory to find the best ranged weapon for this character. */
    UFUNCTION(BlueprintOverride)
    UWeaponArcheryDefinition FindBestRangedWeapon()
    {
        float BestWeaponRating = 0.0f;
        UWeaponArcheryDefinition BestWeapon = nullptr;

        for (auto Weapon : Self.Inventory.AllRangedWeapons)
        {
            float Rating = RateRangedWeaponStrength(Weapon);

            if (Rating > BestWeaponRating)
            {
                BestWeaponRating = Rating;
                BestWeapon = Weapon;
            }
        }

        return BestWeapon;
    }

    /**
     * Switches to the best melee weapon. 
     * 
     * If the weapon was drawn, before, this function will undraw, switch and then draw the new weapon.
     */
    void EquipBestMeleeWeapon()
    {
        if (Self.HasDrawnWeapon())
        {
            UndrawWeapon();
            
            Self.Inventory.EquipMeleeWeapon(FindBestMeleeWeapon());

            DrawMeleeWeapon();
        }
        else
        {
            Self.Inventory.EquipMeleeWeapon(FindBestMeleeWeapon());
        }
    }

    /**
     * Switches to the best ranged weapon. 
     * 
     * If the weapon was drawn, before, this function will undraw, switch and then draw the new weapon.
     */
    void EquipBestRangedWeapon()
    {
        if (Self.HasDrawnWeapon())
        {
            UndrawWeapon();
            
            Self.Inventory.EquipRangedWeapon(FindBestRangedWeapon());

            DrawRangedWeapon();
        }
        else
        {
            Self.Inventory.EquipRangedWeapon(FindBestRangedWeapon());
        }
    }

    /** Override to decide whether this Guild should be treated as hostile to us */
    bool IsGuildConsideredHostile(AGothicCharacter Other) const
    {
        // Never attack our master!
        if (Other == Self.Owner)
            return false;

        if (!Self.IsHostileTowards(Other))
            return false;

        return true;
    }

    /** Override to decide whether this Guild should be treated as Enemy to us */
    bool IsGuildConsideredEnemy(AGothicCharacter Other) const
    {
        // Never attack our master!
        if (Other == Self.Owner)
            return false;

        if (!Self.IsEnemyTowards(Other))
            return false;

        return true;
    }

    /** Override to decide whether this Guild should be treated as friendly to us */
    bool IsGuildConsideredFriendly(AGothicCharacter Other) const
    {
        // Never attack our master!
        if (Other == Self.Owner)
            return true;

        if (!Self.IsFriendlyTowards(Other))
            return false;

        return true;
    }

    /** Override to decide whether this Guild should be treated as neutral to us */
    bool IsGuildConsideredNeutral(AGothicCharacter Other) const
    {
        // Never attack our master!
        if (Other == Self.Owner)
            return false;

        if (!Self.IsNeutralTowards(Other))
            return false;

        return true;
    }

    /** Override to decide whether character should be seen as a threat to us */
    bool IsCharacterConsideredAThreat(AGothicCharacter Other) const
    {
        // Not a threat to myself
        if (Other == Self.Owner)
            return false;

        // Defeated or dead characters not a threat
        if (Other.IsDefeated() || Other.IsDead())
            return false;

        // Not a threat during a training fight
        if (Other.CharacterState.IsInTrainingFight())
            return false;

        // If other is npc, no threat if they don't consider us an enemy
        if (!Other.IsPlayerControlled() && !Other.IsPlayerCharacter() && 
           (!Other.IsEnemyTowards(Self)))
            return false;

        // Only a threat if using a threatening weapon
        if (!IsWeaponConsideredAThreat(Other))
            return false;

        return true;
    }

    FAbilityTaskExecutor DrawItem(const UItemDefinition Item)
    {
        if (Item == nullptr)
            return FAbilityTaskExecutor();

        if (!Item.IsA(UWeaponDefinition) && !Item.IsA(USpellContainer))
            return FAbilityTaskExecutor();

        if (Self.IsDrawnItemClass(Item.Class))
            return FAbilityTaskExecutor();

        if (Self.IsFlying() && !Item.HasItemSpec(GameplayTag::Item_Property_Environment_Air_Flying))
            return FAbilityTaskExecutor();

        if (Self.IsDiving() && !Item.HasItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Underwater))
            return FAbilityTaskExecutor();

        if (Self.IsSwimming() && !Item.HasItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Surface))
            return FAbilityTaskExecutor();

        if (Self.IsClimbingLadder() && !Item.HasItemSpec(GameplayTag::Item_Property_Environment_Climbing_Ladder))
            return FAbilityTaskExecutor();

        if (Self.IsClimbingWall() && !Item.HasItemSpec(GameplayTag::Item_Property_Environment_Climbing_Wallclimb))
            return FAbilityTaskExecutor();

        if (Self.IsInShallowWater())
            return FAbilityTaskExecutor();

        if (Self.IsDoingAttack() || Self.IsDoingMagic())
            return FAbilityTaskExecutor();

        // TODO Check item specs to see if allowed in current stance
        // Self.IsFlying() || Self.IsFalling() || Self.IsSwimming()

        if (Self.IsDrawingOrUndrawingWeapon())
            return FAbilityTaskExecutor();

        if (!Self.Inventory.HasItemOfType(Item.ItemType))
            return FAbilityTaskExecutor();

        if (CharacterState.HasGameplayTag(GameplayTag::State_Interact))
        {
            EndAnyOngoingInteractionQuick();
        }

        if (Item.IsA(UTorch1H))
        {
            return DrawTorchItem();
        }

        if (Item.IsA(UWeaponDefinition))
        {
            auto Weapon = Cast<UWeaponDefinition>(Item);
            if (Weapon == nullptr)
                return FAbilityTaskExecutor();

            return DrawWeaponOfClass(Weapon.Class);
        }

        if (Item.IsA(USpellContainer))
        {
            UpdateLastWeaponSwitchTimeSeconds();
            RememberDroppingIfTorchIsDrawn();
            return DrawMagicSpell(Item.ItemType);
        }

        return FAbilityTaskExecutor();
    }

    FAbilityTaskExecutor DrawTorchItem()
    {
        if (Self.HasDrawnTorch())
            return FAbilityTaskExecutor();

        UpdateLastWeaponSwitchTimeSeconds();

        if (Self.IsAiming())
        {
            FGameplayEventData Payload;
            GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::End_Action_Aiming, Payload);
        }

        return DrawTorch();
    }

    void EquipItem(TSubclassOf<UItemDefinition> ItemDefinition)
    {
        if (ItemDefinition.Get().IsChildOf(UWeaponDefinition))
        {
            auto WeaponDefinition = Cast<UWeaponDefinition>(ItemDefinition.Get());
            Self.Inventory.EquipWeaponOfClass(WeaponDefinition.Class);
        }
    }

    void RememberDroppingIfTorchIsDrawn()
    {
        if (!Self.HasDrawnTorch())
            return;

        auto TorchValueSet = SpawnedStorage(UAIValueSet_Torch);
        TorchValueSet.DroppedTorchLocation = Self.FeetLocation;
        TorchValueSet.LastTimeTorchDropped = FInGameTime::Now();
    }

    FAbilityTaskExecutor DrawWeaponOfClass(TSubclassOf<UWeaponDefinition> WeaponClass)
    {
        if (Self.HasDrawnWeaponOfClass(WeaponClass))
            return FAbilityTaskExecutor();

        if (WeaponClass.Get().IsChildOf(UWeaponMeleeDefinition))
        {
            auto EquippedMeleeWeapon = Self.Inventory.FirstEquippedMeleeWeapon;
            if(EquippedMeleeWeapon == nullptr || !EquippedMeleeWeapon.IsA(WeaponClass))  
            {
                if (!Self.Inventory.EquipWeaponOfClass(WeaponClass))
                    return FAbilityTaskExecutor();
            }

            if (Self.IsAiming())
            {
                FGameplayEventData Payload;
                GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::End_Action_Aiming, Payload);
            }

            UpdateLastWeaponSwitchTimeSeconds();
            RememberDroppingIfTorchIsDrawn();
            return DrawMeleeWeapon();
        }

        if (WeaponClass.Get().IsChildOf(UWeaponArcheryDefinition))
        {
            auto EquippedRangedWeapon = Self.Inventory.FirstEquippedRangedWeapon;
            if (EquippedRangedWeapon == nullptr || !EquippedRangedWeapon.IsA(WeaponClass))
            {
                if (!Self.Inventory.EquipWeaponOfClass(WeaponClass))
                    return FAbilityTaskExecutor();
            }

            if (Self.IsAiming())
            {
                FGameplayEventData Payload;
                GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::End_Action_Aiming, Payload);
            }
            UpdateLastWeaponSwitchTimeSeconds();
            RememberDroppingIfTorchIsDrawn();
            return DrawRangedWeapon();
        }

        return FAbilityTaskExecutor();
    }

    void UpdateLastWeaponSwitchTimeSeconds()
    {
        auto CurrentGothicAIState = Cast<UGothicCharacterAIState>(CurrentState);

        if (CurrentGothicAIState != nullptr)
        {
            CurrentGothicAIState.LastWeaponSwitchTimeSeconds = World.TimeSeconds;
        }
    }

    UAIState_PerceptionResponse CreateAIStateFromClass(TSubclassOf<UAIState_PerceptionResponse> StateClass)
    {
        auto State = Cast<UAIState_PerceptionResponse>(UAngelscriptAbilityTask::CreateAbilityTask(StateClass, this));

        if (State == nullptr)
            return nullptr;

        return State;
    }
    
    void SetAIStateClassForType(FGameplayTag InStateType, TSubclassOf<UAIState_PerceptionResponse> InStateClass)
    {
        if (!ensure(!InStateClass.Get().IsAbstract()))
            return;
        
        States.Add(InStateType, InStateClass);
    }

    int GetNumberOfEnemiesSensed() const
    {
        FGameplayTagContainer ExcludeCharactersWith = FGameplayTagContainer();
        ExcludeCharactersWith.AddTag(GameplayTag::State_Dead);
        ExcludeCharactersWith.AddTag(GameplayTag::State_Defeated);

        int Count = 0;

        for (auto SensedCharacter : Self.Perception.GetAllSensedCharacters(FGameplayTagContainer(), ExcludeCharactersWith))
        {
            if (!Self.IsEnemyTowards(SensedCharacter))
                continue;

            Count++;
        }

        return Count;
    }

    /** --- Perception handlers --- */

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        // Heard attack hit
        // BindAssessmentToPerception(Perception.JustHeardAttackHitOtherWithMeleeWeapon(),
        //     WhenGained = GameplayTag::AIEvent_Heard_AttackHit_OnOther_Weapon_Melee);
        // BindAssessmentToPerception(Perception.JustHeardAttackHitOtherWithFists(),
        //     WhenGained = GameplayTag::AIEvent_Heard_AttackHit_OnOther_Fist);
        // BindAssessmentToPerception(Perception.JustHeardAttackHitOtherWithRangedWeapon(),
        //     WhenGained = GameplayTag::AIEvent_Heard_AttackHit_OnOther_Weapon_Ranged);

        // Seen attack hit
        BindAssessmentToPerception(Perception.JustSeenAttackHitOtherWithMeleeWeapon().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee);
        BindAssessmentToPerception(Perception.JustSeenAttackHitOtherWithFists().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist);
        BindAssessmentToPerception(Perception.JustSeenAttackHitOtherWithRangedWeapon().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged);
        BindAssessmentToPerception(Perception.JustSeenAttackHitOtherWithRune_HighThreat().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.JustSeenAttackHitOtherWithScroll_HighThreat().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat);

        // Hit on self
        BindAssessmentToPerception(Perception.HitOnSelfWithFists(),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Fist);
        BindAssessmentToPerception(Perception.HitOnSelfWithWeaponMelee(),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee);
        BindAssessmentToPerception(Perception.HitOnSelfWithWeaponRanged(),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged);
        BindAssessmentToPerception(Perception.HitOnSelfWithThrowable(),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged);
        BindAssessmentToPerception(Perception.HitOnSelfWithHighThreatRune().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.HitOnSelfWithHighThreatScroll().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);
        
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Charm().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Paralyzed().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Fear().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_FireRain().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Pyrokinesis().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_UrizielWaveOfDeath().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat);

        // Hit on other
        BindAssessmentToPerception(Perception.HitOnOtherWithFists().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Fist);
        BindAssessmentToPerception(Perception.HitOnOtherWithWeaponMelee().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Melee);
        BindAssessmentToPerception(Perception.HitOnOtherWithWeaponRanged().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Ranged);
        BindAssessmentToPerception(Perception.HitOnOtherWithThrowable().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Ranged);
        BindAssessmentToPerception(Perception.HitOnOtherWithHighThreatRune().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.HitOnOtherWithHighThreatScroll().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.HitOnOtherWithLowThreatRune().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_LowThreat);
        BindAssessmentToPerception(Perception.HitOnOtherWithLowThreatScroll().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_LowThreat);
        
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_Sleep().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_LowThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_Charm().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_LowThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_Paralyzed().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_Fear().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_FireRain().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_Pyrokinesis().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_UrizielWaveOfDeath().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat);

        // Ambush
        // BindAssessmentToPerception(Perception.SensedHostileOrEnemyWithinAmbushRange(400.0f).Delay(0.15f),
        //     WhenGained = GameplayTag::AIEvent_Sensed_AmbushTarget);

        // BindAssessmentToPerception(Perception.SensedAmbushStart().Delay(0.15f),
        //     WhenGained = GameplayTag::AIEvent_Sensed_AmbushStarted);

        
        
        // Seen character
        BindAssessmentToPerception(Perception.SeenLivingNonEnemyCharacter().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Seen_NonEnemy);
        BindAssessmentToPerception(Perception.SeePlayer(),
            WhenGained = GameplayTag::AIEvent_Seen_Player);
        BindAssessmentToPerception(Perception.PreSensedPlayer(),
            WhenGained = GameplayTag::AIEvent_PreSensed_Player);

        // Last-seen player position tracker.
        FPerceptionHandler& PlayerSightTracker = Perception.SeePlayer();
        PlayerSightTracker.PerceptionGained.BindUFunction(this, n"OnGainedPlayerSight_TrackLastSeen");
        PlayerSightTracker.PerceptionLost.BindUFunction(this, n"OnLostPlayerSight_ClearLastSeenFlag");
        BindAssessmentToPerception(Perception.SeenLivingHostileCharacter().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Seen_Hostile);
        BindAssessmentToPerception(Perception.SeenDefeatedCharacter().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Seen_Defeated);
        
        BindAssessmentToPerception(Perception.SeenPreyCarcass().Delay(0.3f), 
            WhenGained = GameplayTag::AIEvent_Seen_Carcass_Prey);

        // Seen Combat
        Perception.JustSeenCharacterInFightingState_Creature().Delay(0.15f).PerceptionGained.BindUFunction(this, n"SeenFighting_Creature");
        BindAssessmentToPerception(Perception.JustSeenCharacterInWarningState_Creature().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Warning);
        BindAssessmentToPerception(Perception.JustSeenCharacterInWatchHostileState().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_WatchHostile);
        BindAssessmentToPerception(Perception.JustSeenCharacterInWatchFightState().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_WatchFight);

        // Fighter seen
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithMeleeWeaponDrawn().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Fighter_Human);
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithRangedWeaponDrawn().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Fighter_Human);
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithMagicWeaponDrawn().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Fighter_Human);
        BindAssessmentToPerception(Perception.SeenOrcCharacterWithWeaponDrawn().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Fighter_Orc);
        BindAssessmentToPerception(Perception.SeenCreatureCharacterWithWeaponDrawn().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Fighter_Monster);
            
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithMeleeWeaponDrawnFaceMeOrAllys().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Melee);
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithFistsDrawnFaceMeOrAllys().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_DirectThreat_Fists);
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithRangedWeaponDrawnFaceMeOrAllys().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Ranged);
        BindAssessmentToPerception(Perception.SeenHumanCharacterWithMagicHighThreatWeaponDrawnFaceMeOrAllys().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_DirectThreat_Weapon_Magic_HighThreat);
        
        // BindAssessmentToPerception(Perception.SeenPlayerCharacterUndrawWeapon(),
        //     WhenGained = GameplayTag::AIEvent_Seen_UndrawWeapon);
            
        // Spellcaster seen
        BindAssessmentToPerception(Perception.JustSensedOtherStartCastingSpell_HighThreat().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_CastSpell_HighThreat);
        Perception.JustSensedOtherStartCastingSpell_LowThreat().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_JustSensedOtherStartCastingSpell_LowThreat");

        // Knockout
        BindAssessmentToPerception(Perception.OnSomeoneElseGotKnockedOut().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Sensed_Defeated_Other);
        BindAssessmentToPerception(Perception.OnMyselfGotKnockedOut().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Sensed_Defeated_Self);

        // Kill / Execution
        BindAssessmentToPerception(Perception.OnSomeoneElseGotKilled().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Sensed_OtherKilled);
        Perception.OnSomeoneIsExecuting().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_Execution");
        

        // // Seen Character undraw weapon
        // BindAssessmentToPerception(Perception.SeeCharacterToggleWeaponDrawn(), 
        //     WhenLost = GameplayTag::AIEvent_Seen_UndrawWeapon);

        // Spell mind effects
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Charm(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Charm_Started_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectLoadedOnSelfBeforeSetup_Charm(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Charm_Loaded);
        BindAssessmentToPerception(Perception.SpellEffectLoadedOnSelfAfterSetup_Charm(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Charm_Loaded);
        BindAssessmentToPerception(Perception.SpellEffectEndedOnSelf_Charm(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Charm_Ended_OnSelf);

        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Fear(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Fear_Started_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectLoadedOnSelfBeforeSetup_Fear(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Fear_Loaded);  
        BindAssessmentToPerception(Perception.SpellEffectLoadedOnSelfAfterSetup_Fear(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Fear_Loaded);    
        BindAssessmentToPerception(Perception.SpellEffectEndedOnSelf_Fear(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Fear_Ended_OnSelf);

        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Sleep(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Sleep_Started_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectEndedOnSelf_Sleep(), 
            WhenGained = GameplayTag::AIEvent_SpellEffect_Sleep_Ended_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Control(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Control_Started_OnSelf);
            BindAssessmentToPerception(Perception.SpellEffectEndedOnSelf_Control(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Control_Ended_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Paralyzed(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Paralyzed_Started_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_FireRain(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_FireRain_Started_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_Pyrokinesis(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Pyrokinesis_Started_OnSelf);
        BindAssessmentToPerception(Perception.SpellEffectStartedOnSelf_UrizielWaveOfDeath(),
            WhenGained = GameplayTag::AIEvent_SpellEffect_UrizielWaveOfDeath_Started_OnSelf);

        BindAssessmentToPerception(Perception.SpellEffectStartedOnOther_Transform().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Transform_Started_OnOther);
        BindAssessmentToPerception(Perception.SpellEffectEndedOnOther_Transform().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_SpellEffect_Transform_Ended_OnOther);
    
        // Started training fight
        BindAssessmentToPerception(Perception.TrainingFightWithFistsStarted().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_StartTrainingFight_Fists);
        BindAssessmentToPerception(Perception.TrainingFightWithWeaponStarted().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_StartTrainingFight_Weapon);

        // Pickpocketing
        // BindAssessmentToPerception(Perception.HeardPlayerMightBeTryingToPickpocketSelf().Delay(0.15f), 
        //     WhenGained = GameplayTag::AIEvent_Heard_Pickpocket);

        BindAssessmentToPerception(Perception.HeardPouchHittingGround().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Heard_Pouch);

        BindAssessmentToPerception(Perception.SensedPickpocketingFailedOnSelf().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Sensed_Pickpocketing_Failed_OnSelf);
        BindAssessmentToPerception(Perception.SeenSomeoneFailPickpocketOther().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Sensed_Pickpocketing_Failed_OnOther);
        Perception.SeenSomeoneSucceedPickpocketOther().Delay(0.15f).PerceptionGained.BindUFunction(this, n"OnSeenSomeoneSucceedPickpocketOther");
        
        BindAssessmentToPerception(Perception.SeenPouchLiftedByTelekinesis().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Sensed_Pickpocketing_Succeeded_OnOther);
        
        BindAssessmentToPerception(Perception.HeardAlertPickpocket().Delay(0.5f),
            WhenGained = GameplayTag::AIEvent_Heard_Alert_Pickpocket);

        // BindAssessmentToPerception(Perception.OnSomeoneSeenLockpickingOwnedInteractable(),
        //     WhenGained = GameplayTag::AIEvent_Seen_Lockpicking_Interaction);

        // Sensed combat
        Perception.JustHeardCharacterInFightingState().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_SensedCombat");
        Perception.JustHeardCharacterInWarningState().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_SensedWarning");        
        Perception.JustHeardCharacterInWatchHostileState().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_SensedWatchHostile");

        BindAssessmentToPerception(Perception.JustHeardCharacterInWatchFightState().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Sensed_WatchFight);

        Perception.OnSomeoneHeardUsingOwnedInteractable().Delay(0.6f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_CharacterHeardUsingOwnedInteractable");
        Perception.OnSomeoneSeenUsingOwnedInteractable().Delay(0.6f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_CharacterSeenUsingOwnedInteractable");

        // Character changed relationship
        // Perception.OnChangedRelationship().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_AssessHostilesAndEnemiesAround");
        // Perception.OnSomeoneGotExecuted().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_AssessHostilesAndEnemiesAround");

        // Areas
        Perception.OnCharacterSeenInArea().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_CharacterSeenInArea");
        Perception.HeardCharacterTrespassingInArea().Delay(0.15f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_CharacterHeardTrespassingInArea");
        
        // Theft
        BindAssessmentToPerception(Perception.OnSomeonePickedUpOwnedItem().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Theft);
        BindAssessmentToPerception(Perception.OnSomeoneTookItemFromOwnedContainer().Delay(0.15f),
            WhenGained = GameplayTag::AIEvent_Seen_Theft);

        BindAssessmentToPerception(Perception.SeenCharacterThatShouldBeFollowed(), 
            WhenGained = GameplayTag::AIEvent_Seen_FollowCharacter);

        BindAssessmentToPerception(Perception.SeenLivingEnemyCharacterTooClose().Delay(0.15f), 
            WhenGained = GameplayTag::AIEvent_Seen_EnemyTooClose);

        PredatorFilterHandler_LivingOnly = Perception.AwarenessOfLivingPredator().ToHandle(this);
		HostileCharacterFilterHandler_LivingOnly = Perception.AwarenessOfLivingHostileCharacter().ToHandle(this);
        EnemyCharacterFilterHandler_LivingOnly = Perception.AwarenessOfLivingEnemyCharacter().ToHandle(this);
        FriendlyCharacterFilterHandler_LivingOnly = Perception.AwarenessOfLivingFriendlyCharacter().ToHandle(this);

        PredatorFilterHandler_LivingOrDefeated = Perception.AwarenessOfLivingOrDefeatedPredator().ToHandle(this);
		HostileCharacterFilterHandler_LivingOrDefeated = Perception.AwarenessOfLivingOrDefeatedHostileCharacter().ToHandle(this);
        EnemyCharacterFilterHandler_LivingOrDefeated = Perception.AwarenessOfLivingOrDefeatedEnemyCharacter().ToHandle(this);
        FriendlyCharacterFilterHandler_LivingOrDefeated = Perception.AwarenessOfLivingOrDefeatedFriendlyCharacter().ToHandle(this);

        // Update relationship towards player on proximity
        Perception.SensedPlayerAnyAwareness().PerceptionGained.BindUFunction(this, n"OnSensedPlayerAnyAwareness");
    }

    UFUNCTION(BlueprintOverride)
    void HandleKilledCharacter(AGothicCharacterState KilledCharacter,
                               TSubclassOf<UWeaponDefinition> UsedWeapon,
                               FGameplayTagContainer& OutAdditionalMemoryTags)
    {
        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        UAIState_Conflict ConflictState = Cast<UAIState_Conflict>(CurrentState);
        if (!IsValid(ConflictState))
            return;

        if (KilledCharacter.IsCreature() && AmICurrentlyInvolvedWithPlayer() && !WasPlayerInvolvedInKillingCharacter(KilledCharacter))
        {
            OnCreatureKilledWithoutPlayerInvolvement(KilledCharacter, UsedWeapon, OutAdditionalMemoryTags);
        }
    }

    UFUNCTION()
    bool AmICurrentlyInvolvedWithPlayer()
    {
        if (CharacterState.IsPlayerControlled())
            return true;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (CharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
            return true;

        auto SummonerCharacterState = CharacterState.SummonedBy();
        if (!IsValid(SummonerCharacterState))
            return false;

        if (SummonerCharacterState.IsPlayerCharacter() || SummonerCharacterState.IsPlayerControlled())
            return true;

        if (SummonerCharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
            return true;

        return false;
    }

    UFUNCTION()
    bool WasPlayerInvolvedInKillingCharacter(AGothicCharacterState KilledCharacter)
    {
        auto ConflictStartMemories = KilledCharacter.LongTermMemory.Filter().WithTag(GameplayTag::Memory_Conflict_Start).ArrayNewestToOldest;
        if (ConflictStartMemories.IsEmpty())
            return false;

        auto LatestConflictStartMemory = ConflictStartMemories[0];
        if (LatestConflictStartMemory.EventTags.HasTag(GameplayTag::Character_Player))
            return true;

        auto InboundAttackMemoriesInLastConflict = KilledCharacter.LongTermMemory.Filter()
            .CausedBy(KilledCharacter.CharacterGlobalId)
            .WithTag(GameplayTag::Memory_Combat_WasDamaged)
            .WithTag(GameplayTag::Character_Player)
            .ArrayNewestToOldest;
        
        if (!InboundAttackMemoriesInLastConflict.IsEmpty())
            return true;

        auto OutboundAttackMemoriesInLastConflict = KilledCharacter.LongTermMemory.Filter()
            .Affecting(KilledCharacter.CharacterGlobalId)
            .WithTag(GameplayTag::Memory_Combat_WasDamaged)
            .WithTag(GameplayTag::Character_Player)
            .ArrayNewestToOldest;
        
        if (!OutboundAttackMemoriesInLastConflict.IsEmpty())
            return true;

        return false;
    }

    UFUNCTION()
    void OnCreatureKilledWithoutPlayerInvolvement(
        AGothicCharacterState KilledCharacter,
        TSubclassOf<UWeaponDefinition> UsedWeapon, 
        FGameplayTagContainer& OutAdditionalMemoryTags)
    {
        OutAdditionalMemoryTags.AddTag(GameplayTag::Memory_Conflict_Killed_PlayerNotInvolved);

        // TSet<TSubclassOf<UItemDefinition>> ItemClasses;
        // for (auto Item : KilledCharacter.Inventory.Items)
        // {
        //     ItemClasses.Add(Item.Class);
        // }

        // for (auto ItemClass : ItemClasses)
        // {
        //     KilledCharacter.Inventory.RemoveAllItemsOfClass(ItemClass);
        // }
    }

    UFUNCTION()
    private void SeenFighting_Creature(const FRememberedPerception&in Perception,
                                       const FPerceptionShortTermMemory&in Memory)
    {
        
        AssessEvent(GameplayTag::AIEvent_Seen_Combat, Perception);
    }

    UFUNCTION()
    private void OnGainedPlayerSight_TrackLastSeen(const FRememberedPerception&in Perception,
                                                   const FPerceptionShortTermMemory&in Memory)
    {
        UAIValueSet_LastSeenPlayer Ctx = SpawnedStorage(UAIValueSet_LastSeenPlayer);
        if (Ctx.bIsCurrentlySeeingPlayer)
            return;

        Ctx.bIsCurrentlySeeingPlayer = true;
        LastSeenPlayerContext::Update(this, Perception.Origin.Character);
    }

    UFUNCTION()
    private void OnLostPlayerSight_ClearLastSeenFlag(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        UAIValueSet_LastSeenPlayer Ctx = SpawnedStorage(UAIValueSet_LastSeenPlayer);
        Ctx.bIsCurrentlySeeingPlayer = false;
    }

    UFUNCTION()
    private void PerceptionEvent_JustSensedOtherStartCastingSpell_LowThreat(
            const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        auto CasterCharacterState = Perception.Origin.CharacterState;
        auto CasterCharacter = Perception.Origin.Character;
        if (!IsValid(CasterCharacterState) || !IsValid(CasterCharacter))
            return;

        auto TargetCharacter = CasterCharacter.GetCharacterThisCharacterIsDirectlyFacing();
        if (!IsValid(TargetCharacter))
            return;

        ERelationshipHostility RelationshipTowardsCaster = TargetCharacter.Relationship.GetHostilityTowards(CasterCharacterState);
        if (RelationshipTowardsCaster == ERelationshipHostility::LowThreatMagicTarget)
            return;

        AssessEvent(GameplayTag::AIEvent_Seen_CastSpell_LowThreat, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_Execution(const FRememberedPerception&in Perception,
                                           const FPerceptionShortTermMemory&in Memory)
    {
        FRememberedPerception MurderEvent = Perception;
        MurderEvent.EventTag = GameplayTag::AIEvent_Sensed_OtherKilled;
        MurderEvent.Origin = Perception.Affected;
        MurderEvent.Affected = Perception.Affected;
        MurderEvent.Instigator = Perception.Origin;
        AssessEvent(GameplayTag::AIEvent_Sensed_OtherKilled, MurderEvent);
    }

    UFUNCTION()
    private void OnSeenSomeoneSucceedPickpocketOther(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.Instigator.CharacterState) || Perception.Instigator.CharacterState.HasGameplayTag(GameplayTag::Skill_Pickpocketing_Master))
            return;

        AssessEvent(GameplayTag::AIEvent_Sensed_Pickpocketing_Succeeded_OnOther, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_SensedCombat(const FRememberedPerception&in Perception,
                                              const FPerceptionShortTermMemory&in Memory)
    {
        if (!Perception.Origin.Character.IsInConflict())
            return;

        if (!Perception.Origin.Character.IsInConflictFightingState())
            return;

        // if (!CharacterState.Species.MatchesTag(Perception.Origin.CharacterState.Species))
        //     return;

        AssessEvent(GameplayTag::AIEvent_Sensed_Combat, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_SensedWarning(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        if (!Perception.Origin.Character.IsInConflict())
            return;

        if (!Perception.Origin.Character.IsInConflictWarningState())
            return;

        AssessEvent(GameplayTag::AIEvent_Sensed_Warning, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_SensedWatchHostile(const FRememberedPerception&in Perception,
                                                    const FPerceptionShortTermMemory&in Memory)
    {
        AssessEvent(GameplayTag::AIEvent_Sensed_WatchHostile, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_AssessHostilesAndEnemiesAround(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        AssessHostilesAndEnemiesAround(Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_CharacterSeenInArea(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (Perception.EventTag.MatchesTag(GameplayTag::Perception_Character_Changed_Tags))
            return;

        if (!IsValid(OriginCharacterState) || !IsValid(Self))
            return;

        if (!OriginCharacterState.IsPlayerControlled() && !OriginCharacterState.IsPlayerCharacter())
            return;
        
        auto TrespassingContext = OriginCharacterState.GetTrespassingContextFor(CharacterState);

        // Prepare the modified perception object
        FRememberedPerception FakePerception = Perception;
        FakePerception.Instigator.CharacterState = OriginCharacterState;
        FakePerception.Instigator.Tags.AddTag(TrespassingContext.CharacterAreaTag);

        switch (TrespassingContext.Result)
        {
            case ETrespassingResult::Trespassing_OnPerson_Self:
            case ETrespassingResult::Trespassing_OnPerson_Friendly:
                AssessEvent(GameplayTag::AIEvent_Seen_Trespasser_OnPerson, FakePerception);
                break;
            case ETrespassingResult::Trespassing_OnGuild_Self:
            case ETrespassingResult::Trespassing_OnGuild_Friendly:
                AssessEvent(GameplayTag::AIEvent_Seen_Trespasser_OnGuild, FakePerception);
                break;
            default:
                break;
        }
    }

    UFUNCTION()
    private void PerceptionEvent_CharacterHeardTrespassingInArea(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (!IsValid(OriginCharacterState) || !IsValid(OriginCharacterState.Character))
            return;

        if (Character.Perception.CanSee(OriginCharacterState.Character))
            return;

        if (!OriginCharacterState.IsPlayerControlled() && !OriginCharacterState.IsPlayerCharacter())
            return;
        
        auto TrespassingContext = OriginCharacterState.GetTrespassingContextFor(CharacterState);
        FGameplayTag AssessEventTag;

        switch (TrespassingContext.Result)
        {
            case ETrespassingResult::Trespassing_OnPerson_Self:
                AssessEventTag = GameplayTag::AIEvent_Heard_Noise_RestrictedArea_SelfPersonal;
                break;
            case ETrespassingResult::Trespassing_OnPerson_Friendly:
                AssessEventTag = GameplayTag::AIEvent_Heard_Noise_RestrictedArea_FriendlyPersonal;
                break;
            case ETrespassingResult::Trespassing_OnGuild_Self:
                AssessEventTag = GameplayTag::AIEvent_Heard_Noise_RestrictedArea_OwnGuild;
                break;
            case ETrespassingResult::Trespassing_OnGuild_Friendly:
                AssessEventTag = GameplayTag::AIEvent_Heard_Noise_RestrictedArea_FriendlyGuild;
                break;
            default:
                break;
        }

        if (!AssessEventTag.IsValid() || !TrespassingContext.bFoundMatchingCrime)
            return;
        
        AssessEvent(AssessEventTag, Perception);
    }

    UFUNCTION()
    private void OnSensedPlayerAnyAwareness(const FRememberedPerception&in Perception,
                                            const FPerceptionShortTermMemory&in Memory)
    {
        UpdateCrimeSeverityTowardsPlayer();
    }

    UFUNCTION()
    private void PerceptionEvent_CharacterHeardUsingOwnedInteractable(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (!IsValid(OriginCharacterState) || !IsValid(OriginCharacterState.Character))
            return;

        if (!OriginCharacterState.IsPlayerControlled() && !OriginCharacterState.IsPlayerCharacter())
            return;

        if (Character.Perception.CanSee(OriginCharacterState.Character))
            return;
        
        auto OwnedInteractable = Perception.PerceivedObject;

        if (!IsValid(OwnedInteractable.InteractiveObjectDefinition))
            return;

        bool bDoesCrimeApply = 
            CharacterState.Relationship.DoesCrimeApplyForOther(OriginCharacterState, GameplayTag::Crime_Interaction) || 
            CharacterState.Relationship.DoesCrimeApplyForOther(OriginCharacterState, GameplayTag::Crime_Lockpicking);        
        if (!bDoesCrimeApply)
            return;

        // Check trespassing statuses
        bool bIsOwnedByGuild = !OwnedInteractable.OwnedByGuilds.IsEmpty();

        bool bIsOwnedByPerson = !OwnedInteractable.PersonallyOwnedBy.IsEmpty();

        // If no trespassing is detected, exit early
        if (!bIsOwnedByGuild && !bIsOwnedByPerson)
            return;
        
        if (bIsOwnedByPerson && OwnedInteractable.PersonallyOwnedBy.Contains(CharacterState))
        {
            AssessEvent(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_SelfPersonal, Perception);
            return;
        }

        if (bIsOwnedByGuild && OwnedInteractable.IsOwnedByCharactersGuild(CharacterState))
        {
            AssessEvent(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_OwnGuild, Perception);
            return;
        }

        if (bIsOwnedByPerson)
        {
            for (auto PersonalOwner : OwnedInteractable.PersonallyOwnedBy)
            {
                if (!CharacterState.IsFriendlyTowards(PersonalOwner) && !CharacterState.IsProtecting(PersonalOwner))
                    continue;

                AssessEvent(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_FriendlyPersonal, Perception);
                return;
            }
        }

        if (bIsOwnedByGuild)
        {
            for (auto GuildOwner : OwnedInteractable.OwnedByGuilds.GameplayTags)
            {
                auto StaticRelationshipValues = URelationshipSystem::Get().StaticRelationshipBetween(CharacterState.Species, GameplayTag::Species, CharacterState.Guild, GuildOwner);
                if (StaticRelationshipValues.Relationship != ERelationship::Friend &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Premium &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromDifferentGuild &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromNonFriendly)
                    continue;

                AssessEvent(GameplayTag::AIEvent_Heard_Noise_OwnedInteractable_FriendlyGuild, Perception);
                return;
            }
        }
    }

    UFUNCTION()
    private void PerceptionEvent_CharacterSeenUsingOwnedInteractable(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (!IsValid(OriginCharacterState) || !IsValid(OriginCharacterState.Character))
            return;
        
        if (!OriginCharacterState.IsPlayerControlled() && !OriginCharacterState.IsPlayerCharacter())
            return;
        
        auto OwnedInteractable = Perception.PerceivedObject;

        if (!IsValid(OwnedInteractable.InteractiveObjectDefinition))
            return;

        bool bIsLockpicking = OriginCharacterState.HasGameplayTag(GameplayTag::State_PickLock);
        FGameplayTag CrimeTag = GameplayTag::Crime_Interaction;

        if (bIsLockpicking)
        {
            CrimeTag = GameplayTag::Crime_Lockpicking;    
        }

        // Check interactable ownership statuses
        bool bDoesCrimeApply = Self.Relationship.DoesCrimeApplyForOther(OriginCharacterState, CrimeTag);
        bool bIsOwnedByGuild = !OwnedInteractable.OwnedByGuilds.IsEmpty();
        bool bIsOwnedByPerson = !OwnedInteractable.PersonallyOwnedBy.IsEmpty();

        bool bIsPersonalCrime = bDoesCrimeApply && bIsOwnedByPerson;
        bool bIsGuildCrime = bDoesCrimeApply && bIsOwnedByGuild;

        // If no ownership is detected, exit early
        if (!bIsGuildCrime && !bIsPersonalCrime)
        {
            if (bIsLockpicking)
            {
                // Seen lockpicking interaction but crime doesn't apply
                AssessEvent(GameplayTag::AIEvent_Seen_Lockpicking_Interaction, Perception);
            }

            return;
        }
        
        if (bIsPersonalCrime && OwnedInteractable.PersonallyOwnedBy.Contains(CharacterState))
        {
            if (bIsLockpicking)
            {
                AssessEvent(GameplayTag::AIEvent_Seen_Interaction_Lockpicking_SelfPersonal, Perception);
            }
            else
            {
                AssessEvent(GameplayTag::AIEvent_Seen_Interaction_OwnedInteractableUse_SelfPersonal, Perception);
            }
            return;
        }

        if (bIsGuildCrime && OwnedInteractable.IsOwnedByCharactersGuild(CharacterState))
        {
            if (bIsLockpicking)
            {
                AssessEvent(GameplayTag::AIEvent_Seen_Interaction_Lockpicking_OwnGuild, Perception);
            }
            else
            {
                AssessEvent(GameplayTag::AIEvent_Seen_Interaction_OwnedInteractableUse_OwnGuild, Perception);
            }            
            return;
        }

        if (bIsPersonalCrime)
        {
            for (auto PersonalOwner : OwnedInteractable.PersonallyOwnedBy)
            {
                if (!CharacterState.IsFriendlyTowards(PersonalOwner) && !CharacterState.IsProtecting(PersonalOwner))
                    continue;

                if (bIsLockpicking)
                {
                    AssessEvent(GameplayTag::AIEvent_Seen_Interaction_Lockpicking_FriendlyPersonal, Perception);
                }
                else
                {
                    AssessEvent(GameplayTag::AIEvent_Seen_Interaction_OwnedInteractableUse_FriendlyPersonal, Perception);
                }

                return;
            }
        }

        if (bIsGuildCrime)
        {
            for (auto GuildOwner : OwnedInteractable.OwnedByGuilds.GameplayTags)
            {
                auto StaticRelationshipValues = URelationshipSystem::Get().StaticRelationshipBetween(CharacterState.Species, GameplayTag::Species, CharacterState.Guild, GuildOwner);
                if (StaticRelationshipValues.Relationship != ERelationship::Friend &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Premium &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromDifferentGuild &&
                    StaticRelationshipValues.Hostility != ERelationshipHostility::ProtectFromNonFriendly)
                    continue;
                
                if (bIsLockpicking)
                {
                    AssessEvent(GameplayTag::AIEvent_Seen_Interaction_Lockpicking_FriendlyGuild, Perception);
                }
                else
                {
                    AssessEvent(GameplayTag::AIEvent_Seen_Interaction_OwnedInteractableUse_FriendlyGuild, Perception);
                }
                return;
            }
        }

        AssessEvent(GameplayTag::AIEvent_Seen_Lockpicking_Interaction, Perception);
    }

    // TODO we want to rework this
    /** Evaluates the current perception of hostiles and enemies and sends the appropriate assess event calls. Returs false if no assess event was made. */
    UFUNCTION()
    bool CheckAnyHostilesOrEnemiesSensed(const FRememberedPerception&in Perception, bool bRemovePerceptionOrigin = true, bool bIncludeDefeated = false)
    {
        auto SensedEnemies = GetSensedLivingEnemies(bIncludeDefeated);
        
        if (bRemovePerceptionOrigin && SensedEnemies.Contains(Perception.Origin.Character))
        {
            SensedEnemies.Remove(Perception.Origin.Character);
        }

        if (SensedEnemies.Num() > 0)
            return false;

        auto SensedHostiles = GetSensedLivingHostiles();
        
        if (bRemovePerceptionOrigin && SensedHostiles.Contains(Perception.Origin.Character))
        {
            SensedHostiles.Remove(Perception.Origin.Character);
        }

        if (SensedHostiles.Num() > 0)
        {
            AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesSomeHostile, Perception);
            return true;
        }

        AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, Perception);
        return true;
    }

    // TODO we want to rework or remove this
    void AssessHostilesAndEnemiesAround(const FRememberedPerception&in Perception, float MaxDistance = -1.0f)
    {
        // auto SensedLivingEnemies = GetSensedLivingEnemies();
        // if (!SensedLivingEnemies.IsEmpty())
        // {
        //     if (MaxDistance < 0.0f)
        //         return;

        //     for (auto Enemy : SensedLivingEnemies)
        //     {
        //         if (Self.GetDistanceTo(Enemy) <= MaxDistance)
        //             return;
        //     }
        // }

        // auto SensedLivingHostiles = GetSensedLivingHostiles();
        // if (!SensedLivingHostiles.IsEmpty())
        // {
        //     if (MaxDistance < 0.0f)
        //     {
        //         AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesSomeHostile, Perception);
        //         return;
        //     }

        //     for (auto Hostile : SensedLivingHostiles)
        //     {
        //         if (Self.GetDistanceTo(Hostile) <= MaxDistance)
        //         {
        //             AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesSomeHostile, Perception);
        //             return;
        //         }
        //     }
        // }

        // if (!Perception.Origin.Character.HasDrawnWeapon() && !Perception.Origin.Character.IsBeingTargetedInCombat())
        // {
        //     AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, Perception);
        //     return;
        // }    
    }

    /** --- Access --- */

    /** Radius of how far the Character will go from its preferred location */
    UPreferredLocationComponent GetPreferredLocation() const property
    { 
        return NPCState.PreferredLocation;
    }

    /** Where this character has been spawned. */
    FVector GetSpawnpoint() const property
    {
        return PreferredLocation.StartingPosition;
    }

    /** --- Item Scoring --- */
    FItemActionHandler SelectBestItemActionFromInventory(FGameplayTag RequiredItemTag = FGameplayTag::Empty, FGameplayTagContainer RequiredTags = FGameplayTagContainer(), bool bForceUpdate = false)
    {
        TArray<FScoredItemAction> ScoredItemActions = GetUsableScoredItemActionsInInventory(RequiredTags, bForceUpdate);

        if (ScoredItemActions.Num() == 0)
            return FItemActionHandler();

        if (SelectedItemAction.ItemDefinition != nullptr)
        {
            if (!ScoredItemActions.IsEmpty() && SelectedItemAction.ItemDefinition != ScoredItemActions[0].ItemActionHandler.ItemDefinition)
            {
                // We Already have a weapon and would want to change it to a different one here
                // Force reloading to avoid 1 frame dfferences from the budget system
                ScoredItemActions = GetUsableScoredItemActionsInInventory(RequiredTags, true);
            }

            float BestScore = ScoredItemActions[0].Score;
            for (auto ScoredItemAction : ScoredItemActions)
            {
                if (ScoredItemActions[0].ItemActionHandler.ItemDefinition.IsA(ScoredItemAction.ItemActionHandler.ItemDefinition.Class))
                    continue;

                if (ScoredItemAction.ItemActionHandler.ItemDefinition.IsA(SelectedItemAction.ItemDefinition.Class))
                    continue;

                if (BestScore >= 0.0f && ScoredItemAction.Score >= 0.0f && ScoredItemAction.Score >= BestScore - 0.15f)
                    return SelectedItemAction;

                break;
            }
        }

        if (ScoredItemActions[0].Score < 0.0f)
        {
            SelectedItemAction = FItemActionHandler();
            return FItemActionHandler();
        }

        for (auto ScoredItemAction : ScoredItemActions)
        {
            if (RequiredItemTag.IsValid() && !ScoredItemAction.ItemActionHandler.ItemDefinition.ItemType.MatchesTag(RequiredItemTag))
                continue;
            
            SelectedItemAction = ScoredItemAction.ItemActionHandler;
            return SelectedItemAction;
        }

        SelectedItemAction = FItemActionHandler();
        return FItemActionHandler();
    }

    TArray<FScoredItemAction> GetUsableScoredItemActionsInInventory(FGameplayTagContainer RequiredTags = FGameplayTagContainer(), bool bForceUpdate = false)
    {
        return ItemActionScoringEntryManager.GetUsableScoredItemActionsInInventory(RequiredTags, bForceUpdate);
    }

    TArray<AGothicCharacter> GetAvailableTargets()
    {
        return GetSensedLivingEnemies(true);
    }

    TArray<FScoredCombatTarget> GetAvailableScoredCombatTargets()
    {
        return CombatTargetScoringEntryManager.GetAvailableScoredCombatTargets();
    }

    TArray<AGothicCharacter> GetSensedLivingCharacters(EPerceptionSense ViaSense = EPerceptionSense::None, bool bIncludeDefeated = false) const
    {
        return Character.Perception.GetSensedLivingCharacters(ViaSense, bIncludeDefeated);
    }

    TArray<AGothicCharacter> GetSensedDeadCharacters()
    {
        return Character.Perception.GetSensedDeadCharacters();
    }

    TArray<AGothicCharacter> GetSensedLivingHostiles(bool bIncludeDefeated = false) const
    {
        if (bIncludeDefeated)
            return Character.Perception.GetAllSensedCharactersMatchingPerceptionHandler(HostileCharacterFilterHandler_LivingOrDefeated);

        return Character.Perception.GetAllSensedCharactersMatchingPerceptionHandler(HostileCharacterFilterHandler_LivingOnly);
    }

    TArray<AGothicCharacter> GetSensedLivingEnemies(bool bIncludeDefeated = false) const
    {
        if (bIncludeDefeated)
            return Character.Perception.GetAllSensedCharactersMatchingPerceptionHandler(EnemyCharacterFilterHandler_LivingOrDefeated);

        return Character.Perception.GetAllSensedCharactersMatchingPerceptionHandler(EnemyCharacterFilterHandler_LivingOnly);
    }

    bool IsStrafeMovementEnabled() const
    {
        return NPCState.HasGameplayTag(GameplayTag::State_Movement_PreferStrafe);
    }

    bool IsCharacterInCombatRadius(const AGothicCharacter OtherCharacter) const
    {
        if (UTerritorySubsystem::Get().DebugAlwaysHaveCharacterInCombatRadius)
        {
            return true;
        }    

        if (UTerritorySubsystem::Get().DebugNeverHaveCharacterInCombatRadius)
        {
            return false;
        }        

        FVector ConflictPosition;

        if (InitialConflictPosition.IsSet())
        {
            ConflictPosition = InitialConflictPosition.Value;
        }
        else
        {
            ConflictPosition = Character.ActorLocation;
        }
  
        // is Instigator beyond height different Limit
        if (Math::Abs(ConflictPosition.Z - OtherCharacter.ActorLocation.Z) > EngageConflictHeightLimit )
        {
            return false;
        }

        // Is Instigator in Radius
        if (ConflictPosition.Distance(OtherCharacter.ActorLocation) < EngageConflictDistance )
        {
            return true;
        }

        return false;
    }

    bool IsEnemyOrHostileInCombatRadius()
    {
        FVector ConflictPosition;

        if (InitialConflictPosition.IsSet())
        {
            ConflictPosition = InitialConflictPosition.Value;
        }
        else
        {
            ConflictPosition = Character.ActorLocation;
        }

        // Is any Sensed Living Enemy in Radius
        for (auto SensedCharacter : GetSensedLivingEnemies())
        {
            if (Math::Abs(ConflictPosition.Distance(SensedCharacter.ActorLocation)) < EngageConflictDistance )
            {
                return true;
            }
        }

        // Is any Sensed Living Hostile in Radius
        for (auto SensedCharacter : GetSensedLivingHostiles())
        {
            if (Math::Abs(ConflictPosition.Distance(SensedCharacter.ActorLocation)) < EngageConflictDistance )
            {
                return true;
            }
        }

        return false;
    }

    bool IsInSameTerritoryOrCombatRadiusAsOtherCharacter(const AGothicCharacter OtherCharacter) const
    {
        if (!IsValid(OtherCharacter))
            return false;

        const UTerritoryConfig CharacterTerritory = GetCurrentTerritory();

        bool bSameTerritory = OtherCharacter.CharacterState.IsCharacterStateWithinTerritory(CharacterTerritory);

        if (!IsValid(CharacterTerritory) || !bSameTerritory)
        {
            // Character Territory is null, check Combat Radius instead
            return IsCharacterInCombatRadius(OtherCharacter);
        }

        return bSameTerritory;
    }
}