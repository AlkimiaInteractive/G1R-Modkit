UCLASS()
class UGE_Human_BlockFinalCombatTags : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_RidingBlocked);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Spell_Teleport_Blocked);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_RidingBlocked);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default DurationPolicy = EGameplayEffectDurationType::Infinite;

    default StackLimitCount = 1;
}