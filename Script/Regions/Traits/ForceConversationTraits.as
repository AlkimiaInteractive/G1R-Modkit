UCLASS(meta=(DisplayName="Allow Weapons On Force Conversation"))
class URegionTrait_ForceConversationWeaponsAllowed : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::State_ForcedConversation_AllowWeapons);
}