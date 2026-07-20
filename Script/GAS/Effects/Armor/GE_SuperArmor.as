class UGE_ResetSuperArmor : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Armor::StaticClass(), n"MaxSuperArmor");
	default modifier.ModifierOp = EGameplayModOp::Override;
	default modifier.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"SuperArmor");
	default Modifiers.Add(modifier);

	default TagsToRemoveOther.AddTag(GameplayTag::GE_Regenerate_SuperArmor);
    default RemoveOtherTags();	
}

class UGE_InmunitySuperArmor : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Immunity_SuperArmor);
}

class UGE_RegenerateSuperArmor : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Regenerate_SuperArmor);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
	default Period.Value = 0.5f;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_SuperArmorRegeneration;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"SuperArmor");
	default Modifiers.Add(modifier);
	
	//5.4 no idea how this must be done now
	//default TagsToRemoveOther.AddTag(GameplayTag::GE_Regenerate_SuperArmor);
    //default RemoveOtherTags();

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Freeze);
}

class UGE_WillRegenerateSuperArmor : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Regenerate_SuperArmor);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	
	default AdditionalEffects.OnCompleteNormal.Add(UGE_RegenerateSuperArmor::StaticClass());

	default TagsToRemoveOther.AddTag(GameplayTag::GE_Regenerate_SuperArmor);
    default RemoveOtherTags();
}

class UGE_IncreaseSuperArmor : UScriptGameplayEffect
{
	default TagsToRemoveOther.AddTag(GameplayTag::GE_Regenerate_SuperArmor);
    default RemoveOtherTags();

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	FGameplayModifierInfo modMaxSuperArmor;
	default modMaxSuperArmor.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modMaxSuperArmor.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_SuperArmor;
	default modMaxSuperArmor.ModifierOp = EGameplayModOp::Multiplicitive;
	default modMaxSuperArmor.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"MaxSuperArmor");
	default Modifiers.Add(modMaxSuperArmor);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Freeze);
}