class UGE_BreathOfDeath_WeaponDeath : UGE_WeaponDeath
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Weapon_Death_BreathOfDeath);
	
	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_Weapon_Death_BreathOfDeath);

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Death_Weapon_BreathOfDeath);
	default GameplayCues.Add(cue);
}