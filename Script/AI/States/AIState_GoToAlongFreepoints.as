/** Point that a character can go to. Also defines the WalkSpeed that this character should have when moving to the point. */
struct FGoToFreepoint
{
	/** Set this freepoints name and the WalkSpeed that the guide should have when moving to it. */
	FGoToFreepoint(FName InFreepointName, EWalkSpeed InWalkSpeed)
	{
		this.FreepointName = InFreepointName;
		this.WalkSpeed = InWalkSpeed;
	}

	/** Set this freepoints name with running as default */
	FGoToFreepoint(FName InFreepointName)
	{
		this.FreepointName = InFreepointName;
		this.WalkSpeed = EWalkSpeed::Running;
	}

	FName FreepointName;
	EWalkSpeed WalkSpeed = EWalkSpeed::Running;
}

/**
 * Makes character go to destination, but orientates itself at the provided freepoints.
 * This task estimates where the start location is within the chain of freepoints and targets the next one towards the destination,
 * so it wont go back to visit freepoints that are not along the way towards the destination.
 */
UCLASS()
class UAIState_GoToAlongFreepoints : UGothicCharacterSimulateableAIState
{
	/** Freepoints that make up a chain towards the destination. Put destination as last point. */
	UPROPERTY()
	TArray<FGoToFreepoint> GoAlongFreepoints;

	/** If set, at terminus the guide switches to this daily routine and exits instead of waiting for the player. */
	UPROPERTY()
	TSubclassOf<UAIState_DailyRoutine> RoutineToReturnTo = nullptr;

	bool bHasReachedDestination = false;

	protected int32 TargetSpotIdx = 0;

	/** When does the guide consider a freepoint as reached and targets the next. */
	protected float InterstationReachedDistance = 100.f;

	/** Reach distance for start and end freepoints */
	protected float TerminusReachDistance = 40.f;

	protected FName RememberedGoalLocationName = FName("CurrentGoToGoal");

    /** How often should the NPC attempt to go to a freepoint when failing?  */
    protected int32 MaxGoToTries = 3;

	UFUNCTION(BlueprintOverride)
	void OnActivate()
	{
		Super::OnActivate();

		SetCustomPathfollowingSetting(CreateCustomPathfollowSetting());
	}

	UFUNCTION(BlueprintOverride)
	void DoTask()
	{
		if (!InitTask())
		{
			EndTaskAsFailure();
			return;
		}

		if (IsOnTerminusSpot())
		{
			HandleAtTerminus();
			return;
		}

		TargetSpotIdx = DetermineCurrentGoalIdx(true);

		while (GoAlongFreepoints.IsValidIndex(TargetSpotIdx))
		{
			SetPreferredLocationToCurrentTarget();
            SetWalkSpeedCurrentGoal(TargetSpotIdx);
            MoveForwardToNextFreepoint();
		}

		if (IsOnTerminusSpot())
		{
			HandleAtTerminus();
		}
		else
		{
			EndTaskAsCancelled();
		}
	}

    void MoveForwardToNextFreepoint()
    {    
        for (int32 Tries = 0; Tries < MaxGoToTries; Tries++)
        {
            EGenericTaskResult Result = AI.GotoPosition(AI.PreferredLocation.CenterPoint, InterstationReachedDistance).Result;
        
            if (Result == EGenericTaskResult::Success)
            {
                TargetSpotIdx += 1;
                return;
            }

            WaitSeconds(2.f);
        }
        
        PrintWarning(f"Failed. Cannot reach {GoAlongFreepoints[TargetSpotIdx].FreepointName}");
        EndTaskAsFailure();
    }

	int32 DetermineCurrentGoalIdx(bool bIsMovingForward) const
	{
		FName OriginalWaypointName;
		if (AI.PreferredLocation.TryGetRememberedLocationOriginalName(RememberedGoalLocationName, OriginalWaypointName))
		{
			for (int32 i = 0; i < GoAlongFreepoints.Num(); i++)
			{
				if (GoAlongFreepoints[i].FreepointName == OriginalWaypointName)
				{
					return i;
				}
			}

			return EstimateCurrentGoalIdxFromLocation(bIsMovingForward);
		}
		else
		{
			return EstimateCurrentGoalIdxFromLocation(bIsMovingForward);
		}
	}

	int32 EstimateCurrentGoalIdxFromLocation(bool bIsMovingForward) const
	{
		FVector RefLocation = AI.CharacterState.GetActorLocation();

		float CurrDistance = MAX_flt;
		float ClosestDistance = MAX_flt;

		int32 SegmentIdx = 0; // 0 --> beteen 0 and 1 FreepointIdx

		for (int32 i = 0; i < GoAlongFreepoints.Num() - 1; i++)
		{
			auto CurrSpotHandle = FInteractionSpotHandle(GoAlongFreepoints[i].FreepointName);
			auto NextSpotHandle = FInteractionSpotHandle(GoAlongFreepoints[i + 1].FreepointName);

			if (!CurrSpotHandle.IsValid() || !NextSpotHandle.IsValid())
				continue;

			FVector ClosestPoint = Math::ClosestPointOnLine(NextSpotHandle.Location, CurrSpotHandle.Location, RefLocation);

			CurrDistance = ClosestPoint.Distance(RefLocation);

			if (CurrDistance < ClosestDistance)
			{
				ClosestDistance = CurrDistance;
				SegmentIdx = i;
			}
		}

		// when character spawns at start and player is not near, we need to clamp it to 0
		return bIsMovingForward ? Math::Min(SegmentIdx + 1, GoAlongFreepoints.Num() - 1) : Math::Max(SegmentIdx, 0);
	}

	/** Update preferred location to the current TargetSpotIdx waypoint so GotoPreferredLocation goes the right way. */
	void SetPreferredLocationToCurrentTarget()
	{
		if (!GoAlongFreepoints.IsValidIndex(TargetSpotIdx))
			return;

		FInteractionSpotHandle GoalHandle = FInteractionSpotHandle(GoAlongFreepoints[TargetSpotIdx].FreepointName);
		float GoalReachDistance = GetReachDistanceForCurrentGoal(TargetSpotIdx);
		AI.PreferredLocation.RememberInteractionSpotAs(RememberedGoalLocationName, GoalHandle, GoalReachDistance);
		AI.PreferredLocation.PreferLocationKnownAs(RememberedGoalLocationName);
	}

	bool InitTask()
	{
		if (GoAlongFreepoints.Num() <= 1)
		{
			PrintError(f"{this.GetName()}: Needs at least two freepoints for start and end", 6.f);
			return false;
		}

		LogInvalidLocations();

		return true;
	}

	void SetWalkSpeedCurrentGoal(int32 Idx)
	{
		if (!GoAlongFreepoints.IsValidIndex(Idx))
			return;

		SetWalkSpeed(GoAlongFreepoints[Idx].WalkSpeed);
	}

	bool IsOnTerminusSpot() const
	{
		if (GoAlongFreepoints.IsEmpty())
			return false;

		return CharacterState.IsCloseToWaypoint(GoAlongFreepoints.Last().FreepointName, TerminusReachDistance);
	}

	void HandleAtTerminus()
	{
        bHasReachedDestination = true;

        if (RoutineToReturnTo != nullptr)
        {
            if (IsValid(GetNPCState()))
            {
                GetNPCState().ExchangeDailyRoutineToClass(RoutineToReturnTo);
                EndTaskAsSuccess();
                return;
            }
        }
        else
		{
			while (!bShouldExitState)
            {
                DoSubstate(UAIState_StandAround());
                WaitSeconds(1.0f);
            }
		}
	}

	float GetReachDistanceForCurrentGoal(int32 Idx) const
	{
		if (Idx == 0 || Idx == GoAlongFreepoints.Num() - 1)
		{
			return TerminusReachDistance;
		}
		else
		{
			return InterstationReachedDistance;
		}
	}

	FGothicPathfollowSettings CreateCustomPathfollowSetting()
	{
		FGothicPathfollowSettings Settings = AI.CharacterState.DefaultPathfollowingSetting;
		Settings.DebugOwnerName = "GoToAlongFreepoints";
		Settings.CrowdIdleBehaviour = ECrowdIdleBehaviour::TryAvoidMe;
		return Settings;
	}

	void LogInvalidLocations()
	{
		for (auto Freepoint : GoAlongFreepoints)
		{
			if (FInteractionSpotHandle(Freepoint.FreepointName).GetLocation() == FVector::ZeroVector)
			{
				PrintError(f"{this.GetName()}: This point does not exist: {Freepoint.FreepointName}");
			}
		}
	}

	UFUNCTION(BlueprintOverride)
	FBox EstimateMovementBoundingBox() const
	{
		return FBox(FVector(-MAX_flt, -MAX_flt, -MAX_flt), FVector(MAX_flt, MAX_flt, MAX_flt));
	}

#if EDITOR
	UFUNCTION(BlueprintOverride)
	void DebugDrawInWorld() const
	{
		if (GoAlongFreepoints.IsEmpty())
			return;

		TArray<FVector> Locations;
		for (int32 i = 0; i < GoAlongFreepoints.Num(); i++)
		{
			FInteractionSpotHandle SpotHandle(GoAlongFreepoints[i].FreepointName);
			Locations.Add(SpotHandle.Location);

			if (SpotHandle.Location == FVector::ZeroVector)
			{
				DebugScript::DrawLine(SpotHandle.Location, SpotHandle.Location + FVector::UpVector * 80000.f, FColor::Red, 500.f);
			}
			DebugScript::DrawSphere(SpotHandle.Location, 30.f, FColor::Cyan);
		}

		DebugScript::DrawMovingPearlChain(Locations, FColor::Cyan);
	}
#endif

#if WITH_IMGUI
	UFUNCTION(BlueprintOverride)
	void DisplayImGui()
	{
		for (int32 i = 0; i < GoAlongFreepoints.Num(); i++)
		{
			auto& Freepoint = GoAlongFreepoints[i];
			bool bIsActiveTarget = i == TargetSpotIdx;

			FString Message = f"{Freepoint.FreepointName.ToString()}   -   {Freepoint.WalkSpeed}";
			ImGui::TextColored(bIsActiveTarget ? FColor::Green : FColor::White, Message);
		}
	}
#endif
}

/** Returns true if the given AI is currently guiding and has arrived at the guiding destination. */
UFUNCTION(BlueprintCallable)
mixin bool HasReachedGoAlongFreepointsDestination(const UGameplayAbility_AI AI)
{
	// Cannot just pass this in directly, as this function may be used from a Conversation, which only knows UGameplayAbility_AI.
	auto CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);

	if (!IsValid(CharacterAI))
		return false;

	auto GuidingState = CharacterAI.FindActiveStateByClass(UAIState_GoToAlongFreepoints);

	if (!IsValid(GuidingState))
		return false;

	return GuidingState.bHasReachedDestination;
}
