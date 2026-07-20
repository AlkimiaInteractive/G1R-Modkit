
class UGE_UrizielWaveOfDeath_Damage : UGE_Damage_Energy_Infinite
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::NoGeneratePerceptionEventHit);
	//default m_ElementalEffectStack = UGE_UrizielWaveOfDeath::StaticClass();

	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_UrizielWaveOfDeath);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_UrizielWaveOfDeath);
	
	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_UrizielWaveOfDeath);

}