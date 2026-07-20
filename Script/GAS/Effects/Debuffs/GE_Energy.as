
// class UGE_Energy : UScriptGameplayEffect
// {
// 	//Tags of the gameplay effect (This help to get the effect from the ability system)
// 	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Energy);

// 	//Tags added to the character
//     default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Energy);
	
// 	// The effect wont be added if the character already has this tag
// 	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
// 	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Energy);
	

// 	// default DurationPolicy = EGameplayEffectDurationType::HasDuration;
// 	// default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
// 	// default DurationMagnitude.ScalableFloatMagnitude.Value = 5; //Duration in seconds of the effect

// 	// FConditionalGameplayEffect conditionalEffect;
// 	// default conditionalEffect.EffectClass = UGE_Damage::StaticClass();
// 	// default ConditionalGameplayEffects.Add(conditionalEffect);
// }


class UGE_Damage_Energy : UGE_Damage
{
		// The effect wont be added if the character already has this tag
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Energy);
	
	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Energy);
}

class UGE_Damage_Energy_Duration : UGE_Damage_Energy
{
	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Energy);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.f; // Duration in seconds of the effect (0 = Infinite)
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default Period.Value = 0.5f; // Applied each seconds
}


// Effect applied by the spell UUrizielWaveOfDeathVisualDefinition
// Due to it's infinite we need to remove the effect from the target once the target is out of spell range
class UGE_Damage_Energy_Infinite : UGE_Damage_Energy_Duration
{	
	//default m_ElementalEffect = UGE_FireStack::StaticClass();
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect (0 = Infinite)
}
