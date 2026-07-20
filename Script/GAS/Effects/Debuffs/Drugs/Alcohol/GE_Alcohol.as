// Alcohol depletion over time.
class UGE_AlcoholDepletion : UGE_DrugDepletionBase
{

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"AlcoholDepletionRate");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.Coefficient.Value = -1.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);
}

// Alcohol depletion over time swimming.
class UGE_AlcoholDepletionSwimming : UGE_DrugDepletionBase
{

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -20.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);
}

class UGE_AlcoholDebuffState : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Alcohol);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Alcohol);
}

class UGE_AlcoholDebuffBase : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
}

class UGE_AlcoholDebuffTipsy : UGE_AlcoholDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Alcohol_Tipsy);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Alcohol_Tipsy);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Drugs_Low);

}

class UGE_AlcoholDebuffIntoxicated : UGE_AlcoholDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Alcohol_Intoxicated);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Alcohol_Intoxicated);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Drugs_Mid);
 
    default IncreaseAttributeByPercentage(UAttributeSet_Strength::StaticClass(), n"Strength", 0.1f); 
    default IncreaseAttributeByPercentage(UAttributeSet_LevelProgression::StaticClass(), n"Toughness", 0.15f); // max carry weight
    default DecreaseAttributeByPercentage(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 0.1f); 
	default DecreaseAttributeByPercentage(UAttributeSet_Mana::StaticClass(), n"MaxMana", 0.15f);

}

class UGE_AlcoholDebuffDrunk : UGE_AlcoholDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Alcohol_Drunk);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Alcohol_Drunk);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Drugs_High);


	default IncreaseAttributeByPercentage(UAttributeSet_Strength::StaticClass(), n"Strength", 0.15f); 
    default IncreaseAttributeByPercentage(UAttributeSet_LevelProgression::StaticClass(), n"Toughness", 0.25f); // max carry weight
    default DecreaseAttributeByPercentage(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 0.1f); 
	default IncreaseAttributeByPercentage(UAttributeSet_Health::StaticClass(), n"MaxHealth", 0.15f);
	default DecreaseAttributeByPercentage(UAttributeSet_Mana::StaticClass(), n"MaxMana", 0.4f);

	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Disable_Dodge); // cannot dodge
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Disable_Roll); // cannot roll
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_WeaponSkill_Untrained);

	FGameplayModifierInfo thirstRateModifier;
	default thirstRateModifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default thirstRateModifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 1.1875f;
	default thirstRateModifier.ModifierOp = EGameplayModOp::Division; // Division so it composes with the threshold multiplier.
	default Modifiers.Add(thirstRateModifier);
}


class UGE_Reset_Alcohol_Attribute : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 0.0f; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Override;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol"); // attribute class and name
	default Modifiers.Add(modifier);
};

class UGE_Forced_Alcohol_Insta_Base: UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Alcohol);
	default GameplayCues.Add(cue);
};


class UGE_Forced_Alcohol_Insta_Low : UGE_Forced_Alcohol_Insta_Base
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 60.0f; 
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);
};

class UGE_Forced_Alcohol_Insta_Mid : UGE_Forced_Alcohol_Insta_Base
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 120.0f; 
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);
};

class UGE_Forced_Alcohol_Insta_High : UGE_Forced_Alcohol_Insta_Base
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 200.0f; 
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);
};


