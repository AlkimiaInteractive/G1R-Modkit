
class UGA_ControlDebug: UGameplayAbilitySpellControlDebug
{
    default m_TargetControlledEffect = UGE_TargetControlled::StaticClass();
    default m_CasterControllingEffect = UGE_Controlling::StaticClass();

    UPROPERTY()
    UAbilitySystemComponent m_ControlledAbilityComponent;

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(const AActor controlledCharacter)
    {
        //only server
        if(controlledCharacter == nullptr)
        {
            return;
        }
        const auto character = Cast<AAIAgentCharacter>(controlledCharacter);
        if(character == nullptr)
        { 
            return;
        }
        m_ControlledAbilityComponent = character.GetAbilitySystemComponent();
        
        m_ControlledAbilityComponent.ApplyGameplayEffectToSelf(m_TargetControlledEffect, 0, m_ControlledAbilityComponent.MakeEffectContext());
        ApplyGameplayEffectToOwner(m_CasterControllingEffect);
    }


    UFUNCTION(BlueprintOverride)
    void OnEndAbility(bool bWasCancelled)
    {
        if(!HasAuthority())
            return;

        if(m_ControlledAbilityComponent != nullptr)
            m_ControlledAbilityComponent.RemoveActiveGameplayEffectBySourceEffect(m_TargetControlledEffect, GetAbilitySystemComponentFromActorInfo());
        GetAbilitySystemComponentFromActorInfo().RemoveActiveGameplayEffectBySourceEffect(m_CasterControllingEffect, GetAbilitySystemComponentFromActorInfo());
        
    }
}