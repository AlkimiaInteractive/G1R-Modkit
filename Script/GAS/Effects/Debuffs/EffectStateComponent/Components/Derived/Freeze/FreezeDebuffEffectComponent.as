UCLASS()
class UFreezeDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Freeze;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Freeze_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Freeze_End;

    TSubclassOf<UScriptGameplayEffect> m_CoolDownGE = UGE_Freeze_Cooldown::StaticClass();
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UFreezeDebuffEffectComponent>(NewObject(OuterActor, UFreezeDebuffEffectComponent::StaticClass(), FName("FreezeEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }

    UFUNCTION(BlueprintCallable)
	void SetCustomAnimGlobalRateScale(float CustomRate)
    {
        AGothicCharacter character = Cast<AGothicCharacter>(GetOwner());
        if(character != nullptr)
            EffectComponent::SetCustomAnimGlobalRateScale(character, CustomRate);
    }
	
	UFUNCTION(BlueprintCallable, NetMulticast)
	void ForceRestoreAnimGlobalRate()
    {
        AGothicCharacter character = Cast<AGothicCharacter>(GetOwner());
        if(character != nullptr)
            EffectComponent::ForceRestoreAnimGlobalRate(character);
    }

    UFUNCTION(BlueprintOverride)
    void DoRemoveEffect_Scriptable(FGameplayEffectRemovalInfo GameplayEffectRemovalInfo)
    {
        ApplyCoolDownGE();
    }

    void ApplyCoolDownGE()
    {
        auto abComp = Cast<AGothicCharacter>(GetOwner()).GetGothicAbilitySystemComponent();
        FGameplayEffectContextHandle context = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle effect = abComp.MakeOutgoingSpec(m_CoolDownGE, 1.0f, context);
        abComp.ApplyGameplayEffectSpecToSelf(effect);
    }

}

