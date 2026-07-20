
class UGA_Spell_UnControl: UGameplayAbilityUnControl
{
    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_ControlledEffect = UGE_TargetControlled::StaticClass();
    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_CasterControllingEffect = UGE_Controlling::StaticClass();
    default m_CameraTravelInitialDelay = 0.2f;
    default m_CameraTravelDuration = 1.0f;

    UFUNCTION(BlueprintOverride)
    void OnUnControl_Scriptable(const AAIAgentCharacter controlledCharacter)
    {
        if(controlledCharacter.HasAuthority())
        {
            auto controlledAbilityComponent = controlledCharacter.GetAbilitySystemComponent();
            controlledAbilityComponent.RemoveActiveGameplayEffectBySourceEffect(m_ControlledEffect, controlledAbilityComponent);
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnFinishedUnControl_Scriptable(const AGothicCharacter characterControlling, const AAIAgentCharacter controlledCharacter)
    {
        if(characterControlling.HasAuthority())
        {
            auto controllingAbilityComponent = characterControlling.GetAbilitySystemComponent();
            controllingAbilityComponent.RemoveActiveGameplayEffectBySourceEffect(m_CasterControllingEffect, controllingAbilityComponent, -1);
        }
    }
}