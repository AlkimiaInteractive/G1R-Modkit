UCLASS()
class UEquipData_Orc_Staff : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"weapon_hold_back_up_2";

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Draw/A_OrcM_Sff1H_Draw_Montage.A_OrcM_Sff1H_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Draw/A_OrcM_Sff1H_Shelve_Montage.A_OrcM_Sff1H_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Orc_Staff_Projectile : UEquipData
{
    default m_SocketName = n"weapon_l";
}