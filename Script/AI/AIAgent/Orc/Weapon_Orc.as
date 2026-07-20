
UCLASS()
class UOrcThrowStone : UProjectileDefinition
{
    default m_Name = "Orc_ThrowStone";
    default m_OnEquipEffect = UGE_Orc_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile_Right);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 3);
	default m_SuperArmorDamageBase = 7.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Orc_Stone_Visual.BP_ItAm_Orc_Stone_Visual_C'";

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    TSubclassOf<UScriptGameplayEffect> m_ForcedKnockbackEffect = UGE_Orc_ThrowStone_ForceKnockback::StaticClass();
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FGameplayTag m_ImpactType = GameplayTag::Combat_HitType_Knockback;
}

class UGE_Orc_ThrowStone_ForceKnockback : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 1; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);
}