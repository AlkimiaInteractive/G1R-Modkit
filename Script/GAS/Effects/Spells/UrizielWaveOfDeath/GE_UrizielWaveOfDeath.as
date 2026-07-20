class UGE_Spell_UrizielWaveOfDeath : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Spell_UrizielWaveOfDeath);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	//default DurationMagnitude.ScalableFloatMagnitude.Value = .0f; // Duration in seconds of the effect ( 0 = infinite )
	//default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//default Period.Value = 0.5f; // Applied each seconds

	//Tags added to the character // This will add additional effects. Like electric sparks
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Spell_UrizielWaveOfDeath);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Spell_UrizielWaveOfDeath);
	// default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Electrified);	
	// default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_ParalyzedRemoval); //ElectrifiedInvulnerable.

	// //Visual effect
	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	// default GameplayCues.Add(cue);

	//Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}
