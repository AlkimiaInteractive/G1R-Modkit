UCLASS()
class UAIState_FollowPerceivedCharacter : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddLeafTag(GameplayTag::AIState_Follow);
    default AssessmentModuleClass = UAIARM_FollowCharacter_ToDailyRoutine;

    UPROPERTY()
    AGothicCharacterState CharacterToFollow;

    UPROPERTY()
    FName FollowCharacterUniqueName;

    UPROPERTY()
    float FollowDistance = 750.0f;

    UPROPERTY()
    float SprintWhenFurtherAwayThan = -1.0f;

    UPROPERTY()
    bool bCopyWalkSpeed = true;

    UFUNCTION(BlueprintOverride)
    void OnActivate() override
    {
        Super::OnActivate();

        if (CharacterToFollow == nullptr)
        {
            CharacterToFollow = AGothicCharacterState::FindByUniqueName(FollowCharacterUniqueName);
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        if (CharacterToFollow == nullptr)
        {
            CharacterToFollow = AGothicCharacterState::FindByUniqueName(FollowCharacterUniqueName);
        }

        if (!IsValid(CharacterToFollow))
        {
            EndTaskAsFailure();
            return;
        }

        while (!bShouldExitState && ShouldKeepFollowing())
        {
            AI.Follow(CharacterToFollow, FollowDistance, bCopyWalkSpeed, SprintWhenFurtherAwayThan).While(n"ShouldKeepFollowing");

            WaitOneTick();
        }
    }

    default IsTickingTask = true;
    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        if (!IsValid(CharacterToFollow))
            return;

        if (!IsValid(CharacterToFollow.Character))
            return;

        if (Self.GetDistanceTo(CharacterToFollow.Character) > SprintWhenFurtherAwayThan)
        {
            SetWalkSpeed(EWalkSpeed::Sprinting);
            return;
        }

        if (CharacterToFollow.Character.IsMovingAwayFromOtherCharacter(Self))
        {
            SetWalkSpeed(CharacterToFollow.Character.GetWalkSpeed());
            return;
        }

        if (Self.GetDistanceTo(CharacterToFollow.Character) > SprintWhenFurtherAwayThan * 0.3f)
        {
            SetWalkSpeed(EWalkSpeed::Running);
            return;
        }

        SetWalkSpeed(EWalkSpeed::Walking);
    }

    UFUNCTION(BlueprintCallable)
    bool ShouldKeepFollowing() const
    {
        if (!IsValid(CharacterToFollow))
            return false;

        return true;
    }
}

/**
 * Follow character until we completely lose awareness
 */
UCLASS()
class UAIState_FollowCharacterWhileAware : UAIState_FollowPerceivedCharacter
{
    default FollowDistance = 300.0f;
    default bCopyWalkSpeed = true;
    default SprintWhenFurtherAwayThan = 1000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        CharacterToFollow = CharacterOfInterest.CharacterState;

        Super::DoTask();
        
        FRememberedPerception FakePerception;
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FakePerception);

        WaitSeconds(3.0f);
    }

    bool ShouldKeepFollowing() const override
    {
        if (!Super::ShouldKeepFollowing())
            return false;

        if (!IsValid(AI.Character))
            return false;

        if (!IsValid(CharacterToFollow.Character))
            return false;

        if (AI.Character.Perception.GetAwarenessToCharacter(CharacterToFollow.Character, EPerceptionSense::See) < 0.1f &&
            AI.Character.Perception.GetAwarenessToCharacter(CharacterToFollow.Character, EPerceptionSense::Hear) < 0.1f &&
            AI.Character.Perception.GetAwarenessToCharacter(CharacterToFollow.Character, EPerceptionSense::Smell) < 0.1f)
            return false;

        return true;
    }
}