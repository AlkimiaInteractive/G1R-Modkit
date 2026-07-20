UCLASS()
class UEquipData_Human_Fists : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::None)= n"sword_holder_02Socket";

    //Pick and equip is only for the Torch
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_PickAndDraw_Montage.A_Man_T1H_PickAndDraw_Montage'"));
}

UCLASS()
class UEquipData_Human_Fists_Untrained : UEquipData_Human_Fists
{
    default m_EquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Draw/Untrained/A_Man_Fists_Un_Draw_Montage.A_Man_Fists_Un_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Draw/Untrained/A_Man_Fists_Un_Shelve_Montage.A_Man_Fists_Un_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Untrained/A_Man_T1H_Swap_Fists_Un_Montage.A_Man_T1H_Swap_Fists_Un_Montage'"));
}

UCLASS()
class UEquipData_Human_Fists_Trained : UEquipData_Human_Fists
{
    default m_EquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Draw/Trained/A_Man_Fists_Tr_Draw_Montage.A_Man_Fists_Tr_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Draw/Trained/A_Man_Fists_Tr_Shelve_Montage.A_Man_Fists_Tr_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Trained/A_Man_T1H_Swap_Fists_Tr_Montage.A_Man_T1H_Swap_Fists_Tr_Montage'"));
}

UCLASS()
class UEquipData_Human_Fists_Master : UEquipData_Human_Fists
{
    default m_EquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Draw/Master/A_Man_Fists_Ma_Draw_Montage.A_Man_Fists_Ma_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Draw/Master/A_Man_Fists_Ma_Shelve_Montage.A_Man_Fists_Ma_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage( n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Master/A_Man_T1H_Swap_Fists_Ma_Montage.A_Man_T1H_Swap_Fists_Ma_Montage'"));
}