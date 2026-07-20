UCLASS()
class UCharmDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Charm;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Charm_Start;
    default m_PerceptionTagWhenLoad = GameplayTag::Perception_Spell_Debuff_Charm_Load;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Charm_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UCharmDebuffEffectComponent>(NewObject(OuterActor, UCharmDebuffEffectComponent::StaticClass(), FName("CharmEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
