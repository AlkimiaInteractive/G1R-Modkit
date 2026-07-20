UCLASS()
class ASlowdownDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_SlowDownDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_SlowdownDebuffEffectGameplayAbility::StaticClass();

    FGameplayAbilitySpecHandle m_abilityHandle;

    UFUNCTION(BlueprintCallable)
    void GiveMovementOverrideAbility()
    {
        if(!HasAuthority())
            return;
        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(m_Target);
        if(targetCharacter == nullptr)
            return;
        auto targetAbComp = GothicGAS::GetAbilitySystemComponent(m_Target);
        m_abilityHandle = targetAbComp.GiveAbility(UGameplayAbilityMovementOverride::StaticClass(), 1, -1, nullptr);
    }

    UFUNCTION(BlueprintCallable)
    void ClearMovementOverrideAbility()
    {
        if(!HasAuthority())
            return;
        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(m_Target);
        if(targetCharacter == nullptr)
            return;
        auto targetAbComp = GothicGAS::GetAbilitySystemComponent(m_Target);
        targetAbComp.ClearAbility(m_abilityHandle);
    }

    UFUNCTION(BlueprintCallable)
    void ActivateMovementOverrideAbility()
    {
        if(!HasAuthority())
            return;

        FGameplayEventData payload;
        Cast<USlowdownDebuffEffectComponent>(m_OwnerComponent).CreateTargetData_WalkSpeed(payload);
        GothicGAS::SendGameplayEvent(m_Target, GameplayTag::Action_Movement_Override, payload);
    }

    UFUNCTION(BlueprintCallable)
    void DeactivateMovementOverrideAbility()
    {
        if(!HasAuthority())
            return;
        
        FGameplayEventData payload;
        GothicGAS::SendGameplayEvent(m_Target, GameplayTag::End_Action_Movement_Override, payload);
    }

} 

