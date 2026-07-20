UCLASS()
class URagdollConfig_Golem_Stone : URagdollConfig_Golem
{
	default m_FollowBone = n"heartextra";
};

UCLASS()
class ULocomotionConfig_Golem_Stone: ULocomotionConfig_Golem
{
	default m_SpeedConfig = USpeedConfig_Golem_Stone_Brige::StaticClass();
	default m_RagdollConfig = URagdollConfig_Golem_Stone::StaticClass();
};