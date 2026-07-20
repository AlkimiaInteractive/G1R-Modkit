//@DE - Special ability to freeze time to help Mateusz Pawlowski make beautiful screenshots 
class UGA_FreezeTime : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    FKey m_InputKey = EKeys::CapsLock;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto gothicCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto inputComp = UInputComponent::Get(gothicCharacter);
        FInputActionHandlerDynamicSignature del = FInputActionHandlerDynamicSignature(this, n"OnToggleTime");

        inputComp.BindKey(m_InputKey, EInputEvent::IE_Released, del, false );
    }

    UFUNCTION()
    void OnToggleTime(FKey Key)
    {
        if(Key == m_InputKey)
            DoToggleTime();
    }

    void DoToggleTime()
    {
        auto currentTimeDilation = Gameplay::GetGlobalTimeDilation();
        if(currentTimeDilation > 0.1f)
        {
            Gameplay::SetGlobalTimeDilation(0.f);
        }
        else
        {
            Gameplay::SetGlobalTimeDilation(1.f);
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        
    }
}