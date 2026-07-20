
UCLASS()
class UWaterConfig_ShadowBeast: UWaterConfig_Creature
{
	default m_Buoyancy = 1.25;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_ShadowBeast: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 225;
	default m_DiveToSwimHeight = 275;
	default m_WalkToSwimHeight = 150;
	default m_SwimToWalkHeight = 160;
	default m_CrouchableWaterHeight = 78;
	default m_CapsuleSwimmingHalfHeight = 20;
};

UCLASS()
class UJumpConfig_ShadowBeast : UJumpConfig
{
	default m_JumpZVelocity = 450;
	default m_JumpGravityScale = 2.0f;
	default m_FallGravityScale = 3.0f;
};

UCLASS()
class URagdollConfig_ShadowBeast : URagdollConfig
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
class ULocomotionConfig_ShadowBeast: ULocomotionConfig_Creature_Quadruped
{
	default m_SpeedConfig = USpeedConfig_ShadowBeast::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_ShadowBeast::StaticClass();
	default m_WaterConfig = UWaterConfig_ShadowBeast::StaticClass();
	default m_SwimConfig = USwimConfig_ShadowBeast::StaticClass();
    default m_RagdollConfig = URagdollConfig_ShadowBeast::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_ShadowBeast::StaticClass();

};

UCLASS()
class ULocomotionConfig_ShadowBeast_Player: ULocomotionConfig_ShadowBeast
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};
