class UGA_Summon_XardasSleeper : UGA_Creature_PlayMontage_Base
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

    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/FreeSkeletons/A_XardasSleeper_S1H_Fly_FreeSkeletons_Montage.A_XardasSleeper_S1H_Fly_FreeSkeletons_Montage'";//n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/PH/PH_XardasSleeper_Summon_ArmyOfDarkness_Cast_Montage.PH_XardasSleeper_Summon_ArmyOfDarkness_Cast_Montage'";
    UPROPERTY()
    bool m_Done = false;

    UPROPERTY()
    FGameplayTag m_CurrentTeleportTag;
    UPROPERTY()
    AMinionSpot_XardasSleeper m_CurrentTeleportSpot;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_CurrentTeleportSpot = Cast<AMinionSpot_XardasSleeper>(TriggerEventData.Target);
    }

    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        DoSummon();
    }

    UFUNCTION(BlueprintOverride)
    void OnPlayMontageFailed_Scriptable()
    {
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        DoSummon();
        m_CurrentTeleportSpot.OnSummonCompleted();
    }

    void DoSummon()
    {
        if(!m_Done)
        {
            m_CurrentTeleportSpot.DoSummon();
            m_Done = true;
        }
    }
}