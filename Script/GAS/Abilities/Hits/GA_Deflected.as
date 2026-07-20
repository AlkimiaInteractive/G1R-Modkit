class UGE_Deflect : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Damage;
	default modifier.ModifierOp = EGameplayModOp::Override;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"DamageMultiplier");
	default Modifiers.Add(modifier);
}

class UGA_Deflected : UGameplayAbilityDeflectedHit
{
    default m_ResetEffect = UGE_ResetSuperArmor::StaticClass();
    default m_ImmunityEffect = UGE_InmunitySuperArmor::StaticClass();
    default m_ParriedEffect = UGE_Parried::StaticClass();
	default m_DefaultFeedback = UGenericMeleeFeedback::StaticClass();
}