class UGA_RememberDeath : UGameplayAbilityMemory
{
    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.OnSomeoneIsExecuting().PerceptionGained.BindUFunction(this, n"SensedSomeoneGotKilled");
    }

    UFUNCTION()
    private void SensedSomeoneGotKilled(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Combat_WasKilled, 
                                             Perception.Affected.CharacterState, 
                                             Perception.Instigator.CharacterState);
    }
}