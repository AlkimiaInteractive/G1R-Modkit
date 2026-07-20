class UGA_DeactivateTickOptimizer : UGameplayAbilityCreatureSpecialState
{
    default AbilityTags.AddTag(GameplayTag::Ability_State_DeactivateTickOptimizer);
    default AbilityTags.AddTag(GameplayTag::AbilitySpec_Continuous);

    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_State_DeactivateTickOptimizer);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_State_DeactivateTickOptimizer);

    
    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        if(HasAuthority())
        {
            UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(GetAvatarActorFromActorInfo(), false);
        }

    }
}

