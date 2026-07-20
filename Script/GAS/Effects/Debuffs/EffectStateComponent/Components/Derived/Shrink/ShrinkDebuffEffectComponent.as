UCLASS()
class UShrinkDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Shrink;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Shrink_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Shrink_End;

    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UShrinkDebuffEffectComponent>(NewObject(OuterActor, UShrinkDebuffEffectComponent::StaticClass(), FName("ShrinkEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}