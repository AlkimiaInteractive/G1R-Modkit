class UGE_UnTransformVisuals : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Visuals);
    default GameplayCues.Add(cue);
}

class UGE_UnTransformCooldown : UScriptGameplayEffect
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Cooldown_UnTransform);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default bExecutePeriodicEffectOnApplication = false;

	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.5;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Cooldown_UnTransform);
}

class UGE_UnTransform : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Biter : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Biter);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Bloodfly : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Bloodfly);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Bloodhound : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Bloodhound);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_FireLizard : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_FireLizard);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Harpy : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Harpy);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Lizard : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Lizard);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Lurker : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Lurker);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Meatbug : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Meatbug);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Minecrawler : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Minecrawler);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Molerat : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Molerat);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_OrcDog : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_OrcDog);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Razor : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Razor);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_ScavengerMedium : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_ScavengerMedium);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Shadowbeast : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_ShadowBeast);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Snapper : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Molerat);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Swampshark : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Swampshark);
    default GameplayCues.Add(cue);
}

class UGE_UnTransform_Wolf : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_UnTransform_Wolf);
    default GameplayCues.Add(cue);
}
