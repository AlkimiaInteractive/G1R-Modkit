//UGE_Paralyzed The paralyze effect is applyed by UGE_ParalyzeVisual due its a shared effect by freeze, electric
class UGE_Paralyze: UGE_DebuffEffectVisual
{
	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Paralyzed);

	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Controller);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreMovementInput);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_BlockState);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_LockMovement);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Ignore_FreezeFrame);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
	
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Paralyzed);

	//@DE - TBD
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Wind);
    
}


class UGE_ParalyzeDebuffVisualEffect: UGE_Paralyze
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Visual_Paralyzed);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Visual_Paralyzed);
    
    // The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Visual_Paralyzed);

	
}


//Not used. Created only for constantness. The paralyze effect is a secondary effect of the electrified and freeze damage.
class UGE_Paralyze_Cooldown: UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Cooldown_Paralyze);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds.

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Cooldown_Paralyze);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Paralyze);

	//default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Paralyzed);
    //default RemoveOtherTags();
}
