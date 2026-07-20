UCLASS(meta=(DisplayName="InSwampCamp"))
class URegionTrait_Story_Quest_InSwampCamp : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::Conversation_InSwampCamp);
}