
class UGA_RememberDefeat : UGameplayAbilityMemory
{
    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.OnSomeoneElseGotKnockedOut().PerceptionGained.BindUFunction(this, n"SensedSomeoneGotKnockedOut");
        Perception.OnMyselfGotKnockedOut().PerceptionGained.BindUFunction(this, n"SensedSomeoneGotKnockedOut");
    }

    UFUNCTION()
    private void SensedSomeoneGotKnockedOut(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Combat_WasDefeated, 
                                             Perception.Affected.CharacterState, 
                                             Perception.Instigator.CharacterState);
    }
}