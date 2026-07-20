/** Combines AIState_Follow and AIState_Guide to make 2 NPCs walk together from along Freepoints */
UCLASS()
class UAIState_MoveTogether : UGothicCharacterSimulateableAIState
{
    UPROPERTY()
	FName FollowerName; // follows the Guide

    UPROPERTY()
	FName GuideName;    // guides the Follower

	UPROPERTY()
	TArray<FGoToFreepoint> GoAlongFreepoints;

	// keep this slightly smaller than GuideWaitForFollowerDistance to allow follower to catch up before the guide must wait
    float FollowerSprintWhenFurtherAwayThan = 380.f; 
    float FollowerReachGuideDistance = 40.f; 
	float GuideWaitForFollowerDistance = 450.f;
    
    UPROPERTY()
	private AGothicCharacterState GuideCharacterState;

	UPROPERTY()
	private AGothicCharacterState FollowerCharacterState;

	UFUNCTION(BlueprintOverride)
	void OnActivate()
	{
		SetCustomPathfollowingSetting(CreateCustomPathfollowSetting());

		Super::OnActivate();	
	}

	UFUNCTION(BlueprintOverride)
	void DoTask()
	{
		while (!bShouldExitState)
		{
			if (!TryInitTask())
			{
				EndTaskAsFailure();
				return;
			}

			HandleCharacterDiedIfNecessary();

			if (IsOwnerTheGuide())
			{
				WaitForTask(UAIState_GuideCharacter(GoAlongFreepoints, FollowerName, GuideWaitForFollowerDistance * 0.5f, GuideWaitForFollowerDistance));
			}
			else if (IsOwnerTheFollower())
			{
				WaitForTask(UAIState_FollowCharacter(GuideName, FollowerReachGuideDistance, FollowerSprintWhenFurtherAwayThan));
			}
			else
			{
				// Should not reach here?
			}

			WaitSeconds(1.0f);
		}
	}

	bool TryInitTask()
	{
		GuideCharacterState = AGothicCharacterState::FindByUniqueName(GuideName);
		FollowerCharacterState = AGothicCharacterState::FindByUniqueName(FollowerName);

		if (GuideCharacterState == nullptr)
			return false;

		if (FollowerCharacterState == nullptr)
			return false;

		if (!IsOwnerTheGuide() && !IsOwnerTheFollower())
			return false;

		return true;
	}

    
	bool IsOwnerTheGuide() const
	{
		return GetCharacterState().CharacterUniqueName == GuideName;
	}

	bool IsOwnerTheFollower() const
	{
		return GetCharacterState().CharacterUniqueName == FollowerName;
	}

	void HandleCharacterDiedIfNecessary()
	{
		bool bTheGuideIsGone = GuideCharacterState == nullptr || GuideCharacterState.IsDead();
		bool bTheFollowerIsGone = FollowerCharacterState == nullptr || FollowerCharacterState.IsDead();

		if (!bTheGuideIsGone && !bTheFollowerIsGone)
			return;

		if (bTheGuideIsGone && IsOwnerTheFollower())
		{
			// when the Guide died, the Follower will start guiding himself to the destination
			GuideCharacterState = FollowerCharacterState;
			GuideName = FollowerName;
            FollowerCharacterState = FollowerCharacterState;
            FollowerName = FollowerName;
		}
		else if (bTheFollowerIsGone && IsOwnerTheGuide())
		{
            // when the Guide lost his Follower, he will start guiding himself to the destination
			GuideCharacterState = GuideCharacterState;
			GuideName = GuideName;
            FollowerCharacterState = GuideCharacterState;
            FollowerName = GuideName;
		}
	}

	FGothicPathfollowSettings CreateCustomPathfollowSetting() const
	{
		// force both to use max movement speed. For some reason the guide slows down with the follower behind him,
		// which causes a start/stop movement of the follower
		FGothicPathfollowSettings Setting = GetCharacterState().DefaultPathfollowingSetting;
        Setting.DebugOwnerName = "UAIState_MoveTogether";
		Setting.ModifyAvoidVelocitySettings.bUseBasicSpeedModification = true;
		Setting.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 1.0f;
		Setting.bSlowDownAtGoal = true;

		return Setting;
	}
}