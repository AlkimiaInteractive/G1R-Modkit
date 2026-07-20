UCLASS()
class UEquipData_Human_Sword1H : UEquipData
{
    ////Pick and equip is only for the Torch
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_PickAndDraw_Montage.A_Man_T1H_PickAndDraw_Montage'"));

    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Waist) = n"sword_holder_02Socket";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"weapon_hold_back_up";
}

UCLASS()
class UEquipData_Human_Sword1H_Untrained : UEquipData_Human_Sword1H
{
    //DRAWS
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Untrained/A_Man_S1H_Un_Draw_Montage.A_Man_S1H_Un_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Untrained/A_Man_S1H_Un_Shelve_Montage.A_Man_S1H_Un_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Untrained/A_Man_T1H_Swap_S1H_Un_Montage.A_Man_T1H_Swap_S1H_Un_Montage'"));

    //DRAWS BACK
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Untrained/A_Man_S1H_Un_DrawBack_Montage.A_Man_S1H_Un_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Untrained/A_Man_S1H_Un_ShelveBack_Montage.A_Man_S1H_Un_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Untrained/A_Man_T1H_Swap_Back_S1H_Un_Montage.A_Man_T1H_Swap_Back_S1H_Un_Montage'"));
}

UCLASS()
class UEquipData_Human_Sword1H_Trained : UEquipData_Human_Sword1H
{
    //Draws
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Trained/A_Man_S1H_Tr_Draw_Montage.A_Man_S1H_Tr_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Trained/A_Man_S1H_Tr_Shelve_Montage.A_Man_S1H_Tr_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Trained/A_Man_T1H_Swap_S1H_Tr_Montage.A_Man_T1H_Swap_S1H_Tr_Montage'"));

    //DRAWS BACK
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Trained/A_Man_S1H_Tr_DrawBack_Montage.A_Man_S1H_Tr_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Trained/A_Man_S1H_Tr_ShelveBack_Montage.A_Man_S1H_Tr_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Trained/A_Man_T1H_Swap_Back_S1H_Tr_Montage.A_Man_T1H_Swap_Back_S1H_Tr_Montage'"));
}

UCLASS()
class UEquipData_Human_Sword1H_Master : UEquipData_Human_Sword1H
{
    //DRAWS
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing,EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_Draw_Montage.A_Man_S1H_Ma_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing,EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_Shelve_Montage.A_Man_S1H_Ma_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing,EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Master/A_Man_T1H_Swap_S1H_Ma_Montage.A_Man_T1H_Swap_S1H_Ma_Montage'"));

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_DrawBack_Montage.A_Man_S1H_Ma_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_ShelveBack_Montage.A_Man_S1H_Ma_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Master/A_Man_T1H_Swap_Back_S1H_Ma_Montage.A_Man_T1H_Swap_Back_S1H_Ma_Montage'"));
}

UCLASS()
class UEquipData_Human_Sword1H_TestMagnet : UEquipData_Human_Sword1H
{
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test/Magnet/S1H_Attacks/MagnetTest_S1H_Ma_Draw_Montage.MagnetTest_S1H_Ma_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_Shelve_Montage.A_Man_S1H_Ma_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test/Magnet/S1H_Attacks/MagnetTest_T1H_Swap_S1H_Ma_Montage.MagnetTest_T1H_Swap_S1H_Ma_Montage'"));
}

UCLASS()
class UEquipData_Human_Sword1H_KnockBackTest : UEquipData_Human_Sword1H
{
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_Draw_Montage.A_Man_S1H_Ma_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_Shelve_Montage.A_Man_S1H_Ma_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Master/A_Man_T1H_Swap_S1H_Ma_Montage.A_Man_T1H_Swap_S1H_Ma_Montage'"));

    //DRAWS BACK
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_DrawBack_Montage.A_Man_S1H_Ma_DrawBack_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Draw/Master/A_Man_S1H_Ma_ShelveBack_Montage.A_Man_S1H_Ma_ShelveBack_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Master/A_Man_T1H_Swap_Back_S1H_Ma_Montage.A_Man_T1H_Swap_Back_S1H_Ma_Montage'"));

}