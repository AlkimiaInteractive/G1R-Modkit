UCLASS()
class ULightingMagnetConfig : USpellProjectileDefinition
{
	default m_Name = "LightingMagnetDamage";

	default m_HitEffect = UGE_LightingMagnetDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Environment_Lightning, 50.0f);

	UPROPERTY()
	FVector m_DamageBoxExtent = FVector(100,100,100);
	UPROPERTY()
	float m_DamageDuration = 0.5f;

	default SetItemType(GameplayTag::Item_Weapon_Environment);

}

class UKnockbackDataLightingMagnet : UKnockbackDataGeneric
{
    default m_KnockbackFloorRange = 5.f;
    default m_KnockbackTopRange = 6.f;

	default m_KnockbackEffect = UGE_Knockback_LightningMagnet::StaticClass();
}
//@DE - Custom knockback that not remove electric damage. DO NOT USE in other place.
class UGE_Knockback_LightningMagnet : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Knockback);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Knockback);    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_LockMovement);

    
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Knockback);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);

    	//When the character get broken their super armor, if its freeze, this remove it effect
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
    default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling); 
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);
}


class UGE_LightingMagnetDamage : UGE_Damage_Fire
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_LightingMagnet_StateKillable::StaticClass()));
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_LightingMagnet_NoElectrifiedDamage::StaticClass()));
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_Electrified_Impact_Paralyze_LightingMagnet::StaticClass()));
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass(), true));

}

//@DE - Allow be killed by the lightning damage
UCLASS()
class UGE_LightingMagnet_StateKillable : UScriptGameplayEffect
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Killable);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = .5f; // Duration in seconds of the effect ( 0 = infinite )
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	//Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

UCLASS()
class UGE_LightingMagnet_NoElectrifiedDamage : UScriptGameplayEffect
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Montage_NoPlayMontage);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5.0f; // Duration in seconds of the effect ( 0 = infinite )
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	//Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

UCLASS()
class UGE_Electrified_Impact_Paralyze_LightingMagnet: UGE_Electrified_Impact
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5.0f; 
}
