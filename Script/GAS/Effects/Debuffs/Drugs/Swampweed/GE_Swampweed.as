// Swampweed depletion over time.
class UGE_SwampweedDepletion : UGE_DrugDepletionBase
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"SwampweedDepletionRate");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.Coefficient.Value = -1.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);
}

// Swampweed depletion over time Swimming.
class UGE_SwampweedDepletionSwimming : UGE_DrugDepletionBase
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -20.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);
}

class UGE_SwampweedDebuffState : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Swampweed);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Swampweed);
}

class UGE_SwampweedDebuffBase : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
}

class UGE_SwampweedDebuffDoped : UGE_SwampweedDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Swampweed_Doped);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Swampweed_Doped);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Drugs_Low);

    default IncreaseAttributeByPercentage(UAttributeSet_Mana::StaticClass(), n"MaxMana", 0.1f);
}

class UGE_SwampweedDebuffHigh : UGE_SwampweedDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Swampweed_High);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Swampweed_High);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Drugs_Mid);

    default DecreaseAttributeByPercentage(UAttributeSet_LevelProgression::StaticClass(), n"Toughness", 0.1f); // max carry weight
    default DecreaseAttributeByPercentage(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 0.1f); 
	default IncreaseAttributeByPercentage(UAttributeSet_Mana::StaticClass(), n"MaxMana", 0.2f);

    default DecreaseAttributeByPercentage(UAttributeSet_Pickpocketing::StaticClass(), n"PickPocketing", 0.2f); //@DE - TBD
}

class UGE_SwampweedDebuffTripping : UGE_SwampweedDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Swampweed_Tripping);

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Swampweed_Tripping);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Drugs_High);


    default DecreaseAttributeByPercentage(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 0.1f);
    default DecreaseAttributeByPercentage(UAttributeSet_Strength::StaticClass(), n"Strength", 0.1f); 
    default DecreaseAttributeByPercentage(UAttributeSet_LevelProgression::StaticClass(), n"Toughness", 0.1f); // max carry weight
	default IncreaseAttributeByPercentage(UAttributeSet_Mana::StaticClass(), n"MaxMana", 0.3f);
    default DecreaseAttributeByPercentage(UAttributeSet_Pickpocketing::StaticClass(), n"PickPocketing", 0.4f); //@DE - TBD

	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Disable_Dodge); // cannot dodge
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Disable_Roll); // cannot roll
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_WeaponSkill_Untrained);
}


class UGE_Reset_Swampweed_Attribute : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 0.0f; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Override;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed"); // attribute class and name
	default Modifiers.Add(modifier);
};

class UGE_Forced_Swampweed_Insta_Base : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Swampweed);
	default GameplayCues.Add(cue);
};

class UGE_Forced_Swampweed_Insta_Low : UGE_Forced_Swampweed_Insta_Base
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 40.0f; 
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);
};

class UGE_Forced_Swampweed_Insta_Mid : UGE_Forced_Swampweed_Insta_Base
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 120.0f; 
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);
};

class UGE_Forced_Swampweed_Insta_High : UGE_Forced_Swampweed_Insta_Base
{
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 200.0f; 
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);
};