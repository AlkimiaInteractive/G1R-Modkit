class UGA_MadCorKalom_PlayMontage : UGA_Creature_PlayMontage_Base
{ 
    default AbilityTags.RemoveTag(GameplayTag::Ability_Action_Creature_PlayMontage);

    default m_ActivateAbilityOnGranted = true;

    default m_StopWhenAbilityEnds = false;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GothicMovementComponent.SetMovementMode(EMovementMode::MOVE_Custom);
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
    }

}
