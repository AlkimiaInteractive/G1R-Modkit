
class UGE_WaterMovement : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
    
}

class UGA_EquipWaterWeapon : UGameplayAbility_EquipWaterWeapon
{
    
}

class UGE_WalkingOnWater : UGE_WaterMovement
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Water_Walking);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_Water_Walking);
	
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::GE_Water_Walking);

    default TagsToRemoveOther.AddTag(GameplayTag::GE_Water);
    default RemoveOtherTags();

    FGameplayAbilitySpecConfig ability_Spec;
	default ability_Spec.Ability = UGA_EquipWalkingOnWaterWeapon;
	default ability_Spec.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	default AbilitiesComponent.GrantAbilityConfigs.Add(ability_Spec);
}

class UGA_EquipWalkingOnWaterWeapon : UGA_EquipWaterWeapon
{
   default m_WeaponType = GameplayTag::Item_Weapon_WaterWalking;
}

class UGE_Swimming : UGE_WaterMovement
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Water_Swimming);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_Water_Swimming);
	
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::GE_Water_Swimming);

    default TagsToRemoveOther.AddTag(GameplayTag::GE_Water);
    default RemoveOtherTags();

    FGameplayAbilitySpecConfig ability_Spec;
	default ability_Spec.Ability = UGA_EquipSwimmingWeapon;
	default ability_Spec.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	default AbilitiesComponent.GrantAbilityConfigs.Add(ability_Spec);

	FConditionalGameplayEffect conditionalKillableGE;
	default conditionalKillableGE.EffectClass = UGE_Swimming_Killable::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalKillableGE);

	//When the character get burn, if its freeze, this remove the effect
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}

class UGE_Swimming_Killable : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_UnKillable);
	default TargetTagRequirements.RemovalTagRequirements.IgnoreTags.AddTag(GameplayTag::GE_Water_Swimming);
	
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Killable);
    
}

class UGA_EquipSwimmingWeapon : UGA_EquipWaterWeapon
{
   default m_WeaponType = GameplayTag::Item_Weapon_Swimming;
}

class UGE_Diving : UGE_WaterMovement
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Water_Diving);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_Water_Diving);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::GE_Water_Diving);

    default TagsToRemoveOther.AddTag(GameplayTag::GE_Water);
    default RemoveOtherTags();

	FConditionalGameplayEffect conditionalKillableGE;
	default conditionalKillableGE.EffectClass = UGE_Diving_Killable::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalKillableGE);

	//When the character get burn, if its freeze, this remove the effect
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}

class UGE_Diving_Lurker : UGE_Diving
{
    FGameplayAbilitySpecConfig ability_Spec;
	default ability_Spec.Ability = UGA_EquipDivingWeapon;
	default ability_Spec.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	default AbilitiesComponent.GrantAbilityConfigs.Add(ability_Spec);
}

class UGE_Diving_Killable : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_UnKillable);
	default TargetTagRequirements.RemovalTagRequirements.IgnoreTags.AddTag(GameplayTag::GE_Water_Diving);
	
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Killable);
    
}


class UGA_EquipDivingWeapon : UGA_EquipWaterWeapon
{
   default m_WeaponType = GameplayTag::Item_Weapon_Diving;
}