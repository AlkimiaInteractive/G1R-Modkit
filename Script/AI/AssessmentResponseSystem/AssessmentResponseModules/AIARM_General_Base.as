UCLASS()
class UAIARM_General_Base : UAIAssessmentResponseModule
{

}

UCLASS()
class UAIARM_MainActiveResponse_Base : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_AI_NoActiveAssessmentResponses);
}