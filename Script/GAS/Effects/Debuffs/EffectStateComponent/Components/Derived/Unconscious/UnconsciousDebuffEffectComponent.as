UCLASS()
class UUnconsciousDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Unconscious;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Unconscious_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Unconscious_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UUnconsciousDebuffEffectComponent>(NewObject(OuterActor, UUnconsciousDebuffEffectComponent::StaticClass(), FName("UnconsciousEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}



