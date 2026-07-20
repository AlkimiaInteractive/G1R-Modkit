UCLASS()
class UPicksData_Human_Bow_Right : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Pick/A_Man_Bow_N_PickUp_Up_R_Montage.A_Man_Bow_N_PickUp_Up_R_Montage'";
    default PickUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Pick/A_Man_Bow_STL_PickUp_Up_R_Montage.A_Man_Bow_STL_PickUp_Up_R_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Pick/A_Man_Bow_N_PickUp_Front_R_Montage.A_Man_Bow_N_PickUp_Front_R_Montage'";
    default PickFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Pick/A_Man_Bow_STL_PickUp_Front_R_Montage.A_Man_Bow_STL_PickUp_Front_R_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Pick/A_Man_Bow_N_PickUp_Down_R_Montage.A_Man_Bow_N_PickUp_Down_R_Montage'";
    default PickDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Pick/A_Man_Bow_STL_PickUp_Down_R_Montage.A_Man_Bow_STL_PickUp_Down_R_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}

UCLASS()
class UPicksData_Human_Crossbow_Right : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Pick/A_Man_Crossbow_N_PickUp_Up_L_Montage.A_Man_Crossbow_N_PickUp_Up_L_Montage'";
    default PickUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Pick/A_Man_Crossbow_STL_PickUp_Up_L_Montage.A_Man_Crossbow_STL_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Pick/A_Man_Crossbow_N_PickUp_Front_L_Montage.A_Man_Crossbow_N_PickUp_Front_L_Montage'";
    default PickFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Pick/A_Man_Crossbow_STL_PickUp_Front_L_Montage.A_Man_Crossbow_STL_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Pick/A_Man_Crossbow_N_PickUp_Down_L_Montage.A_Man_Crossbow_N_PickUp_Down_L_Montage'";
    default PickDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Pick/A_Man_Crossbow_STL_PickUp_Down_L_Montage.A_Man_Crossbow_STL_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}