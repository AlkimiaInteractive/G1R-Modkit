UCLASS()
class UStartFireData_Human : UPicksData
{
    FStanceMapMontage StartFireUp;
    default StartFireUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/A_Man_LitTorch_Temp_Montage.A_Man_LitTorch_Temp_Montage'";
    default StartFireUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_STL_LightTorch_Montage.Man_STL_LightTorch_Montage'";
    
	FStanceMapMontage StartFireFront;
    default StartFireFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_LightTorch_Front_Montage.Man_LightTorch_Front_Montage'";
    default StartFireFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_STL_LightTorch_Front_Montage.Man_STL_LightTorch_Front_Montage'";
   
    FStanceMapMontage StartFireDown;
    default StartFireDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_LightTorch_Down_Montage.Man_LightTorch_Down_Montage'";
    default StartFireDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/Man_STL_LightTorch_Down_Montage.Man_STL_LightTorch_Down_Montage'";

	default m_MontagesMap.FindOrAdd(n"FireUp", StartFireUp);
    default m_MontagesMap.FindOrAdd(n"FireFront", StartFireFront);
    default m_MontagesMap.FindOrAdd(n"FireDown", StartFireDown);
}