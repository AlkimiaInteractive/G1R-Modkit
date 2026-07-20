UCLASS()
class UDailyRoutine_Generic_FollowHero : UAIState_DailyRoutine_Human
{
    default OwnedGameplayTags.AddLeafTag(GameplayTag::State_IgnoreCrimes_Party);
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(150), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_Generic_WaitHero : UAIState_DailyRoutine_Human
{
    UDailyRoutine_Generic_WaitHero(FName InWaitWaypoint)
    {
        WaitWaypoint = InWaitWaypoint;
    }

    UPROPERTY()
    FName WaitWaypoint;

    default Schedule(23, 0, UAIState_Wait(), WaitWaypoint);
}

