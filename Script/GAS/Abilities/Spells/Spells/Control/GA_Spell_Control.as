
class UGA_Spell_Control: UGameplayAbilitySpellControl
{
    default m_TargetControlledEffect = UGE_TargetControlled::StaticClass();
    default m_CasterControllingEffect = UGE_Controlling::StaticClass();
    default m_CameraTravelInitialDelay = 0.0f;
    default m_CameraTravelDuration = 1.3f;

    UPROPERTY()
    UAbilitySystemComponent m_ControlledAbilityComponent;
    UPROPERTY()
    FActiveGameplayEffectHandle m_ControlledEffectHandle;
    UPROPERTY()
    FActiveGameplayEffectHandle m_ControllingEffectHandle;
    
    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(const AActor controlledCharacter)
    {
        //Server only
        if(!HasAuthority())
            return;
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
        
        m_ControlledEffectHandle = m_ControlledAbilityComponent.ApplyGameplayEffectToSelf(m_TargetControlledEffect, 0, GetAbilitySystemComponentFromActorInfo().MakeEffectContext());
        m_ControllingEffectHandle = ApplyGameplayEffectToOwner(m_CasterControllingEffect);
    }

    UFUNCTION(BlueprintOverride)
    void OnSpellConditionsFailed_Scriptable(AActor TargetActor)
    {
        if(!HasAuthority())
            return;
        if(TargetActor == nullptr)
        {
            return;
        }
        const auto character = Cast<AAIAgentCharacter>(TargetActor);
        if(character == nullptr)
        { 
            return;
        }

        m_ControlledAbilityComponent = character.GetAbilitySystemComponent();    
    }


    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        if(!HasAuthority())
            return;
        if(m_ControlledAbilityComponent != nullptr)
        {
            auto targetCharacter = Cast<AGothicCharacter>(Cast<UGothicAbilitySystemComponent>(m_ControlledAbilityComponent).GetAvatar());
            Print("Cancelled");

            auto controllerActor = GetAvatarActorFromActorInfo();

            targetCharacter.Perception.ReportPerceptionEvent(
                GameplayTag::Perception_Spell_Control_End,
                targetCharacter.ActorLocation,
                SensedCharacter = targetCharacter,
                TargetActor = targetCharacter,
                InstigatorActor = controllerActor,
                AffectedActor = targetCharacter);

            m_ControlledAbilityComponent.RemoveActiveGameplayEffectBySourceEffect(m_TargetControlledEffect, GetAbilitySystemComponentFromActorInfo());
            m_ControlledAbilityComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Controlled);
        }    
        GetAbilitySystemComponentFromActorInfo().RemoveActiveGameplayEffectBySourceEffect(m_CasterControllingEffect, GetAbilitySystemComponentFromActorInfo());
    }
}