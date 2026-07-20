UCLASS()
class UPicksData_Human_M1H_Un_Left : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Picks/Untrained/A_Man_S1H_Un_PickUp_Up_L_Montage.A_Man_S1H_Un_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Picks/Untrained/A_Man_S1H_Un_PickUp_Front_L_Montage.A_Man_S1H_Un_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Picks/Untrained/A_Man_S1H_Un_PickUp_Down_L_Montage.A_Man_S1H_Un_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}

UCLASS()
class UPicksData_Human_M1H_Tr_Left : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Picks/Trained/A_Man_M1H_Tr_PickUp_Up_L_Montage.A_Man_M1H_Tr_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Picks/Trained/A_Man_M1H_Tr_PickUp_Front_L_Montage.A_Man_M1H_Tr_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Picks/Trained/A_Man_M1H_Tr_PickUp_Down_L_Montage.A_Man_M1H_Tr_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}

UCLASS()
class UPicksData_Human_M1H_Ma_Left : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Picks/Master/A_Man_M1H_Ma_PickUp_Up_L_Montage.A_Man_M1H_Ma_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Picks/Master/A_Man_M1H_Ma_PickUp_Front_L_Montage.A_Man_M1H_Ma_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Picks/Master/A_Man_M1H_Ma_PickUp_Down_L_Montage.A_Man_M1H_Ma_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}