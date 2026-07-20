class UGE_FireRainDamage : UGE_Damage_Fire_Infinite
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::NoGeneratePerceptionEventHit);
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
}