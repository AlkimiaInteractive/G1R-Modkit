

/**
 * Follows the given character until they die. Steps out of the way, when GoalCharacter is blocked by the follower
 */
UCLASS()
class UAIState_FollowCharacter : UGothicCharacterSimulateableAIState 
{
    default OwnedGameplayTags.AddLeafTag(GameplayTag::AIState_Follow);


    UAIState_FollowCharacter(AGothicCharacterState InCharacterToFollow, float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f)
    {
        CharacterToFollow = InCharacterToFollow;
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
    }

    UAIState_FollowCharacter(FName InCharacterToFollowUniqueName, float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f)
    {
        FollowCharacterUniqueName = InCharacterToFollowUniqueName;
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
    }

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
            AI.Follow(CharacterToFollow, FollowDistance, bCopyWalkSpeed, SprintWhenFurtherAwayThan, CharacterToFollow.IsPlayerControlled()).While(n"ShouldKeepFollowing");

            WaitOneTick();
        }
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
 * Follows the hero until he dies. Follower will move out of the way when Hero is blocked
 */
UCLASS()
class UAIState_FollowHero : UAIState_FollowCharacter 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);
    
    UAIState_FollowHero(float InFollowDistance, bool bMatchWalkspeed = true, float InSprintWhenFurtherAwayThan = 1000)
    {
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
        bCopyWalkSpeed = bMatchWalkspeed;
    }

    default FollowCharacterUniqueName = n"Hero";
}