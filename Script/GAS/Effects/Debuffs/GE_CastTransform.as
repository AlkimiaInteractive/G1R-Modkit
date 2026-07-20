class UGE_CastTransform : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast);
    default GameplayCues.Add(cue);
}

class UGE_CastTransformCooldown : UScriptGameplayEffect
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Cooldown_Cast_Transform);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default bExecutePeriodicEffectOnApplication = false;

	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.5;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Cooldown_Cast_Transform);
}

class UGE_CastTransform_Biter : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Bloodfly : UGameplayEffect_AbilitySet
{   FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast_Bloodfly);
    default GameplayCues.Add(cue);
    
}

class UGE_CastTransform_Bloodhund : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_FireLizard : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Harpy : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Lizard : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Lurker : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Meatbug : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Minecrawler : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast_Minecrawler);
    default GameplayCues.Add(cue);
}

class UGE_CastTransform_Molerat : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_OrcDog : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast_OrcDog);
    default GameplayCues.Add(cue);
}

class UGE_CastTransform_Razor : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Scavenger_Medium : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Shadowbeast : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast_ShadowBeast);
    default GameplayCues.Add(cue);
}

class UGE_CastTransform_Snapper : UGameplayEffect_AbilitySet
{
    
}

class UGE_CastTransform_Swampshark : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast_Swampshark);
    default GameplayCues.Add(cue);
}

class UGE_CastTransform_Wolf : UGameplayEffect_AbilitySet
{
    FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Magic_Transform_Cast_Wolf);
    default GameplayCues.Add(cue);
}
