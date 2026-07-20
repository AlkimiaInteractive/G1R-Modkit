UCLASS()
class UPicksData_Human : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_N_PickUp_Up_L_Montage.A_Man_N_PickUp_Up_L_Montage'";
    default PickUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_STL_PickUp_Up_L_Montage.A_Man_STL_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_N_PickUp_Front_L_Montage.A_Man_N_PickUp_Front_L_Montage'";
    default PickFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_STL_PickUp_Front_L_Montage.A_Man_STL_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_N_PickUp_Down_L_Montage.A_Man_N_PickUp_Down_L_Montage'";
    default PickDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_STL_PickUp_Down_L_Montage.A_Man_STL_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}