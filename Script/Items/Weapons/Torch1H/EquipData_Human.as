UCLASS()
class UEquipData_Human_Torch1H : UEquipData
{
    
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Waist) = n"sword_holder_02Socket";

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_Draw_Montage.A_Man_T1H_Draw_Montage'"));
    default m_EquipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_STL_Draw_Montage.A_Man_T1H_STL_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_Shelve_Montage.A_Man_T1H_Shelve_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_Shelve_Montage.A_Man_T1H_Shelve_Montage'"));
    
    //Torch specific draws
    default m_DropMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_Drop_Montage.A_Man_T1H_Drop_Montage'"));
    default m_DropMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_STL_Drop_Montage.A_Man_T1H_STL_Drop_Montage'"));
    default m_DropMontagesBack.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_Drop_Back_Montage.A_Man_T1H_Drop_Back_Montage'"));
   
    //Standing
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"PickDown", EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/PickAndEquip/A_Man_T1H_N_PickAndEquip_Down_R_Montage.A_Man_T1H_N_PickAndEquip_Down_R_Montage'"));
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"PickFront", EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/PickAndEquip/A_Man_T1H_N_PickAndEquip_Front_R_Montage.A_Man_T1H_N_PickAndEquip_Front_R_Montage'"));
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"PickUp", EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/PickAndEquip/A_Man_T1H_N_PickAndEquip_Up_R_Montage.A_Man_T1H_N_PickAndEquip_Up_R_Montage'"));

    //Crouching
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"PickDown",  EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/PickAndEquip/A_Man_T1H_STL_PickAndEquip_Down_R_Montage.A_Man_T1H_STL_PickAndEquip_Down_R_Montage'"));
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"PickFront",  EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/PickAndEquip/A_Man_T1H_STL_PickAndEquip_Front_R_Montage.A_Man_T1H_STL_PickAndEquip_Front_R_Montage'"));
    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"PickUp",  EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/PickAndEquip/A_Man_T1H_STL_PickAndEquip_Up_R_Montage.A_Man_T1H_STL_PickAndEquip_Up_R_Montage'"));
    
    //Torch shouldn't use this one, but kept it here for safety
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Trained/A_Man_T1H_Swap_S1H_Tr_Montage.A_Man_T1H_Swap_S1H_Tr_Montage'"));

}

UCLASS()
class UEquipData_Human_Torch1H_NonCombat : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Waist) = n"sword_holder_02Socket";

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Man_T1H_Draw_IdlePose_Montage.Man_T1H_Draw_IdlePose_Montage'"));
    default m_EquipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Man_T1H_Draw_IdlePose_Montage.Man_T1H_Draw_IdlePose_Montage'"));
    
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Man_T1H_Shelve_IdlePose_Montage.Man_T1H_Shelve_IdlePose_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Man_T1H_Shelve_IdlePose_Montage.Man_T1H_Shelve_IdlePose_Montage'"));

    default m_DropMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Man_T1H_Drop_IdlePose_Montage.Man_T1H_Drop_IdlePose_Montage'"));
    default m_DropMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Man_T1H_Drop_IdlePose_Montage.Man_T1H_Drop_IdlePose_Montage'"));
    default m_DropMontagesBack.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/A_Man_T1H_Drop_Back_Montage.A_Man_T1H_Drop_Back_Montage'"));
}