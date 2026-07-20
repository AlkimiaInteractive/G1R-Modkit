UCLASS()
class USlowdownDebuffEffectComponent : UEffectComponentActivatedByTagGASBase
{
    default m_DebuffEffectTag = GameplayTag::Debuff_Slowdown;
    default m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Slowdown_Start;
    default m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Slowdown_End;
    
    UFUNCTION(BlueprintOverride)
    UEffectComponentBase SpawnEffectStateComponent_Scriptable(UObject OuterActor, UClass VisualActorClass) const
    {
        auto comp = Cast<USlowdownDebuffEffectComponent>(NewObject(OuterActor, USlowdownDebuffEffectComponent::StaticClass(), FName("SlowDownEffectComponent")));
        comp.Initialize(Cast<AActor>(OuterActor), VisualActorClass);
        return comp;
    }

 	UFUNCTION(BlueprintCallable)
 	void CreateTargetData_WalkSpeed(FGameplayEventData& EventData, EWalkSpeed Speed = EWalkSpeed::Walking)
    {
        EffectComponent::CreateTargetData_WalkSpeed(EventData, Speed);
    }
}
