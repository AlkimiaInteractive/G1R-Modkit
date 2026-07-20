class UAIState_InterruptedSomeoneWaiting : UGothicCharacterAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.EndAnyOngoingInteractionInstant();
        
        while (!bShouldExitState)
        {
            WaitSeconds(1.0f);
            AI.GotoCharacter(Other, 200.0f);
            AI.ForceSightPerception(Other.CharacterState);

            WaitSeconds(5.0f);
            EndTaskAsSuccess();
            return;
        }
    }
}