UCLASS()
class USwampweedDebuffEffectComponent : UDrugDebuffEffectComponentBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Swampweed;
    default m_PerceptionStartTag = GameplayTag::Perception_Debuff_Drugs_Swampweed_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Debuff_Drugs_Swampweed_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<USwampweedDebuffEffectComponent>(NewObject(OuterActor, USwampweedDebuffEffectComponent::StaticClass(), FName("SwampweedEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }
}
