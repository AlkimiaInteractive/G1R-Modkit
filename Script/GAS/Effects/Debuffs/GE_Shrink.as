class UGE_Shrink : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Shrink);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Shrink);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ScaledDown);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Shrink);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_ScaledDown);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlling);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlled);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Sleep);
	// default GameplayCues.Add(cue);

		//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);

	// FGameplayAbilitySpecConfig abSpec = FGameplayAbilitySpecConfig();
	// default abSpec.Ability = UGA_Spell_Creature_Shrink::StaticClass();
	// default abSpec.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;
	// default AbilitiesComponent.GrantAbilityConfigs.Add(abSpec);
}
/*
class UGE_Shrink_Completed : UScriptGameplayEffect
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Shrink);
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}*/

class UGE_Shrink_Completed_Attributes : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayModifierInfo modifierHealth;
	default modifierHealth.ModifierMagnitude.ScalableFloatMagnitude.Value = 333.0f;
	default modifierHealth.ModifierOp = EGameplayModOp::Override;
	default modifierHealth.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifierHealth);

	FGameplayModifierInfo modifierMaxHealth;
	default modifierMaxHealth.ModifierMagnitude.ScalableFloatMagnitude.Value = 333.0f;
	default modifierMaxHealth.ModifierOp = EGameplayModOp::Override;
	default modifierMaxHealth.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
	default Modifiers.Add(modifierMaxHealth);

	FGameplayModifierInfo modifierSuperArmor;
	default modifierSuperArmor.ModifierMagnitude.ScalableFloatMagnitude.Value = 150.0f;
	default modifierSuperArmor.ModifierOp = EGameplayModOp::Override;
	default modifierSuperArmor.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"SuperArmor");
	default Modifiers.Add(modifierSuperArmor);


	FGameplayModifierInfo modifierMaxSuperArmor;
	default modifierMaxSuperArmor.ModifierMagnitude.ScalableFloatMagnitude.Value = 150.0f;
	default modifierMaxSuperArmor.ModifierOp = EGameplayModOp::Override;
	default modifierMaxSuperArmor.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"MaxSuperArmor");
	default Modifiers.Add(modifierMaxSuperArmor);

	FGameplayModifierInfo modifierStrength;
	default modifierStrength.ModifierMagnitude.ScalableFloatMagnitude.Value = 100.0f;
	default modifierStrength.ModifierOp = EGameplayModOp::Override;
	default modifierStrength.Attribute = GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength");
	default Modifiers.Add(modifierStrength);

	FGameplayModifierInfo modifierResistance_Point;
	default modifierResistance_Point.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Point.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Point.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Point");
	default Modifiers.Add(modifierResistance_Point);

	FGameplayModifierInfo modifierResistance_Edge;
	default modifierResistance_Edge.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Edge.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Edge.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Edge");
	default Modifiers.Add(modifierResistance_Edge);

	FGameplayModifierInfo modifierResistance_Blunt;
	default modifierResistance_Blunt.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Blunt.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Blunt.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Blunt");
	default Modifiers.Add(modifierResistance_Blunt);

		FGameplayModifierInfo modifierResistance_Fire;
	default modifierResistance_Fire.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Fire.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Fire.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Fire");
	default Modifiers.Add(modifierResistance_Fire);

	FGameplayModifierInfo modifierResistance_Ice;
	default modifierResistance_Ice.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Ice.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Ice.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Ice");
	default Modifiers.Add(modifierResistance_Ice);

	FGameplayModifierInfo modifierResistance_Wind;
	default modifierResistance_Wind.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Wind.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Wind.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Wind");
	default Modifiers.Add(modifierResistance_Wind);

	FGameplayModifierInfo modifierResistance_Energy;
	default modifierResistance_Energy.ModifierMagnitude.ScalableFloatMagnitude.Value = 50.0f;
	default modifierResistance_Energy.ModifierOp = EGameplayModOp::Override;
	default modifierResistance_Energy.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Energy");
	default Modifiers.Add(modifierResistance_Energy);
}