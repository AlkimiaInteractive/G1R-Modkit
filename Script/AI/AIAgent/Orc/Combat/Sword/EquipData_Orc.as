UCLASS()
class UEquipData_Orc_Melee : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"weapon_hold_back_up";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Waist) = n"sword_holder_01Socket";



    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,   n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Draw/A_OrcM_S1H_DrawBack_Montage.A_OrcM_S1H_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,   n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Draw/A_OrcM_S1H_ShelveBack_Montage.A_OrcM_S1H_ShelveBack_Montage'"));
   
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,   n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Draw/A_OrcM_S1H_Draw_Montage.A_OrcM_S1H_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,   n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Draw/A_OrcM_S1H_Shelve_Montage.A_OrcM_S1H_Shelve_Montage'"));
   
}