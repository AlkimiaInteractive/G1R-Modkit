UCLASS()
class UMadCorKalomTeleportSpotConfig : UGameplayTeleportSpotConfigBase
{    
    default m_DisappearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/MadCorKalom/A_MadCorKalom_Teleport_In_Montage.A_MadCorKalom_Teleport_In_Montage'";
    default m_AppearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Teleport/A_XardasSleeper_S1H_Fly_Teleport_Out_Montage.A_XardasSleeper_S1H_Fly_Teleport_Out_Montage'";
    
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_Disappear, m_DisappearMontage);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_Appear, m_AppearMontage);
}

