UCLASS()
class UBurnDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Burn;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Burn_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Burn_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UBurnDebuffEffectComponent>(NewObject(OuterActor, UBurnDebuffEffectComponent::StaticClass(), FName("BurnEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
