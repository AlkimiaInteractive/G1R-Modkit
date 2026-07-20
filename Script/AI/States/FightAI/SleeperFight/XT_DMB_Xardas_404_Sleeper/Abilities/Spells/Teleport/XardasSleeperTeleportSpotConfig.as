UCLASS()
class UXardasSleeperTeleportSpotConfigBase : UGameplayTeleportSpotConfigBase
{    
    
}

UCLASS()
class UXardasSleeperTeleportCentralSpotConfig : UXardasSleeperTeleportSpotConfigBase
{    
    default m_DisappearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Teleport/A_XardasSleeper_S1H_Fly_Teleport_In_Montage.A_XardasSleeper_S1H_Fly_Teleport_In_Montage'"; //n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Teleport/A_XardasSleeper_S1H_Teleport_In_Montage.A_XardasSleeper_S1H_Teleport_In_Montage'";
    default m_AppearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeper_S1H_Stunned_In_Montage.A_XardasSleeper_S1H_Stunned_In_Montage'";
    
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear, m_DisappearMontage);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_XardasSleeper_Appear, m_AppearMontage);
}

UCLASS()
class UXardasSleeperTeleportMinionSpotConfig : UXardasSleeperTeleportSpotConfigBase
{    
    default m_DisappearMontage =  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Teleport/A_XardasSleeper_S1H_Fly_Teleport_In_Montage.A_XardasSleeper_S1H_Fly_Teleport_In_Montage'";//n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Teleport/A_XardasSleeper_S1H_Teleport_In_Montage.A_XardasSleeper_S1H_Teleport_In_Montage'";
    default m_AppearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Teleport/A_XardasSleeper_S1H_Fly_Teleport_Out_Montage.A_XardasSleeper_S1H_Fly_Teleport_Out_Montage'";//n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Teleport/A_XardasSleeper_S1H_Teleport_Out_Montage.A_XardasSleeper_S1H_Teleport_Out_Montage'";
    UPROPERTY()
	TSoftObjectPtr<UAnimMontage> m_DisppearMontageFromStunned = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeper_S1H_Stunned_Out_Montage.A_XardasSleeper_S1H_Stunned_Out_Montage'";
    UPROPERTY()
	TSoftObjectPtr<UAnimMontage> m_DisppearMontageInitial = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Teleport/A_XardasSleeper_S1H_Teleport_In_Montage.A_XardasSleeper_S1H_Teleport_In_Montage'";

    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear, m_DisappearMontage);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_XardasSleeper_Appear, m_AppearMontage);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear_FromStunned, m_DisppearMontageFromStunned);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear_Initial, m_DisppearMontageInitial);
}