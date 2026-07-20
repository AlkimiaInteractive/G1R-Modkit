UCLASS()
class USleepDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Sleep;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Sleep_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Sleep_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<USleepDebuffEffectComponent>(NewObject(OuterActor, USleepDebuffEffectComponent::StaticClass(), FName("SleepEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
