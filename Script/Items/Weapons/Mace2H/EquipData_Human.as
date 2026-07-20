UCLASS()
class UEquipData_Human_Mace2H : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"weapon_hold_back_up";

    //Pick and equip is only for the Torch
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_PickAndDraw_Montage.A_Man_T1H_PickAndDraw_Montage'"));
}

UCLASS()
class UEquipData_Human_Mace2H_Untrained : UEquipData_Human_Mace2H
{
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Draw/Untrained/A_Man_M2H_Un_DrawBack_Montage.A_Man_M2H_Un_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Draw/Untrained/A_Man_M2H_Un_ShelveBack_Montage.A_Man_M2H_Un_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Untrained/A_Man_T1H_Swap_Back_M2H_Un_Montage.A_Man_T1H_Swap_Back_M2H_Un_Montage'"));
}

UCLASS()
class UEquipData_Human_Mace2H_Trained : UEquipData_Human_Mace2H
{
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Draw/Trained/A_Man_M2H_Tr_DrawBack_Montage.A_Man_M2H_Tr_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Draw/Trained/A_Man_M2H_Tr_ShelveBack_Montage.A_Man_M2H_Tr_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Trained/A_Man_T1H_Swap_Back_M2H_Tr_Montage.A_Man_T1H_Swap_Back_M2H_Tr_Montage'"));
}

UCLASS()
class UEquipData_Human_Mace2H_Master : UEquipData_Human_Mace2H
{
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Draw/Master/A_Man_M2H_Ma_DrawBack_Montage.A_Man_M2H_Ma_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Draw/Master/A_Man_M2H_Ma_ShelveBack_Montage.A_Man_M2H_Ma_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Master/A_Man_T1H_Swap_Back_M2H_Ma_Montage.A_Man_T1H_Swap_Back_M2H_Ma_Montage'"));
}