UCLASS()
class UParalyzeDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Paralyzed;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Paralyzed_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Paralyzed_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UParalyzeDebuffEffectComponent>(NewObject(OuterActor, UParalyzeDebuffEffectComponent::StaticClass(), FName("ParalyzeEffectComponent")));
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
}



