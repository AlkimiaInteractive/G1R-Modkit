class UAIState_CheckWeather_RainStarted : UGothicCharacterAIState
{
    UAIState_CheckWeather_RainStarted()
    {
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (IsInDailyRoutineSimulation())
            return;

        if (Self.IsUnderRoof())
            return;

        AI.TryInteractionWithoutSpot(GameplayTag::Action_Ambient_RainStart);
    }
}