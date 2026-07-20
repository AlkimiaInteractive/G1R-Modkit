class UGE_BlockSpellTeleport : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
	default bExecutePeriodicEffectOnApplication = false;

    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Spell_Teleport_Blocked);
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Spell_Teleport_Blocked);
}