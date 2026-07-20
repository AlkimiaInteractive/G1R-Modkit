UCLASS()
class UGameplayAbility_CharacterAI_AITestDummy : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_AITestDummy::StaticClass();
    default ActivationOwnedTags.AddTag(GameplayTag::Debuff_AI_NoActiveAssessmentResponses);
}

class UDailyRoutine_AITestDummy : UAIState_DailyRoutine
{
    
}