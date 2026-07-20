UCLASS()
class URagdollConfig_Harpy: URagdollConfig
{
    default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
    // default m_GetUpBackAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Back_Montage_2H_NLH.ALS_CLF_GetUp_Back_Montage_2H_NLH'";
    // default m_GetUpFrontAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Front_Montage_2H_NLH.ALS_CLF_GetUp_Front_Montage_2H_NLH'";
    default m_GetUpPlayRate = 1;
    default m_RagdollStartBlendOutTime = 0.2;
    default m_StopBonesMovementOnStart = false;
    default m_WaterResistance = 0.05f;
    default m_BuySimStrength = 1.0f;
};

UCLASS()
class UJumpConfig_Harpy: UJumpConfig
{
	default m_FallGravityScale = 0.0f;

};

UCLASS()
class ULocomotionConfig_Harpy: ULocomotionConfig_Creature_Harpy
{
	default m_SpeedConfig = USpeedConfig_Harpy::StaticClass();
    default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_FlyConfig = UFlyConfig_Harpy::StaticClass();
    default m_LookConfig = ULookConfig_Creature::StaticClass();
    default m_RagdollConfig = URagdollConfig_Harpy::StaticClass();
	//default m_JumpConfig = UJumpConfig_Harpy::StaticClass();
};

UCLASS()
class ULocomotionConfig_Harpy_Player: ULocomotionConfig_Harpy
{
	default m_SpeedConfig = USpeedConfig_Harpy_Player::StaticClass();
    default m_CurveConfig = ULocomotionCurveConfig_Harpy_Player::StaticClass();
    default m_FlyConfig = UFlyConfig_Harpy_Player::StaticClass();
};
