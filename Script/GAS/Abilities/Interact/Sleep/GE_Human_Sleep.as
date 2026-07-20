
class UGE_ModMagnitudeCalculation_RecoverHealthBySleeping : UGE_ModMagnitudeCalculation_BaseRecoverBySleeping
{
    default InitMaxValueAttributeToCapture(GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth"));
    default InitRecoveryRatePerHourOfSleepAttributeToCapture(GetAttribute(UAttributeSet_Health::StaticClass(), n"RecoveryRatePerHourOfSleep"));
}

class UGE_ModMagnitudeCalculation_RecoverManaBySleeping : UGE_ModMagnitudeCalculation_BaseRecoverBySleeping
{
    default InitMaxValueAttributeToCapture(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MaxMana"));
    default InitRecoveryRatePerHourOfSleepAttributeToCapture(GetAttribute(UAttributeSet_Mana::StaticClass(), n"RecoveryRatePerHourOfSleep"));
}

class UGE_RecoverAttributesBySleeping : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo healthModifier;
	default healthModifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::CustomCalculationClass;
    default healthModifier.ModifierMagnitude.CustomMagnitude.CalculationClassMagnitude = UGE_ModMagnitudeCalculation_RecoverHealthBySleeping::StaticClass();
	default healthModifier.ModifierOp = EGameplayModOp::Additive;
	default healthModifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(healthModifier);

    FGameplayModifierInfo manaModifier;
	default manaModifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::CustomCalculationClass;
    default manaModifier.ModifierMagnitude.CustomMagnitude.CalculationClassMagnitude = UGE_ModMagnitudeCalculation_RecoverManaBySleeping::StaticClass();
	default manaModifier.ModifierOp = EGameplayModOp::Additive;
	default manaModifier.Attribute = GetAttribute(UAttributeSet_Mana::StaticClass(), n"Mana");
	default Modifiers.Add(manaModifier);
}

class UGE_DecreaseSleepTime : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_SleepTime;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Sleep::StaticClass(), n"SleepTime");
	default Modifiers.Add(modifier);
}

// ===========================================
// CHAPTER-BASED STRANGE DREAM EFFECTS
// ===========================================

class UGE_Sleeping_StrangeDreams_Ch1 : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
   	// Tags of the gameplay effect
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_Dreams_Strange_Ch1);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

	// Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_Dreams_Strange_Ch1);
}

class UGE_Sleeping_StrangeDreams_Ch2 : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_Dreams_Strange_Ch2);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_Dreams_Strange_Ch2);
}

class UGE_Sleeping_StrangeDreams_Ch3 : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_Dreams_Strange_Ch3);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_Dreams_Strange_Ch3);
}

class UGE_Sleeping_StrangeDreams_Ch4 : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_Dreams_Strange_Ch4);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_Dreams_Strange_Ch4);
}

class UGE_Sleeping_StrangeDreams_Ch5 : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_Dreams_Strange_Ch5);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_Dreams_Strange_Ch5);
}

class UGE_Sleeping_StrangeDreams_Ch6 : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_Dreams_Strange_Ch6);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_Dreams_Strange_Ch6);
}

class UGE_Sleeping_OwnBed : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
   	// Tags of the gameplay effect (This helps to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Status_OwnBed);

	// Tags added to the character (This will also make the tag visible in ImGui)
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Status_OwnBed);
}
