UCLASS()
class UGE_ElementalDebuffBase : UScriptGameplayEffect
{
}

class UGE_Paralyze_Base : UGE_ElementalDebuffBase
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Paralyzed);
	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Paralyzed);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Cant_Paralyzed);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}