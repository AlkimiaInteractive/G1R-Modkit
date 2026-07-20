UCLASS()
class UMud_Sleeper_TeleportSpotConfig : UScriptedTeleportSpotConfig
{    
    default m_DisappearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/Mud_574_Sleeper/A_Mud_574_Sleeper_Teleport_In_Montage.A_Mud_574_Sleeper_Teleport_In_Montage'";
    default m_AppearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/Mud_574_Sleeper/A_Mud_574_Sleeper_Teleport_Out_Montage.A_Mud_574_Sleeper_Teleport_Out_Montage'";
    
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_Disappear, m_DisappearMontage);
    default m_MontageMap.Add(GameplayTag::Ability_Action_Teleport_Appear, m_AppearMontage);
}

