
class UGA_BreakSuperArmor : UGameplayAbilityBreakArmorHit
{
    default m_ResetEffect = UGE_ResetSuperArmor::StaticClass();
    default m_ImmunityEffect = UGE_InmunitySuperArmor::StaticClass();
    default m_DefaultFeedback = UGenericMeleeFeedback::StaticClass();

    default m_KnockbackDataClass = UKnockbackDataDefault::StaticClass();
   
}

class UGA_BreakSuperArmor_Forced : UGA_BreakSuperArmor
{
    default AbilityTriggers.Empty();
    
    default TriggerBeginOn(GameplayTag::Event_Hit_BreakArmorHit);
}

class UKnockbackDataGeneric : UKnockbackData
{
    default m_KnockbackFloorRange = 0.01f;
    default m_KnockbackTopRange = 0.01f;

    //The values of the sections are set as default on code as "Loop" and "LoopEnd"
    //They are exposed for design purposes
    default m_MontageLoopSection = FName("Loop");
    default m_MontageEndLoopSection = FName("LoopEnd");

    default m_KnockbackEffect = UGE_Knockback::StaticClass();

    default m_RootMotionMultiplierKnockback = 1.f;
}

class UKnockbackDataDefault : UKnockbackDataGeneric
{
    default m_RootMotionMultiplierBreakArmorHit = 0.5f;
}

//The AI must have lock movement when lying 
class UGE_Knockback : UScriptGameplayEffect
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
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
    default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling); 
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);
}
