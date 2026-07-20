class UGA_Stunned_XardasSleeper : UGA_Creature_PlayMontage_Base
{    
    default ActivationOwnedTags.AddTag(GameplayTag::State_IgnoreMovementInput);
    default ActivationOwnedTags.AddTag(GameplayTag::State_BlockState);
    default ActivationOwnedTags.AddTag(GameplayTag::State_LockMovement);

    default	BlockAbilitiesWithTag.RemoveTag(GameplayTag::Ability_Hit);
	default BlockAbilitiesWithTag.RemoveTag(GameplayTag::State_Hit);

    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeper_S1H_Stunned_Loop_Montage.A_XardasSleeper_S1H_Stunned_Loop_Montage'";
    default TriggerEndOn(GameplayTag::End_Action_XardasSleeper_Stunned);

    default m_StopWhenAbilityEnds = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        
    }

    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        
    }

    UFUNCTION(BlueprintOverride)
    void OnPlayMontageFailed_Scriptable()
    {
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        //Print("UGA_Stunned_XardasSleeper End");
    }

}