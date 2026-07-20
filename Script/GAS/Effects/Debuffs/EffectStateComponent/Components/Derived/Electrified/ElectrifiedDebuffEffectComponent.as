UCLASS()
class UElectrifiedDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Electrified;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Electrified_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Electrified_End;

    FGameplayTag m_EnvironmentElectrifiedTag = GameplayTag::Environment_Debuff_Electrified_Area;

    TSubclassOf<UScriptGameplayEffect> m_CoolDownGE = UGE_Electrified_Impact_Cooldown::StaticClass();
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UElectrifiedDebuffEffectComponent>(NewObject(OuterActor, UElectrifiedDebuffEffectComponent::StaticClass(), FName("ElectrifiedEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }

    UFUNCTION(BlueprintOverride)
    TArray<FActiveGameplayEffectHandle> GetActiveGameplayEffectsWithTag_Scriptable(UGothicAbilitySystemComponent ABComp)
    {
        FGameplayTagContainer tags;
	    tags.AddTag(m_EnvironmentElectrifiedTag);
	    return ABComp.GetActiveEffectsWithAllTags(tags);
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
