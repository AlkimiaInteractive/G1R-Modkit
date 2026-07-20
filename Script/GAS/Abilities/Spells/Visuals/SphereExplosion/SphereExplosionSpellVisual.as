UCLASS()
class ASphereExplosionSpellVisual : ASphereExplosion
{
    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_ProjectileDefinition; //= UIceWaveProjectileDefinition::StaticClass();
    default m_CollisionComp.m_WeaponData = m_ProjectileDefinition;

    UPROPERTY()
    FGameplayTag m_OnApplyEnvironmentDebuff = GameplayTag::Event_Debuff_Environment;
    UPROPERTY()
    FGameplayTag m_ProjectileDebuffTag = FGameplayTag();

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        m_CollisionComp.m_WeaponData = m_ProjectileDefinition;
    }

    

    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                        UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep,
                        const FHitResult&in SweepResult) override
    {     
        if(!IsValidCollision(OtherActor, OtherComp))
            return;

        auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable());
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                m_Targets.Add(interactiveActorAbilitySystemComponent);
                if(ShouldOpenInteractableDoor())
                    interactiveActor.OnImpact();
            }
            return;
        }        
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
                m_Targets.Add(environmentSpellComp.m_AbComp);
                return;
            }
        }

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;

        if(ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp, SweepResult))
            m_Targets.Add(targetAbComp);        
    }

    bool ShouldOpenInteractableDoor()
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
	TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        //effects.Add(UGE_FreezeInfinite::StaticClass());
        return effects;        
    }

    //@DE - They need know each application of the interactable debuff effect. I send the event due the GE is not applied if it already applied
    void NotifyEnvironmentDebuffToInteractableGasObjectActor(UAbilitySystemComponent InteractiveActorAbilitySystemComponent)
    {
        InteractiveActorAbilitySystemComponent.SendGameplayEvent(m_OnApplyEnvironmentDebuff, GetPayloadEnvironmentDebuff());
    }

    FGameplayEventData GetPayloadEnvironmentDebuff()
    {
        FGameplayEventData payload = FGameplayEventData();
        payload.EventTag = m_ProjectileDebuffTag;
        payload.Instigator = this;
        return payload;
    }

    UFUNCTION()
    bool ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, const FHitResult&in SweepResult)
    {
        if(!CanApplyEffect(sourceAbComp, targetAbComp))
        {
            return false;
        }
        

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Standard;
        hit_data.WeaponUsed = m_CollisionComp.m_WeaponData;
        hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
            targetAbComp.GetAvatar().GetActorForwardVector(), 
            targetAbComp.GetAvatar().GetActorRightVector(), 
            -sourceAbComp.GetAvatar().GetActorForwardVector());
        FActiveGameplayEffectHandle handle = GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            return true;
        return false;
       
    }

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp)
    {
       return sourceAbComp != nullptr && targetAbComp != nullptr && m_CollisionComp.m_WeaponData != nullptr && !m_Targets.Contains(targetAbComp);
    }

}