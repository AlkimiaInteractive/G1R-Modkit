// Effect used after receive damage
//class UGE_Damaged : UScriptGameplayEffect
//{
//	default DurationPolicy = EGameplayEffectDurationType::Instant;
//	
//	// Visual effect
//	FGameplayEffectCue cueDamage;
//	default cueDamage.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Damaged);
//	default GameplayCues.Add(cueDamage);
//}

// Effect used to apply damage
// We should always an effect which heritages from this one to apply damage
// This effect contains the CalculationClass needed to apply damage and all the required events
class UGE_Damage : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	// Class that contains the damage formula and logic
	FGameplayEffectExecutionDefinition Def;
	default Def.CalculationClass = UGE_Ex_Damage::StaticClass();

	default Executions.Add(Def);

	// Requirements to apply successfully the effect
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);

	UPROPERTY()
	TArray<FElementalEffectStackData> m_ElementalEffectStacks;
	
	//@DE - Update 15-4-26 - Split elemental effect stack to common and elemental. Common is applied to all damages, like breakFreezeStack
	UPROPERTY()
	TArray<FElementalEffectStackData> m_CommonElementalEffectStacks;
	default m_CommonElementalEffectStacks.Add(FElementalEffectStackData(UGE_FreezeHitsStack::StaticClass()));
	
}

USTRUCT()
struct FElementalEffectStackData
{
    FElementalEffectStackData(TSubclassOf<UScriptGameplayEffect> InElementalEffectStack, bool InForceOverflowStack = false)
    {
        ElementalEffectStack = InElementalEffectStack;
        ForceOverflowElementalEffectStack = InForceOverflowStack;
    }

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> ElementalEffectStack;

    UPROPERTY()
	bool ForceOverflowElementalEffectStack = false;
}


// Effect used to apply damage
// We should always an effect which heritages from this one to apply damage
// This effect contains the CalculationClass needed to apply damage and all the required events
class UGE_Blunt_Damage : UGE_Damage
{

}

//@DE - Deprecated. Now uses the damage by maxhealth percentage.
// Effect applied when the player collides with the barrier
// class UGE_WeakDamageBarrier : UScriptGameplayEffect
// {
// 	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
// 	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
// 	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.0f;
// 	default Period.Value = 0.1f;

// 	// Attribute to modify
// 	FGameplayModifierInfo modifier;
// 	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
// 	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -0.1f;
// 	default modifier.ModifierOp = EGameplayModOp::Additive;
// 	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
// 	default Modifiers.Add(modifier);
// }

// class UGE_StrongDamageBarrier : UScriptGameplayEffect
// {
// 	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
// 	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
// 	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.0f;
// 	default Period.Value = .1f;

// 	// Attribute to modify
// 	FGameplayModifierInfo modifier;
// 	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
// 	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -0.3f;
// 	default modifier.ModifierOp = EGameplayModOp::Additive;
// 	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
// 	default Modifiers.Add(modifier);
// }

class UGE_DamageBarrier_ByMaxHealthPercentage_Base : UGE_Electrified_Infinite
{
	//default DurationPolicy = EGameplayEffectDurationType::Infinite; 

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Killable);

	default AdditionalEffects.OnApplicationGameplayEffects.Empty();  
	default AdditionalEffects.OnCompleteAlways.Empty();  
}

/////UGE_WeakerDamageBarrier_ByMaxHealthPercentage - BEGIN

class UGE_WeakerDamageBarrier_ByMaxHealthPercentage : UGE_DamageBarrier_ByMaxHealthPercentage_Base
{
	FConditionalGameplayEffect conditionalDomeDamage;
	default conditionalDomeDamage.EffectClass = UGE_WeakerDamageBarrier_ByMaxHealthPercentage_Damage::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDomeDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_WeakerDamageBarrier_ByMaxHealthPercentage_Damage_Removal::StaticClass()); 

}


class UGE_WeakerDamageBarrier_ByMaxHealthPercentage_Damage : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period_Barrier_Weaker);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default DurationMagnitude.ScalableFloatMagnitude.Value = -1.0f;
	default Period.Value = .1f;

	// Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::CustomCalculationClass;
    default modifier.ModifierMagnitude.CustomMagnitude.CalculationClassMagnitude = UGE_WeakerDamageBarrier_Calculator::StaticClass();
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
	
}

class UGE_WeakerDamageBarrier_ByMaxHealthPercentage_Damage_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period_Barrier_Weaker);
	default RemoveOtherTags();
}

/////UGE_WeakerDamageBarrier_ByMaxHealthPercentage - END


/////UGE_WeakDamageBarrier_ByMaxHealthPercentage - BEGIN

class UGE_WeakDamageBarrier_ByMaxHealthPercentage : UGE_DamageBarrier_ByMaxHealthPercentage_Base
{
	FConditionalGameplayEffect conditionalDomeDamage;
	default conditionalDomeDamage.EffectClass = UGE_WeakDamageBarrier_ByMaxHealthPercentag_Damage::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDomeDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_WeakDamageBarrier_ByMaxHealthPercentag_Damage_Removal::StaticClass()); 

}

class UGE_WeakDamageBarrier_ByMaxHealthPercentag_Damage : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period_Barrier_Weak);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default DurationMagnitude.ScalableFloatMagnitude.Value = -1.0f;
	default Period.Value = .1f;

	// Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::CustomCalculationClass;
    default modifier.ModifierMagnitude.CustomMagnitude.CalculationClassMagnitude = UGE_WeakDamageBarrier_Calculator::StaticClass();
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
}

class UGE_WeakDamageBarrier_ByMaxHealthPercentag_Damage_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period_Barrier_Weak);
	default RemoveOtherTags();
}

/////UGE_WeakDamageBarrier_ByMaxHealthPercentage - END

/////UGE_StrongDamageBarrier_ByMaxHealthPercentage - BEGIN

class UGE_StrongDamageBarrier_ByMaxHealthPercentage : UGE_DamageBarrier_ByMaxHealthPercentage_Base
{
	FConditionalGameplayEffect conditionalDomeDamage;
	default conditionalDomeDamage.EffectClass = UGE_StrongDamageBarrier_ByMaxHealthPercentage_Damage::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDomeDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_StrongDamageBarrier_ByMaxHealthPercentage_Damage_Removal::StaticClass()); 
}

class UGE_StrongDamageBarrier_ByMaxHealthPercentage_Damage : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period_Barrier_Strong);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default DurationMagnitude.ScalableFloatMagnitude.Value = -1.0f;
	default Period.Value = .1f;

	// Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::CustomCalculationClass;
    default modifier.ModifierMagnitude.CustomMagnitude.CalculationClassMagnitude = UGE_StrongDamageBarrier_Calculator::StaticClass();
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
}

class UGE_StrongDamageBarrier_ByMaxHealthPercentage_Damage_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period_Barrier_Strong);
	default RemoveOtherTags();
}


/////UGE_StrongDamageBarrier_ByMaxHealthPercentage - END

class UGE_CalculatorByMaxHealth : UGE_ModMagnitudeCalculationBase
{
	UPROPERTY()
	float m_HealthPercentage = 0.f;
	UPROPERTY()
	FGameplayAttribute m_Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
	UPROPERTY()
	FGameplayEffectAttributeCaptureDefinition m_MaxAttributeDef;

	default m_MaxAttributeDef.AttributeToCapture = m_Attribute;
	default m_MaxAttributeDef.AttributeSource = EGameplayEffectAttributeCaptureSource::Target;
	default m_MaxAttributeDef.bSnapshot = false;

	default RelevantAttributesToCapture.Add(m_MaxAttributeDef);


	UFUNCTION(BlueprintOverride)
	float32 CalculateBaseMagnitude(FGameplayEffectSpec Spec) const
	{
		FGameplayTagContainer sourceTags, targetTags;
		float maxHealth = GetCapturedAttributeMagnitude(Spec, m_Attribute, sourceTags, targetTags);
		// MagicScript::DebugOnScreen(FName(FString::ApplyFormat(maxHealth * m_HealthPercentage, FString())), 25, FColor::Red);
		// MagicScript::DebugOnScreen(FName(FString::ApplyFormat(m_HealthPercentage, FString())), 25, FColor::Blue);
		// MagicScript::DebugOnScreen(FName(FString(n"------------------------------")), 25, FColor::Green);

		auto damage = float32(-(maxHealth * m_HealthPercentage));
		//@DE - At least deal 1 point of damage.
		if(Math::Abs(damage) < 1.f)
			return -1;
		else 
			return damage;		
	}
}

class UGE_WeakDamageBarrier_Calculator : UGE_CalculatorByMaxHealth
{
	default m_HealthPercentage = .01f;
}

class UGE_WeakerDamageBarrier_Calculator : UGE_CalculatorByMaxHealth
{
	default m_HealthPercentage = .002f;
}

class UGE_StrongDamageBarrier_Calculator : UGE_CalculatorByMaxHealth
{
	default m_HealthPercentage = .025f;
}



class UGE_WorldDamage : UGE_Damage
{
	
}

class UGE_WorldFallDamage : UGE_WorldDamage
{
	//@DE - Allow kill the player on high falls
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_KillCharacter);
}
