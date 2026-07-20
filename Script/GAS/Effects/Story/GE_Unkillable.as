UCLASS()
class UGE_Human_AI_Unkillable : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_UnKillable);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_UnKillable);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default DurationPolicy = EGameplayEffectDurationType::Infinite;

    default StackLimitCount = 1;
}