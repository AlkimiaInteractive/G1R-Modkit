class UAIState_Hunt : UGothicCharacterSimulateableAIState
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);
        
    UAIState_Hunt(FGameplayTag InCreatureSpecies)
    {
        CreatureSpecies = InCreatureSpecies;
    }

    UPROPERTY()
    AGothicCharacter _InitialTarget;

    UPROPERTY()
    FGameplayTag CreatureSpecies;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.StartHunting(CreatureSpecies, nullptr);
        AI.Lurk();

        while (!bShouldExitState)
        {
            WaitSeconds(10.0f);
        }
    }
}