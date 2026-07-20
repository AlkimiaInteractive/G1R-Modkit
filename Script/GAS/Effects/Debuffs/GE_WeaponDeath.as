//@DE - This gameplay effect can be applied on a death target to spawn a gameplay cue with custom visual effects.
class UGE_WeaponDeath : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Weapon_Death);
	
	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_Weapon_Death);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.f; // Duration in seconds of the effect (0 = Infinite)
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


    // FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Death_Weapon);
	// default GameplayCues.Add(cue);
}