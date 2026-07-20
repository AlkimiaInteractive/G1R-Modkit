
class UGE_State_Invulnerable_XardasSleeper : UGE_State_Invulnerable
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;

	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Invulnerable_XardasSleeper);

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	//default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Paralyzed);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Charm);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Shrink);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Knockback);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Wind);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlled);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}