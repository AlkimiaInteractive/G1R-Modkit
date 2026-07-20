UCLASS()
class UEndFireData_Human : UPicksData
{
    FStanceMapMontage EndFireUp;
    default EndFireUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/A_Man_UnLitTorch_Temp_Montage.A_Man_UnLitTorch_Temp_Montage'";
    default EndFireUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_STL_TurnOffTorch_Montage.Man_STL_TurnOffTorch_Montage'";
    
	FStanceMapMontage EndFireFront;
    default EndFireFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_TurnOffTorch_Front_Montage.Man_TurnOffTorch_Front_Montage'";
    default EndFireFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_STL_TurnOffTorch_Front_Montage.Man_STL_TurnOffTorch_Front_Montage'";
   
    FStanceMapMontage EndFireDown;
    default EndFireDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_TurnOffTorch_Down_Montage.Man_TurnOffTorch_Down_Montage'";
    default EndFireDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_STL_TurnOffTorch_Down_Montage.Man_STL_TurnOffTorch_Down_Montage'";

	default m_MontagesMap.FindOrAdd(n"FireUp", EndFireUp);
    default m_MontagesMap.FindOrAdd(n"FireFront", EndFireFront);
    default m_MontagesMap.FindOrAdd(n"FireDown", EndFireDown);
}