class UGE_FireDemonFireExplosion : UGE_Damage
{

	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireDemonFireExplosionBurn::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireDemonFireExplosionBurn::StaticClass();

	// FGameplayEffectExecutionDefinition ExDef;
	// default ExDef.CalculationClass = UGE_Ex_FireDemon_FireExplosion_BurnCalculator::StaticClass();

	// // Effect applied if this effect is applied successfully
	// FConditionalGameplayEffect condEffect;
	// default condEffect.EffectClass = UGE_FireDemonFireExplosionBurn::StaticClass();
	// default ExDef.ConditionalGameplayEffects.Add(condEffect);
	// default Executions.Add(ExDef);
}

// Effect applied after UGE_FireStack is overflowed
// This effect will burn the player for X seconds
class UGE_FireDemonFireExplosionBurn : UGE_Burn
{
    // default Modifiers.Empty();
    // FGameplayModifierInfo modifierInfo;
	// default modifierInfo.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	// default modifierInfo.ModifierMagnitude.ScalableFloatMagnitude.Value = -1.0f; // How much damage applies to the attribute
	// default modifierInfo.ModifierOp = EGameplayModOp::Additive;
	// default modifierInfo.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
	// default Modifiers.Add(modifierInfo);

	// // Duraction of the effect
	// default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	// default DurationMagnitude.ScalableFloatMagnitude.Value = 10; // Duration in seconds of the effect
    
    // //default Period.Value = 0.5f; // Applied each seconds
}