UCLASS(Abstract)
class UGE_Human_Protection : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default DurationPolicy = EGameplayEffectDurationType::Infinite;

    default StackLimitCount = 1;
}

UCLASS()
class UGE_Human_Protection_Bloodwyn : UGE_Human_Protection
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_OldCampProtection_Premium_Bloodwyn);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_OldCampProtection_Premium_Bloodwyn);
}

UCLASS()
class UGE_Human_Protection_Jackal : UGE_Human_Protection
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_OldCampProtection_Premium_Jackal);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_OldCampProtection_Premium_Jackal);
}

UCLASS()
class UGE_Human_Protection_Fletcher : UGE_Human_Protection
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_OldCampProtection_Premium_Fletcher);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_OldCampProtection_Premium_Fletcher);
}