UCLASS()
class UFearDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Fear;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Fear_Start;
    default m_PerceptionTagWhenLoad = GameplayTag::Perception_Spell_Debuff_Fear_Load;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Fear_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UFearDebuffEffectComponent>(NewObject(OuterActor, UFearDebuffEffectComponent::StaticClass(), FName("FearEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
