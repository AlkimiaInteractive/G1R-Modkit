UCLASS(Abstract)
class UAIState_Conflict : UAIState_PerceptionResponse
{
    // Other npcs perceiving this npc will not lose awareness of it
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Smell);
    default OwnedGameplayTags.AddTag(GameplayTag::State_Aggressive);

    default IsTickingTask = true;

    UPROPERTY(EditDefaultsOnly)
    const EConflictType DefaultConflictType = EConflictType::TrueFight; 

    UAIGroup_ConflictInstance GetConflictInstanceGroup() const property
    {
        if (!IsValid(AI))
            return nullptr;

        return AI.GetGroupOfClass(UAIGroup_ConflictInstance);
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.AwarenessOfLivingHostileCharacter().PerceptionGained.BindUFunction(this, n"OnHostileAwarenessGained");
        Perception.AwarenessOfLivingHostileCharacter().PerceptionLost.BindUFunction(this, n"OnHostileAwarenessLost");

        Perception.AwarenessOfLivingEnemyCharacter().PerceptionGained.BindUFunction(this, n"OnEnemyAwarenessGained");
        Perception.AwarenessOfLivingEnemyCharacter().PerceptionLost.BindUFunction(this, n"OnEnemyAwarenessLost");

        Perception.OnSomeoneIsExecuting().PerceptionGained.BindUFunction(this, n"OnSomeoneKilled");
        Perception.OnSomeoneElseGotKnockedOut().PerceptionGained.BindUFunction(this, n"OnSomeoneDefeated");
        Perception.OnMyselfGotKnockedOut().PerceptionGained.BindUFunction(this, n"OnMyselfDefeated");
        Perception.OnMyselfGotKilled().PerceptionGained.BindUFunction(this, n"OnMyselfKilled");
    }

    UFUNCTION()
    private void OnHostileAwarenessGained(const FRememberedPerception&in Perception,
                                          const FPerceptionShortTermMemory&in Memory)
    {
        TrackCharacter(Perception.Origin.Character);
    }

    UFUNCTION()
    private void OnHostileAwarenessLost(const FRememberedPerception&in Perception,
                                        const FPerceptionShortTermMemory&in Memory)
    {
        // if (IsValid(Perception.Origin.Character))
        // {
        //     Print(Perception.Sensing.Character.CharacterUniqueName.ToString() + " Lost Hostile - " + Perception.Origin.Character.CharacterUniqueName.ToString());
        // }
        // else
        // {
        //     Print(Perception.Sensing.Character.CharacterUniqueName.ToString() + " Lost Hostile - nullptr");
        // }

        UntrackCharacter(Perception.Origin.Character);
    }

    UFUNCTION()
    private void OnEnemyAwarenessGained(const FRememberedPerception&in Perception,
                                        const FPerceptionShortTermMemory&in Memory)
    {
        TrackCharacter(Perception.Origin.Character);
    }

    UFUNCTION()
    private void OnEnemyAwarenessLost(const FRememberedPerception&in Perception,
                                      const FPerceptionShortTermMemory&in Memory)
    {
        // if (IsValid(Perception.Origin.Character))
        // {
        //     Print(Perception.Sensing.Character.CharacterUniqueName.ToString() + " Lost Enemy - " + Perception.Origin.Character.CharacterUniqueName.ToString());
        // }
        // else
        // {
        //     Print(Perception.Sensing.Character.CharacterUniqueName.ToString() + " Lost Enemy - nullptr");
        // }

        UntrackCharacter(Perception.Origin.Character);
    }

    UFUNCTION()
    private void OnSomeoneKilled(const FRememberedPerception&in Perception,
                                 const FPerceptionShortTermMemory&in Memory)
    {
        
        UntrackCharacter(Perception.Affected.Character);
    }

    UFUNCTION()
    private void OnSomeoneDefeated(const FRememberedPerception&in Perception,
                                   const FPerceptionShortTermMemory&in Memory)
    {
        UntrackCharacter(Perception.Affected.Character);
    }

    UFUNCTION()
    private void OnMyselfKilled(const FRememberedPerception&in Perception,
                                 const FPerceptionShortTermMemory&in Memory)
    {
        // if (IsValid(ConflictInstanceGroup))
        // {
        //     Print(f"Killed in {ConflictInstanceGroup.ConflictType}");
        // }
    }

    UFUNCTION()
    private void OnMyselfDefeated(const FRememberedPerception&in Perception,
                                 const FPerceptionShortTermMemory&in Memory)
    {
        // if (IsValid(ConflictInstanceGroup))
        // {
        //     Print(f"Defeated in {ConflictInstanceGroup.ConflictType}");
        // }
    }

    UFUNCTION()
    protected void TrackCharacter(AGothicCharacter Character)
    {
        if (!IsValid(ConflictInstanceGroup))
            return;

        ConflictInstanceGroup.RequestAddInvolvedCharacter(AI.Character, Character);
    }

    UFUNCTION()
    protected void UntrackCharacter(AGothicCharacter Character)
    {
        if (!IsValid(ConflictInstanceGroup))
            return;

        ConflictInstanceGroup.RequestRemoveInvolvedCharacter(AI.Character, Character);
    }

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        // TODO: Track which characters are fleeing
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (InitialConflictType == EConflictType::None)
        {
            InitialConflictType = DefaultConflictType;
        }

        // Set Disengage position if not set
        if (!AI.InitialConflictPosition.IsSet())
        {
            AI.InitialConflictPosition.Set(CharacterState.Character.GetActorLocation());
        }

        auto ValueSet = AI.SpawnedStorage(UAIValueSet_Conflict);
        ValueSet.DefaultEquippedMeleeWeaponClass = 
            IsValid(CharacterState.Inventory.FirstEquippedMeleeWeapon) ? 
            CharacterState.Inventory.FirstEquippedMeleeWeapon.Class :
            nullptr;

        ValueSet.DefaultEquippedRangedWeaponClass = 
            IsValid(CharacterState.Inventory.FirstEquippedRangedWeapon) ? 
            CharacterState.Inventory.FirstEquippedRangedWeapon.Class :
            nullptr;

        auto AvailableConflictInstanceGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);

        for (auto Group : AvailableConflictInstanceGroups)
        {
            auto GroupAsConflictInstance = Cast<UAIGroup_ConflictInstance>(Group);
            if (!IsValid(GroupAsConflictInstance))
                continue;
            
            // We don't want to join a true fight conflict group if we're trying to start a petty or training fight
            if (InitialConflictType != EConflictType::None && GroupAsConflictInstance.ConflictType > InitialConflictType)
                continue;

            if (GroupAsConflictInstance.ConflictType < EConflictType::TrueFight && !IsAnyEventCharacterInvolvedInGroup(GroupAsConflictInstance))
                continue;

            if (CharacterState.IsInConflict())
            {
                AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);
            }
            
            AI.JoinGroup(GroupAsConflictInstance);
            GroupAsConflictInstance.EscalateConflictTo(InitialConflictType);
            return;
        }

        if (CharacterState.IsInConflict())
        {
            AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);
        }
        
        // If no group was joined, create new group
        AI.CreateAndJoinGroup(UAIGroup_ConflictInstance);
        ConflictInstanceGroup.EscalateConflictTo(InitialConflictType);
    }

    UFUNCTION()
    bool IsAnyEventCharacterInvolvedInGroup(UAIGroup_ConflictInstance Group)
    {
        if (IsValid(RememberedPerception.Origin.Character) && Group.IsCharacterInvolved(RememberedPerception.Origin.Character))
            return true;
        
        if (IsValid(RememberedPerception.Instigator.Character) && Group.IsCharacterInvolved(RememberedPerception.Instigator.Character))
            return true;

        if (IsValid(RememberedPerception.Affected.Character) && Group.IsCharacterInvolved(RememberedPerception.Affected.Character))
            return true;

        if (IsValid(RememberedPerception.Target.Character) && Group.IsCharacterInvolved(RememberedPerception.Target.Character))
            return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        if (!IsValid(ConflictInstanceGroup))
            return;

        if (!IsValid(Self))
            return;

        auto AttackMemories = Self.Perception.Memory.Filter().FilterByType(GameplayTag::Event_Damaged_Me_Before).FilterOriginCharacterIs(Self).ToArray();
        AGothicCharacterState Attacker;
        bool bAttackerInConflict = false;

        if (!AttackMemories.IsEmpty())
        {
            Attacker = AttackMemories.Last().Instigator.CharacterState;
            bAttackerInConflict = Attacker.IsInConflict();
        }

        FGameplayTag ConflictTag;
        if (Self.IsDefeated())
        {
            if (bAttackerInConflict && ConflictInstanceGroup.ConflictType == EConflictType::TrainingFight)
            {
                ConflictTag = GameplayTag::Memory_Conflict_Defeated_TrainingFight;
            }
            else if (bAttackerInConflict && ConflictInstanceGroup.ConflictType == EConflictType::PettyFight)
            {
                ConflictTag = GameplayTag::Memory_Conflict_Defeated_PettyFight;
            }
            else
            {
                ConflictTag = GameplayTag::Memory_Conflict_Defeated_TrueFight;
            }
        }
        else if (Self.IsDead())
        {
            if (bAttackerInConflict && ConflictInstanceGroup.ConflictType == EConflictType::TrainingFight)
            {
                ConflictTag = GameplayTag::Memory_Conflict_Killed_TrainingFight;
            }
            else if (bAttackerInConflict && ConflictInstanceGroup.ConflictType == EConflictType::PettyFight)
            {
                ConflictTag = GameplayTag::Memory_Conflict_Killed_PettyFight;
            }
            else
            {
                ConflictTag = GameplayTag::Memory_Conflict_Killed_TrueFight;
            }
        }

        AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(ConflictTag, Self.CharacterState, Attacker);
    }

    UFUNCTION()
    bool CanEquipWeapons()
    {
        // if (Self.IsFlying())
        //     return false;

        if (Self.IsSwimming())
            return false;

        if (Self.IsDiving())
            return false;

        if (Self.IsInShallowWater())
            return false;

        if (Self.IsClimbingLadderOrWall())
            return false;

        return true;
    }
}

UCLASS()
class UAIValueSet_Conflict : UAIValueSet
{
    TSubclassOf<UWeaponMeleeDefinition> DefaultEquippedMeleeWeaponClass;
    TSubclassOf<UWeaponArcheryDefinition> DefaultEquippedRangedWeaponClass;
}