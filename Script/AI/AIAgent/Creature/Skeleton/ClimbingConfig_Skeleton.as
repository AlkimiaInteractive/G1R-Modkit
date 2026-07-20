UCLASS()
class UClimbingAnimConfig_Skeleton_JumpGap: UClimbingAnimConfig
{
	FClimbingMontages JumpGap;
	default JumpGap.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Movement/InAir/JumpGap/Skeleton_JumpGap_Montage.Skeleton_JumpGap_Montage'";
	
	default AddMontage(JumpGap);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::JumpGap;
};

UCLASS()
class UClimbingConfig_Skeleton : UClimbingConfig_Human
{
	default AddClimbingAction(EClimbType::JumpGap, UClimbingAnimConfig_Skeleton_JumpGap::StaticClass());
};
