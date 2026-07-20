UCLASS()
class UGE_Human_AI_Unlootable : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_UnLootable);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_UnLootable);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default DurationPolicy = EGameplayEffectDurationType::Infinite;

    default StackLimitCount = 1;
}