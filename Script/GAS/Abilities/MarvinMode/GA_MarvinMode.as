UCLASS()
class UGA_MarvinMode : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        //@DE - Assigned to the player controller, now will be available and not depends of the current character.
        UMarvinModeComponent::GetOrCreate(Gameplay::GetPlayerController(0));
    }
}
