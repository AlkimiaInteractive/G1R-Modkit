UCLASS()
class UScriptedTeleportSpotConfig : UGameplayTeleportSpotConfigBase
{    
    default m_DisappearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/Xardas_404/A_Xardas_404_Teleport_In_Montage.A_Xardas_404_Teleport_In_Montage'";
    default m_AppearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/Xardas_404/A_Xardas_404_Teleport_Out_Montage.A_Xardas_404_Teleport_Out_Montage'";
    
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_Disappear, m_DisappearMontage);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_Appear, m_AppearMontage);
}

