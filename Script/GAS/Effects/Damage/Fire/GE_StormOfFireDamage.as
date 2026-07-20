// Effect applied by the spell UStormOfFireDefinition
class UGE_StormOfFireDamage : UGE_Damage_Fire
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Spell_Damage_StormOfFire);

	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));

	// The effect won be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Spell_Damage_StormOfFire);

	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}