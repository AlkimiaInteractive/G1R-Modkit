enum EUnreachableEnemyBehaviorStageType
{
    Taunting,
    Dodging,
    Covering,
    Fleeing,
    WaitingForFleeStateSwitch,
    None,

    TotalAmount
}

/** Make sure this behavior is added after the melee behaviors for it to function properly */
UCLASS()
class UCombatBehaviorSet_UnreachableEnemy : UCombatBehaviorSet
{
    default Roles.Add(ECombatRole::ActiveAttacker);
    default Roles.Add(ECombatRole::PassiveAttacker);
    default bBlockBehaviorSwitchWhenAttackSelected = false;

    UPROPERTY()
    const float PercentHPLostToFlee = 20.0f;

    UPROPERTY()
    const float PercentHPLeftToFlee = 60.0f;

    UPROPERTY()
    const float BaseStageIncreasePerSecondValue = 0.05f;

    UPROPERTY()
    const bool bSprintWhenDisengageWithoutAttack = false;

    UPROPERTY()
    const bool bUseTerritoryExpansion = false;

    UPROPERTY()
    const bool bBlockBaseStageIncreaseIfTerritoryNotExpanded = false;

    UPROPERTY()
    bool bWaitingForFleeStateSwitch = false;

    int MaxHitsBeforeDisenage = 1;

    int HitsSinceStart = 0;
    private float LastHitTimeSeconds = -MAX_flt;

    // Value to determin the current stage of being unreachable
    // Taking Damage increases this value relative to Max Health
    // Value will decrease over time
    UPROPERTY()
    private float _StageProgressValue = 0.0f;

    float GetStageProgressValue() const property
    {
        return _StageProgressValue;
    }


    void SetStageProgressValue(float NewValue)
    {
        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (!IsValid(PlayerCharacter) || !IsValid(PlayerCharacter.CharacterState))
        {
            _StageProgressValue = NewValue;
        }

        if (Combat.CharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
            return;

        _StageProgressValue = NewValue;
    }

    UPROPERTY()
    private float LastUpdateTimeSeconds = 0.0f;

    // Map of Stage types to the corresponding value 
    UPROPERTY() 
    TMap<EUnreachableEnemyBehaviorStageType, float> StageTypeSelectionThresholds;

    default StageTypeSelectionThresholds.Add(EUnreachableEnemyBehaviorStageType::Taunting, 0.0f);
    default StageTypeSelectionThresholds.Add(EUnreachableEnemyBehaviorStageType::Dodging, 0.4f);
    default StageTypeSelectionThresholds.Add(EUnreachableEnemyBehaviorStageType::Covering, 0.6f);
    default StageTypeSelectionThresholds.Add(EUnreachableEnemyBehaviorStageType::Fleeing, 0.8f);


    // Returns Currently Expected Stage based on Stage Progress
    EUnreachableEnemyBehaviorStageType GetExpectedCurrentStage() const
    {
        if (bWaitingForFleeStateSwitch)
            return EUnreachableEnemyBehaviorStageType::WaitingForFleeStateSwitch;
        
        EUnreachableEnemyBehaviorStageType CurrentStage = EUnreachableEnemyBehaviorStageType::None;
        float HighestValue = 0.0f;

        for(auto StageSizeEntry : StageTypeSelectionThresholds)
        {
            if (StageProgressValue >= StageSizeEntry.Value  && StageProgressValue >= HighestValue)
            {
                // Threshold was reached with the highest value so far
                CurrentStage = StageSizeEntry.Key;
                HighestValue = StageSizeEntry.Value;
            }          
        }

        return CurrentStage;
    }

    void TickBehaviorSet(float DeltaTimeSecs) override
    {
        Super::TickBehaviorSet(DeltaTimeSecs);

        int BehaviorSetUsageCount = 0;
        if (Combat.BehaviorSetUsageCounter.Find(Class, BehaviorSetUsageCount) && BehaviorSetUsageCount > 4 && Combat.IsTargetReachable())
        {
            // If going in and out of unreachable behavior set, go to disengage immediately
            SetStageProgressValue(1.0f);
            return;
        }

        float NewTimeSecondsSinceLastHitOnMe = Combat.GetSecondsSinceLastHitOnMe();

        if (LastHitTimeSeconds > NewTimeSecondsSinceLastHitOnMe)
        {
            // Time since hit decreased since last frame, meaning we got hit again
            HitsSinceStart++;
            LastHitTimeSeconds = NewTimeSecondsSinceLastHitOnMe;
        }


        if (HitsSinceStart >= MaxHitsBeforeDisenage)
        {
            // We got hit too many times, disengage immediately
            SetStageProgressValue(1.0f);
            return;
        }

        auto MemoryArray = Combat.Self.Perception.Memory
            .Filter()
            .FilterAffectedCharacterIs(Combat.Self)
            .FilterByType(GameplayTag::Perception_Incoming_Attack_Hit)
            .ToArray();

        AGothicCharacterState Attacker;
        if (!MemoryArray.IsEmpty())
        {
            auto LastHitOnSelf = MemoryArray.Last();
            Attacker = LastHitOnSelf.Instigator.CharacterState;
        }

        // Behavior might not immediately start when hit, account for hits that happened before
        if (NewTimeSecondsSinceLastHitOnMe < DeltaTimeSecs || (NewTimeSecondsSinceLastHitOnMe > 0.0f && StageProgressValue == 0.0f))
        {
 
            // Add value based on received Damage relative to Max Health
            const auto PercentHPLost = Combat.DamageReceivedInTheLastSeconds(DeltaTimeSecs) / Combat.Self.GetMaxHealthAttribute() * 100.0f;
            auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));

            if (IsValid(Attacker) && Attacker.IsPlayerControlled())
            {
                if (!Combat.Self.HasGameplayTag(GameplayTag::State_NeverDisengage) && 
                    IsValid(PlayerCharacter) && !Combat.CharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
                {
                    if (PercentHPLost >= PercentHPLostToFlee)
                    {
                        AssessDisengageSprintingImmediately();
                        return;
                    }

                    if (Combat.Self.GetHealthAttribute() / Combat.Self.GetMaxHealthAttribute() * 100.0f < PercentHPLeftToFlee)
                    {
                        AssessDisengageSprintingImmediately();
                        return;
                    }
                }

                if (Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest))
                    return;

                if (Combat.IsTerritoryExpansionTriggered())
                {
                    SetStageProgressValue(1.0f);
                    return;
                }

                if (bUseTerritoryExpansion && !Combat.IsTerritoryExpansionTriggered())
                {
                    Combat.TriggerTerritoryExpansion();
                    return;
                }
            }
        }

        // Passive stage increase only if not in same territory (prevents fleeing when player is out of navmesh)
        if (Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest))
            return;
        
        if (bBlockBaseStageIncreaseIfTerritoryNotExpanded && !Combat.IsTerritoryExpansionTriggered())
            return;

        int HitMultiplier = HitsSinceStart > 0 ? HitsSinceStart : 1;
        SetStageProgressValue(Math::Max(0.0f, (StageProgressValue + BaseStageIncreasePerSecondValue * DeltaTimeSecs) * HitMultiplier));
    }

    // BEHAVIORS ///////
    default Behavior_LowPriority()
                .DoNode(UCBT_Tree_AggressiveTauntWhenJustGotHit())
                    .AddTreeCooldown("Taunt", 3.0f)
                    .AddRequirement(UCS_IsInUnreachableEnemyStage(EUnreachableEnemyBehaviorStageType::Taunting));

    default Behavior_HighPriority()
                .DoNode(UCBT_Tree_ReactToIncomingRangedAttack())
                    .AddRequirement(UCS_IsInUnreachableEnemyStage(EUnreachableEnemyBehaviorStageType::Dodging));

    default Behavior_MediumPriority()
                .DoOperation(UCO_Disengage())
                    .AddRequirement(UCS_IsInUnreachableEnemyStage(EUnreachableEnemyBehaviorStageType::Fleeing));

    default Behavior_Movement()
                .DoMove(UCM_MoveTowardsEnemyToPreferredDistance_UntilOutOfTerritory())
                    .AddRequirement(UCS_IsInsideCombatStartTerritory());

    // TODO tree for covering

    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (bWaitingForFleeStateSwitch)
            return true;

        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "Character of interest is nullptr";
            return false;
        }

        /// If expansion was not triggered yet, use this behavior as long as the character of interest is outside the initial Combat territory
        if (IsValid(Combat.Territory) && Combat.Territory == Combat.AI.GetCurrentTerritory() && !Combat.IsTerritoryExpansionTriggered() &&
            !Combat.CharacterOfInterest.CharacterState.IsCharacterStateWithinTerritory(Combat.Territory))
        {
            if (!Combat.CanAttackFromRange() && 
                !Combat.Self.Inventory.HasUsableRangedWeaponInInventory() && 
                !Combat.IsTargetReachable())
                return true;
        }

        bool bIsInSameTerritory = Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest);

        /// Do not use unreachable enemy behavior (use fighting behaviors) if we expanded the territory and the enemy is inside the expanded territory
        // if (Combat.IsTerritoryExpansionTriggered() && !bIsInSameTerritory && Combat.AI.InitialConflictPosition.IsSet() &&
        //     Combat.CharacterOfInterest.NavAgentLocation.Distance(Combat.AI.InitialConflictPosition.Value) <= Combat.TerritoryExpansionDistance + Combat.AI.EngageConflictDistance)
        //     return false;

        /// Use unreachable enemy behavior if not in the same territory regardless of expansion

        // TODO REMOVE AFTER DEMO
        auto ForceRadius = UTerritorySubsystem::Get().DebugAlwaysHaveCharacterInCombatRadius;

        if (!bIsInSameTerritory && !ForceRadius)
            return true;

        if (Combat.HasDamageSpellAndManaToUseIt())
        {
            Reason = "Magic available";
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

    void AssessDisengageSprintingImmediately()
    {
        FRememberedPerception FakePerception;
        FakePerception.Instigator.Character = Combat.CharacterOfInterest;
        FakePerception.Instigator.CharacterState = Combat.CharacterOfInterest.CharacterState;
        Combat.AI.AssessEvent(GameplayTag::AIEvent_Disengage_Sprinting, FakePerception);

        bWaitingForFleeStateSwitch = true;
    }


    FString GetDisplayName() const override
    {
        return Super::GetDisplayName() + f" StageValue: {StageProgressValue} | CurrentStage: {GetExpectedCurrentStage()}";
    }
}

UCLASS()
class UCombatBehaviorSet_UnreachableEnemy_Creature : UCombatBehaviorSet_UnreachableEnemy
{
    default bSprintWhenDisengageWithoutAttack = true;
}

UCLASS()
class UCombatBehaviorSet_UnreachableEnemy_HumanOrc : UCombatBehaviorSet_UnreachableEnemy
{
    default bUseTerritoryExpansion = true;
    default bBlockBaseStageIncreaseIfTerritoryNotExpanded = true;
}

UCLASS()
class UCombatBehaviorSetPackage_UnreachableEnemy_Creature : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_UnreachableEnemy_Creature);
}

UCLASS()
class UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_UnreachableEnemy_HumanOrc);
}