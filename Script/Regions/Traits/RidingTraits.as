UCLASS(meta=(DisplayName="Block riding"))
class URegionTrait_BlockRiding : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::State_RidingBlocked);
}