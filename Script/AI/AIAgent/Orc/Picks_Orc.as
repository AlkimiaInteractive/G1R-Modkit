UCLASS()
class UPicksData_Orc : UPicksData
{
    FStanceMapMontage PickUp;
    default PickUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Picks/A_OrcM_PickUp_Up_L_Montage.A_OrcM_PickUp_Up_L_Montage'";
    
	FStanceMapMontage PickFront;
    default PickFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Picks/A_OrcM_PickUp_Front_L_Montage.A_OrcM_PickUp_Front_L_Montage'";
   
    FStanceMapMontage PickDown;
    default PickDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Picks/A_OrcM_PickUp_Down_L_Montage.A_OrcM_PickUp_Down_L_Montage'";

	default m_MontagesMap.FindOrAdd(n"PickUp", PickUp);
    default m_MontagesMap.FindOrAdd(n"PickFront", PickFront);
    default m_MontagesMap.FindOrAdd(n"PickDown", PickDown);
}