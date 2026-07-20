class UAIState_FoundSomeoneInMyBed : UGothicCharacterAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.EndAnyOngoingInteractionInstant();

        bool bAssessActionsDone = false;
        
        while (!bShouldExitState)
        {
            if (bAssessActionsDone)
            {
                WaitSeconds(3.0f);
                EndTaskAsSuccess();
                return;
            }

            WaitSeconds(1.0f);
            AI.GotoCharacter(Other, 200.0f);
            AI.ForceSightPerception(Other.CharacterState);            

            if (!Other.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState))
            {
                // Doing this outside of this callstack, as the assessment may hard-cancel this AIState and that's not safe to do
                System::SetTimerForNextTick(this, "AssessCrimeEvent");
            }

            bAssessActionsDone = true;
        }
    }

    UFUNCTION()
    private void AssessCrimeEvent()
    {
        // Interact crime
        FRememberedPerception FakeInteractionCrime;
        FakeInteractionCrime.EventTag = GameplayTag::Crime_Interaction;
        FakeInteractionCrime.Affected.Character = Self;
        FakeInteractionCrime.Affected.CharacterState = Self.CharacterState;
        FakeInteractionCrime.Instigator.Character = Other;
        FakeInteractionCrime.Instigator.CharacterState = Other.CharacterState;

        FakeInteractionCrime.Magnitude = 5.0f;

        AI.AssessEvent(GameplayTag::Crime_Interaction, FakeInteractionCrime);
    }
}