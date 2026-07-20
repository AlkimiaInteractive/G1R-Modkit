
UCLASS()
class URagdollConfig_Bloodfly: URagdollConfig
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
class UGroundConfig_Bloodfly : UGroundConfig_Creature
{
	default m_UpdateRotationMinimumSpeed = 150;
	default m_TargetInterpSpeedVelocityDirection = 10;
	default m_ActorInterpFalling = 100;
	default m_GroundedLeanInterpSpeed = 4;
	default m_SmoothedAimingRotationInterpSpeed = 10;
	default m_InputYawOffsetInterpSpeed = 8;
};

UCLASS()
class ULocomotionConfig_Bloodfly_Player: ULocomotionConfig_Creature_Flying
{
	default m_SpeedConfig = USpeedConfig_Bloodfly::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
    default m_RagdollConfig = URagdollConfig_Bloodfly::StaticClass();
    default m_FlyConfig = UFlyConfig_Bloodfly_Player::StaticClass();
    default m_GroundConfig = UGroundConfig_Bloodfly::StaticClass();
};

UCLASS()
class ULocomotionConfig_Bloodfly: ULocomotionConfig_Creature_Flying
{
	default m_SpeedConfig = USpeedConfig_Bloodfly::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
    default m_RagdollConfig = URagdollConfig_Bloodfly::StaticClass();
    default m_FlyConfig = UFlyConfig_Bloodfly::StaticClass();
    default m_GroundConfig = UGroundConfig_Bloodfly::StaticClass();
};
