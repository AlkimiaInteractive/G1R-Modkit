
class UGE_Item_Heal_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Heal;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
};

class UGE_Item_MaxHeal_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_MaxHeal;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
	default Modifiers.Add(modifier);
};

class UGE_Item_Heal_Overtime : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_NeedSaveEffectContext);
	
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default DurationMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Duration;

	default Period.Value = 1.0f; // Applied each seconds

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Heal;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
};

class UGE_Item_Mana_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Mana;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Mana::StaticClass(), n"Mana");
	default Modifiers.Add(modifier);
};

class UGE_Item_MaxMana_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_MaxMana;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Mana::StaticClass(), n"MaxMana");
	default Modifiers.Add(modifier);
};

class UGE_Item_Mana_Overtime : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_NeedSaveEffectContext);
	
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default DurationMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Duration;

	default Period.Value = 1.0f; // Applied each seconds

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Mana;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Mana::StaticClass(), n"Mana");
	default Modifiers.Add(modifier);
};

class UGE_Item_Alcohol_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Alcohol;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Alcohol);
	default GameplayCues.Add(cue);
};


class UGE_Item_Swampweed_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Swampweed;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Swampweed);
	default GameplayCues.Add(cue);
};

class UGE_Item_AlcoholDrugDepletion_Overtime : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default DurationMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Duration;

	default Period.Value = 1.0f; // Applied each seconds

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Alcohol;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	default Modifiers.Add(modifier);
};

class UGE_Item_SwampweedDrugDepletion_Overtime : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default DurationMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Duration;

	default Period.Value = 1.0f; // Applied each seconds

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Swampweed;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Swampweed::StaticClass(), n"Swampweed");
	default Modifiers.Add(modifier);
};

class UGE_Item_Strength_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Strength;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength");
	default Modifiers.Add(modifier);
};

class UGE_Item_Dexterity_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Dexterity;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity");
	default Modifiers.Add(modifier);
};

class UGE_Item_Experience_Insta : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Experience;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Experience");
	default Modifiers.Add(modifier);
};

