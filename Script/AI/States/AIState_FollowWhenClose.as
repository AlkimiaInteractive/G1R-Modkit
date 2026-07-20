
/** Follows until a certain distance is between target and follower, then ends following. When follow ends a specific DailyRoutine is started */
UCLASS()
class UAIState_FollowWhenCloseThenDoRoutine : UAIState_FollowCharacter
{
	UAIState_FollowWhenCloseThenDoRoutine(FName InCharacterToFollowUniqueName, TSubclassOf<UAIState_DailyRoutine> InRoutineToDoAfterLosingTarget, float InDistanceUntilStop,
										  float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f)
	{
		UAIState_FollowCharacter(InCharacterToFollowUniqueName, InFollowDistance, InSprintWhenFurtherAwayThan);

		DistanceUntilStop = InDistanceUntilStop;
        RoutineToDoAfterLosingTarget = InRoutineToDoAfterLosingTarget;
	}

    /** When distance between target and follower gets greater, the follower switches to RoutineToReturnTo and ends follow */
	float DistanceUntilStop = 3000.f;

    default IsTickingTask = true;

    UPROPERTY()
    TSubclassOf<UAIState_DailyRoutine> RoutineToDoAfterLosingTarget;

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        if (!IsValid(CharacterToFollow))
        {
            EndTaskAsFailure();
            return;
        }

        if (CharacterState.ActorLocation.DistSquared(CharacterToFollow.ActorLocation) > DistanceUntilStop * DistanceUntilStop)
        {
            CharacterState.ExchangeDailyRoutineToClass(RoutineToDoAfterLosingTarget);
            EndTaskAsSuccess();
        }
    }
}

/** Follows until a certain distance is between target and follower, then ends following. When follow ends a specific DailyRoutine is started */
UCLASS()
class UAIState_FollowWhenCloseThenDoRoutineAgressive : UAIState_FollowHeroAggressive
{
	UAIState_FollowWhenCloseThenDoRoutineAgressive(FName InCharacterToFollowUniqueName, TSubclassOf<UAIState_DailyRoutine> InRoutineToDoAfterLosingTarget, float InDistanceUntilStop,
										  float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f)
	{
		UAIState_FollowCharacter(InCharacterToFollowUniqueName, InFollowDistance, InSprintWhenFurtherAwayThan);

		DistanceUntilStop = InDistanceUntilStop;
        RoutineToDoAfterLosingTarget = InRoutineToDoAfterLosingTarget;
	}

    /** When distance between target and follower gets greater, the follower switches to RoutineToReturnTo and ends follow */
	float DistanceUntilStop = 3000.f;

    default IsTickingTask = true;

    UPROPERTY()
    TSubclassOf<UAIState_DailyRoutine> RoutineToDoAfterLosingTarget;

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        if (!IsValid(CharacterToFollow))
        {
            EndTaskAsFailure();
            return;
        }

        if (CharacterState.ActorLocation.DistSquared(CharacterToFollow.ActorLocation) > DistanceUntilStop * DistanceUntilStop)
        {
            CharacterState.ExchangeDailyRoutineToClass(RoutineToDoAfterLosingTarget);
            EndTaskAsSuccess();
        }
    }
}