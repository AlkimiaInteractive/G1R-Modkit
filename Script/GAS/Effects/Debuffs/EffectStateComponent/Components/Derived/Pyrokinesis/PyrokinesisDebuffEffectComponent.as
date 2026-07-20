UCLASS()
class UPyrokinesisDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Pyrokinesis;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Pyrokinesis_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Pyrokinesis_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UPyrokinesisDebuffEffectComponent>(NewObject(OuterActor, UPyrokinesisDebuffEffectComponent::StaticClass(), FName("PyrokinesisEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
