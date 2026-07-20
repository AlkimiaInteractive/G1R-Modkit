UCLASS()
class UAlcoholDebuffEffectComponent : UDrugDebuffEffectComponentBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Alcohol;
    default m_PerceptionStartTag = GameplayTag::Perception_Debuff_Drugs_Alcohol_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Debuff_Drugs_Alcohol_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<UAlcoholDebuffEffectComponent>(NewObject(OuterActor, UAlcoholDebuffEffectComponent::StaticClass(), FName("AlcoholEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
