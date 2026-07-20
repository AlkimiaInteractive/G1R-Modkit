UCLASS()
class UPicksData_Orc_Sff1H : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Picks/A_OrcM_Sff1H_PickUp_Up_L_Montage.A_OrcM_Sff1H_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Picks/A_OrcM_Sff1H_PickUp_Front_L_Montage.A_OrcM_Sff1H_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Picks/A_OrcM_Sff1H_PickUp_Down_L_Montage.A_OrcM_Sff1H_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}