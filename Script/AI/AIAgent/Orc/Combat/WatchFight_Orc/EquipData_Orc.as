UCLASS()
class UEquipData_Orc_WatchFight : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::None) = n"weapon_r";
    
    default m_EquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Draw/A_OrcM_Fists_Draw_Montage.A_OrcM_Fists_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Draw/A_OrcM_Fists_Shelve_Montage.A_OrcM_Fists_Shelve_Montage'"));
}