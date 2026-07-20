
class UGA_Teleport_XardasSleeper_PlayMontage : UGA_Creature_PlayMontage_Base
{    
    // default AbilityTags.AddTag(GameplayTag::Ability_Action_Creature_PlayMontage);
    // default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Creature_PlayMontage);
    // default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	// default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	// default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    // default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);
	
	// default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	// default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	// default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    // default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);

    // default m_ActivateAbilityOnGranted = false;


    UPROPERTY()
    FGameplayTag m_CurrentTeleportTag;
    UPROPERTY()
    AXardasSleeperTeleportSpotVisual m_CurrentTeleportSpot;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                                        FGameplayEventData TriggerEventData)
    {
        m_CurrentTeleportTag = TriggerEventData.EventTag;
        m_CurrentTeleportSpot = Cast<AXardasSleeperTeleportSpotVisual>(TriggerEventData.Target);
        m_Montage = m_CurrentTeleportSpot.GetMontage(m_CurrentTeleportTag);
    }


    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnPlayMontageFailed_Scriptable()
    {
        //Print("", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnInterruptedMontage_Scriptable()
    {
       //Print("OnInterruptedMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnCompletedMontage_Scriptable()
    {
       //Print("OnCompletedMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnBlendOutMontage_Scriptable()
    {
        //Print("OnBlendOutMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnCancelledMontage_Scriptable()
    {
        //Print("OnCancelledMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }


    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        FGameplayEventData Payload;
        GameplayAbilityActorInfo.AbilitySystemComponent.SendGameplayEvent(m_CurrentTeleportTag, Payload);
    }
}