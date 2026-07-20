class UGE_ManaBurn : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default bExecutePeriodicEffectOnApplication = false;

	default DurationMagnitude.ScalableFloatMagnitude.Value = 1;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	default Period.Value = 0.1f;
	
	FGameplayModifierInfo modifier;
	default modifier.Attribute = GetAttribute(UAttributeSet_Mana::StaticClass(), n"Mana");
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Mana;
	default Modifiers.Add(modifier);
}

class UGE_Mana_Channeling : UGE_ManaBurn
{
   default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Channeling);
}

class UGE_Mana_AimingLaunchingSpell : UGE_ManaBurn
{
  default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_AimingLaunchingSpell);
}

class UGE_NoManaBurn : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_NoManaBurn);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default bExecutePeriodicEffectOnApplication = false;

	default DurationMagnitude.ScalableFloatMagnitude.Value = 1;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	default Period.Value = 0.5f;
	
}

class UGE_CastToCancelSpell : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_CastToCancelSpell);
	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CastToCancelSpell);	
}
