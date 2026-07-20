class UGA_ParalyzeDebuffEffectGameplayAbility : UGA_DebuffEffectGameplayAbilityGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Paralyze);

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Roll);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat_Dodge);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Jump);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Action_EndRiding);
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Fly);

    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Roll);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat_Dodge);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Jump);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Fly);

    

    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action);
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
    
    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);


    // UFUNCTION(BlueprintOverride)
    // void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
    //                                   FGameplayEventData TriggerEventData)
    // {
    //     Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
    //     FGameplayTagContainer tags;
    //     tags.AddTag(GameplayTag::State_IgnoreMovementInput);
	//     tags.AddTag(GameplayTag::State_BlockState);
	//     tags.AddTag(GameplayTag::State_LockMovement);
	//     tags.AddTag(GameplayTag::State_Ignore_FreezeFrame);
    //     GetAbilitySystemComponentFromActorInfo().AddLooseGameplayTags(tags);
    // }

    // UFUNCTION(BlueprintOverride)
    // void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    // {
    //     FGameplayTagContainer tags;
    //     tags.AddTag(GameplayTag::State_IgnoreMovementInput);
	//     tags.AddTag(GameplayTag::State_BlockState);
	//     tags.AddTag(GameplayTag::State_LockMovement);
	//     tags.AddTag(GameplayTag::State_Ignore_FreezeFrame);
    //     GetAbilitySystemComponentFromActorInfo().RemoveLooseGameplayTags(tags);
    //     Super::OnEndAbility_Scriptable(Info, WasCancelled);
        
    // }
}