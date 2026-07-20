event void FEnvironmentDebuff(FGameplayTag EventTag, const AActor Instigator);

class UEnvironmentInteractableSpellComponent : UEnvironmentGenericMagicComponent
{
    UPROPERTY()
    UGothicAbilitySystemComponent m_AbComp;
    UPROPERTY()
    UDelegateHandleContainer m_handleDelegate;

    UPROPERTY()
    FEnvironmentDebuff OnEnvironmentDebuff;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(GetOwner().GetLocalRole() != ENetRole::ROLE_Authority)
            return;
        m_AbComp = UGothicAbilitySystemComponent::GetOrCreate(GetOwner());
        m_handleDelegate = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_Debuff_Environment, this, n"OnDebuffEnvironment");    
    }

    UFUNCTION()
    void OnDebuffEnvironment(FGameplayEventData GameplayEventData)
    {
        if(OnEnvironmentDebuff.IsBound())
            OnEnvironmentDebuff.Broadcast(GameplayEventData.EventTag, GameplayEventData.Instigator);
        //auto target = Cast<AGothicCharacter>(GameplayEventData.Target);
        //if(target != GetAvatarActorFromActorInfo())
            //return;
        
        //PlayMontage(m_AnimConfig.GetSleepOutMontage(), NAME_None, 1, false);
        
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        MagicScript::DetachFromEvent(GetOwner(), m_handleDelegate);
    }
}