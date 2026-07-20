UCLASS()
class ULordDemon_Pyrolaser : UWeapon_Pyrolaser_Base
{
    default m_Name = "LordDemon_Pyrolaser";
    //default m_OnEquipEffect = UGE_Lizard_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Pyrolaser_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.00f);

	default m_SuperArmorDamageBase = 50.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 100.0f;

	UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    TSubclassOf<UScriptGameplayEffect> m_ForcedKnockbackEffect = UGE_LordDemon_Pyrolaser_ForceKnockback::StaticClass();
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FGameplayTag m_ImpactType = GameplayTag::Combat_HitType_Knockback;
}

class UGE_LordDemon_Pyrolaser_ForceKnockback : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 1.f; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);
}
