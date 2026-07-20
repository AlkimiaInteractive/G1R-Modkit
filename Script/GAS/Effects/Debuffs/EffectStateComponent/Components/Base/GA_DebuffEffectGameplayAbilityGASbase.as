class UGA_DebuffEffectGameplayAbilityGASbase : UGameplayAbilityDebuffEffect
{
    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo) const
    {
        //Print("OnCanActivateAbility_Scriptable");
        return true;
    }
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        //Print("OnActivateAbility_Scriptable");
    }

    void DoActivation()
    {
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
       
    }

}