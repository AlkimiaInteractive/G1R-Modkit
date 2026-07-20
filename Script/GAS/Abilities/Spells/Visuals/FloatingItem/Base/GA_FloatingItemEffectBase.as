class UGA_FloatingItemEffectGASbase : UGameplayAbilityFloatingItemEffect
{
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_SpellCasting);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_DrawItem);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_QuickConsume);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Jump);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_SpellCasting);
    
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

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        //Print("OnEndAbility_Scriptable");
    }
}