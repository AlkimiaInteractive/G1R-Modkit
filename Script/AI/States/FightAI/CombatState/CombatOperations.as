
/** Combat operations perform calculations on the Combat class */
UCLASS()
class UCombatOperation
{
    UAIState_Combat_G1R Combat;

    UFUNCTION()
    bool DoOperation()
    {
        return true;
    }

    /** Returns a clean short name for debugging */
    FString GetDisplayName() const
    {
        FString Str = Name.ToString();
        Str.RemoveFromStart("CO");
        Str.RemoveFromStart("_");
        
        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);

        return FinalName;
    }

#if WITH_IMGUI
    /** Override to define what should be shown in the overview tree for this move. */
    void DisplayImGuiInTreeView()
    {        
        ImGui::Text(GetDisplayName());
    }
#endif
}

/** Request an attack token from the group */
UCLASS()
class UCO_RequestAttackToken : UCombatOperation
{
    bool DoOperation() override
    {
        if (Combat.CombatGroup.DoesCharacterHaveAttackToken(Combat.Self))
            return true;

        return Combat.CombatGroup.RequestAttackToken(Combat.Self);
    }
}

/** Force a move tag into cooldown */
UCLASS()
class UCO_ForceMoveIntoCooldown : UCombatOperation
{
    UCO_ForceMoveIntoCooldown(TSubclassOf<UAITask_CombatMove> InMoveToPutIntoCooldown, float InCooldown)
    {
        Cooldown = InCooldown;
        MoveToPutIntoCooldown = InMoveToPutIntoCooldown;
    }

    UPROPERTY()
    TSubclassOf<UAITask_CombatMove> MoveToPutIntoCooldown;

    UPROPERTY()
    float Cooldown = 0.2f;
    
    bool DoOperation() override
    {
        for (auto& MoveTypeCooldown : Cast<UAITask_CombatMove>(MoveToPutIntoCooldown.Get().DefaultObject).MoveTypeCooldowns)
        {
            Combat.SetTagCooldown(MoveTypeCooldown.Key, Cooldown);
        }

        Combat.SetClassCooldown(MoveToPutIntoCooldown, Cooldown);

        return true;
    }
}

/** Force a move tag into cooldown */
UCLASS()
class UCO_ForceNormalAttacksIntoCooldown : UCombatOperation
{
    UCO_ForceNormalAttacksIntoCooldown(float InCooldown)
    {
        Cooldown = InCooldown;
    }

    UPROPERTY()
    float Cooldown = 0.2f;
    
    bool DoOperation() override
    {
        Combat.SetTagCooldown(GameplayTag::Action_Attack_Top, Cooldown);
        Combat.SetClassCooldown(UCM_Attack_Top::StaticClass(), Cooldown);
        Combat.SetTagCooldown(GameplayTag::Action_Attack_Right, Cooldown);
        Combat.SetClassCooldown(UCM_Attack_Right::StaticClass(), Cooldown);
        Combat.SetTagCooldown(GameplayTag::Action_Attack_Left, Cooldown);
        Combat.SetClassCooldown(UCM_Attack_Left::StaticClass(), Cooldown);
        Combat.SetTagCooldown(GameplayTag::Action_Attack_Bottom, Cooldown);
        Combat.SetClassCooldown(UCM_Attack_Bottom::StaticClass(), Cooldown);

        return true;
    }
}

/** Force dodges into cooldown */
UCLASS()
class UCO_ForceDodgeIntoCooldown : UCO_ForceMoveIntoCooldown
{
    UCO_ForceDodgeIntoCooldown(float InCooldown)
    {
        Cooldown = InCooldown;
    }

    default MoveToPutIntoCooldown = UCM_Dodge::StaticClass();
}

/** Force attacks into cooldown */
UCLASS()
class UCO_ForceAttacksIntoCooldown : UCO_ForceMoveIntoCooldown
{
    UCO_ForceAttacksIntoCooldown(float InCooldown)
    {
        Cooldown = InCooldown;
    }

    default MoveToPutIntoCooldown = UCM_Attack::StaticClass();
}

/** Set preferred distance to the given value */
UCLASS()
class UCO_SetPreferredDistance : UCombatOperation
{
    UCO_SetPreferredDistance(float InPreferredDistance)
    {
        PreferredDistance = InPreferredDistance;
    }

    UPROPERTY()
    float PreferredDistance = 0;

    bool DoOperation() override
    {
        Combat.Config.PreferredDistance = PreferredDistance;
        return true;
    }
}

/** Set the preferred position (position to move to) through the positioning system. */
UCLASS()
class UCO_CalculatePreferredPosition : UCombatOperation
{
    UCO_CalculatePreferredPosition(float InPreferredDistance)
    {
        PreferredDistance = InPreferredDistance;
    }

    UPROPERTY()
    float PreferredDistance = -1.0f;

    bool DoOperation() override
    {
        FVector Position;
        if (!Combat.Positioning.GetLocationToMoveTo(Position, PreferredDistance))
            return false;

        // if (Combat.Positioning.PreferredLocation.Distance(Position) > 30.0f)
        // {
        //     Combat.Positioning.PreferredLocation = Position;
        //     Combat.Positioning.PreferredLocationRadius = 5.0f;
        // }

        return true;
    }
}

/** Set the blocking time to reactive blocking time */
UCLASS()
class UCO_UseReactiveBlockingTime : UCombatOperation
{
    bool DoOperation() override
    {
        Combat.Config.BlockingTime = Combat.Config.ReactiveBlockingTime;
        return true;
    }
}

/** Set the blocking time to proactive blocking time */
UCLASS()
class UCO_UseProactiveBlockingTime : UCombatOperation
{
    bool DoOperation() override
    {
        Combat.Config.BlockingTime = Combat.Config.ProactiveBlockingTime;
        return true;
    }
}

/** Select best spell in inventory */
UCLASS()
class UCO_SelectBestSpellInInventory : UCombatOperation
{
    bool DoOperation() override
    {
        // Combat.SelectBestSpellItemFromInventory();
        return true;
    }
}

////////////////////////////////////////////////////////////
//      SET NEXT ATTACK IN COMBO
////////////////////////////////////////////////////////////

/** Sets the next attack in the current combo */
UCLASS()
class UCO_SetNextAttackInCombo : UCombatOperation
{
    UCO_SetNextAttackInCombo(UCM_Attack InNextAttack, int InMaximumAttacksInCombo = 3)
    {
        NextAttack = InNextAttack;
        MaximumAttacksInCombo = InMaximumAttacksInCombo;
    }

    UPROPERTY()
    int MaximumAttacksInCombo = 3;

    UPROPERTY()
    UCM_Attack NextAttack;

    bool DoOperation() override
    {
        if (NextAttack == nullptr)
            return false;

        UCM_AttackDCombo CurrentComboMove = Cast<UCM_AttackDCombo>(Combat.CurrentActionCombatMove);
        if (CurrentComboMove == nullptr)
            return false;

        if (CurrentComboMove.HasNextAttackBeenAdded())
            return false;

        if (CurrentComboMove.AttacksDone == MaximumAttacksInCombo)
            return false;

        if (CurrentComboMove.IsComboClosed())
            return false;

        if (!Combat.Self.IsInAttackComboWindow())
            return false;
        
        FString Reason;
        if (!NextAttack.IsMoveAllowed(Reason))
            return false;

        FGameplayTag AttackDirection = FGameplayTag();

        if (NextAttack.MoveTypes.HasTag(GameplayTag::Action_Attack_Bottom))
        {
            AttackDirection = UAbilityTask_Attack::DirectionBottom();
        }
        else if (NextAttack.MoveTypes.HasTag(GameplayTag::Action_Attack_Top))
        {
            AttackDirection = UAbilityTask_Attack::DirectionTop();
        }
        else if (NextAttack.MoveTypes.HasTag(GameplayTag::Action_Attack_Left))
        {
            AttackDirection = UAbilityTask_Attack::DirectionLeft();
        }
        else if (NextAttack.MoveTypes.HasTag(GameplayTag::Action_Attack_Right))
        {
            AttackDirection = UAbilityTask_Attack::DirectionRight();
        }

        if (!AttackDirection.IsValid())
            return false;

        if (CurrentComboMove.AttackTask.IsFinished())
            return false;

        if (!CurrentComboMove.AttackTask.PossibleComboMoves.HasTag(AttackDirection))
            return false;
        
        CurrentComboMove.NextAttackDirection = AttackDirection;
        return true;
    }
}

/** Closes the current combo chain so that no more attakcs can be added */
UCLASS()
class UCO_CloseCurrentComboChain : UCombatOperation
{
    bool DoOperation() override
    {
        UCM_AttackDCombo CurrentComboMove = Cast<UCM_AttackDCombo>(Combat.CurrentActionCombatMove);
        if (CurrentComboMove == nullptr)
            return false;

        CurrentComboMove.CloseCombo();
        return true;
    }
}

/** Lock Movement */
UCLASS()
class UCO_LockMovement : UCombatOperation
{
    bool DoOperation() override
    {
        Combat.AI.StopFollowingActor(Combat.CharacterOfInterest);
        Combat.AI.StopGoingToWaypoint();
        Combat.Self.SetMovementLocked(true);

        return true;
    }
}

/** Unlock Movement */
UCLASS()
class UCO_UnlockMovement : UCombatOperation
{
    bool DoOperation() override
    {
        Combat.Self.SetMovementLocked(false);

        return true;
    }
}

/** Set should flee to true in the combat class */
UCLASS()
class UCO_FleeFromUnreachableEnemy : UCombatOperation
{
    bool DoOperation() override
    {
        if (Combat.AI.bPrintAssessmentResponseDebugInfo)
        {
            Print(Combat.CharacterState.CharacterUniqueName + " - Event: " + GameplayTag::AIEvent_WantToFlee_UnreachableEnemy.ToString());
        }

        FRememberedPerception LastHitAtSelfPerception = Combat.Self.Perception.Memory.Filter()
            .FilterByType(GameplayTag::Event_Damaged_Me)
            .FilterAffectedCharacterIs(Combat.Self)
            .FilterInstigatorCharacterIs(Combat.CharacterOfInterest)
            .ToArray().Last();

        Combat.AI.AssessEvent(GameplayTag::AIEvent_WantToFlee_UnreachableEnemy, LastHitAtSelfPerception);
        
        auto BehaviorSet = Cast<UCombatBehaviorSet_UnreachableEnemy>(Combat.CurrentCombatBehaviorSet);
        if (!IsValid(BehaviorSet))
            return true;

        BehaviorSet.bWaitingForFleeStateSwitch = true;
        
        return true;
    }
}

/** Set should flee to true in the combat class */
UCLASS()
class UCO_Disengage : UCombatOperation
{
    bool DoOperation() override
    {
        if (Combat.AI.bPrintAssessmentResponseDebugInfo)
        {
            Print(Combat.CharacterState.CharacterUniqueName + " - Event: " + GameplayTag::AIEvent_Disengage.ToString());
        }

        
        auto BehaviorSet = Cast<UCombatBehaviorSet_UnreachableEnemy>(Combat.CurrentCombatBehaviorSet);
        if (!IsValid(BehaviorSet))
            return true;

        FRememberedPerception FakePerception;
        FakePerception.Instigator.Character = Combat.CharacterOfInterest;
        FakePerception.Instigator.CharacterState = Combat.CharacterOfInterest.CharacterState;

        if (BehaviorSet.bSprintWhenDisengageWithoutAttack)
        {
            Combat.AI.AssessEvent(GameplayTag::AIEvent_Disengage_Sprinting, FakePerception);
        }
        else
        {
            Combat.AI.AssessEvent(GameplayTag::AIEvent_Disengage_Running, FakePerception);
        }

        BehaviorSet.bWaitingForFleeStateSwitch = true;
        
        return true;
    }
}

/** Set CombatState SelectedAttack */
UCLASS()
class UCO_SelectAttack : UCombatOperation
{
    UCO_SelectAttack(UCM_Attack Attack, float AttackBehaviorSortLayer, UCBT_Node AttackSelectorNode)
    {
        AttackToSelect = UAttackMoveHandler();
        AttackToSelect.Attack = Attack;
        AttackToSelect.Attack.TemplateObject = Attack;
        AttackToSelect.AttackBehaviorSortLayer = AttackBehaviorSortLayer;
        AttackToSelect.AttackSelectorNode = AttackSelectorNode;

        _AttackSelectorNode = AttackSelectorNode;
    }

    UPROPERTY()
    UAttackMoveHandler AttackToSelect = nullptr;

    UPROPERTY()
    private UCBT_Node _AttackSelectorNode = nullptr;

    bool DoOperation() override
    {
        if (Combat.SelectedAttack != nullptr && Combat.SelectedAttackHandler.AttackSelectorNode == _AttackSelectorNode)
            return false;

        if (AttackToSelect == nullptr)
            return false;

        if (AttackToSelect.Attack == nullptr)
            return false;

        if (Combat.CharacterOfInterest == nullptr)
            return false;

        if (_AttackSelectorNode == nullptr)
            return false;

        FString NotSelectableReason;
        if (!AttackToSelect.Attack.IsSelectable(NotSelectableReason))
            return false;

        AttackToSelect.CooldownProfiles = _AttackSelectorNode.ClosestCooldownProfilesInHierarchy;
        for (auto CooldownProfile : AttackToSelect.CooldownProfiles)
        {
            CooldownProfile.bCooldownOnSuccess = true;
        }
        
        AttackToSelect.SelectedAtTime = FInGameTime::Now();
        Combat.SelectAttack(AttackToSelect);
        return true;
    }

    FString GetDisplayName() const override
    {
        return "Select - " + AttackToSelect.Attack.GetDisplayName();
    }
}

class UCO_CancelCurrentCombatAction : UCombatOperation
{
    bool DoOperation() override
    {
        if (!IsValid(Combat) || !IsValid(Combat.BehaviorController))
            return false;

        Combat.BehaviorController.CancelAllCurrentActions();
        return true;
    }
}