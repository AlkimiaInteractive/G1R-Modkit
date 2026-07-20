
UCLASS()
class UWaterConfig_Human: UWaterConfigBase
{
	default m_Buoyancy = 1.55;
	default m_RagdollUnderWaterHeight = 140;

	default m_SurfaceWaterEffect = UGE_SurfaceWater_Human::StaticClass();
    default m_MidWaterEffect = UGE_MidWater_Human::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater_Human::StaticClass();
};

UCLASS()
class UJumpConfig_Human: UJumpConfig
{
	default m_JumpZVelocity = 620;
};

UCLASS()
class ULandingConfig_Human: ULandingConfig
{
	default m_BrakingFrictionFactorStrong = 3;
	default m_BrakingFrictionFactorWeak = 0.5;
	default m_BrakingFrictionFactorResetTime = 0.5;
	
	FLandingMontages LandingsUntrained;
	default LandingsUntrained.Montages.FindOrAdd(150.f) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/InAir/Jump/Land/HardLandings/A_Man_N_LandHeavyStep_Ma_Montage.A_Man_N_LandHeavyStep_Ma_Montage'";
	FLandingMontages LandingsTrained;
	default LandingsTrained.Montages.FindOrAdd(150.0f) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/InAir/Jump/Land/HardLandings/A_Man_N_LandHeavyStep_Ma_Montage.A_Man_N_LandHeavyStep_Ma_Montage'";
	
	default m_LandingMontages.FindOrAdd(GameplayTag::Skill_Acrobatics_Untrained, LandingsUntrained);
	default m_LandingMontages.FindOrAdd(GameplayTag::Skill_Acrobatics_Trained, LandingsTrained);
};

UCLASS()
class ULookConfig_Human: ULookConfig
{
	default m_LookUpDownRate = 1.25;
	default m_LookRightLeftRate = 1.25;
};

UCLASS()
class URagdollConfig_Human: URagdollConfig
{
	default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
	default m_GetUpBackAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Back_Montage_2H_NLH.ALS_CLF_GetUp_Back_Montage_2H_NLH'";
	default m_GetUpFrontAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Front_Montage_2H_NLH.ALS_CLF_GetUp_Front_Montage_2H_NLH'";
	default m_GetUpPlayRate = 1;
	default m_RagdollStartBlendOutTime = 0.2;
	default m_StopBonesMovementOnStart = false;
	
	default m_FallingRagdollAbility = UGA_FallingRagdoll::StaticClass();
};

UCLASS()
class USwimConfig_Human: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 200;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 140;
	default m_SwimToWalkHeight = 100;
};

UCLASS()
class UTransitionConfig_Human: UTransitionConfig
{
	default m_DynTransitionBlendTime = 0.2;
	default m_DynTransitionPlayRate = 1.5;
	default m_DynTransitionStartTime = 0.8;
	default m_DynTransitionReTriggerDelay = 0.1f;
};

UCLASS()
class UGroundConfig_Human: UGroundConfig
{
	default m_UpdateRotationMinimumSpeed = 150;
	default m_TargetInterpSpeedInteractuablesRotation = 50;
	default m_TargetInterpSpeedVelocityDirection = 10;
	default m_TargetInterpSpeedLookingDirection = 50;
	default m_TargetInterpSpeedAiming = 50;
	default m_ActorInterpSpeedFallingAiming = 15;
	default m_ActorInterpFalling = 100;
	default m_GroundedRotationRate_Aiming = 300;
	default m_GroundedRotationRate_Roll = 300;
	default m_GroundedRotationRate_Dodge = 300;
	default m_VelocityBlendInterpSpeed = 12;
	default m_GroundedLeanInterpSpeed = 4;
	default m_SmoothedAimingRotationInterpSpeed = 100;
	default m_InputYawOffsetInterpSpeed = 8.f;
	default m_MovementInputMinimumAmountToSprint = 0.9f;
	default m_MovementInputMaximumYawToSprint = 50;
	default m_UpdateGaitSpeedOffset = 10;
	default m_MaxStepHeightNormal = 50;
	default m_MaxStepHeightStrafe = 50;
	default m_CrouchCapsuleHeight = 70;
	default m_EnterSlopeDegrees = 25.f;
	default m_ExitSlopeDegrees = 20.f;
};

UCLASS()
class UAirConfig_Human: UAirConfig
{
	default m_InAirRotationSpeedLimit = 100;
	default m_MaxFallingSpeed = -4000;
	default m_MinFallingSpeed = -200;
};

UCLASS()
class UMMConfig_Human: UMMConfig
{
	FInputSet rangeSet;
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 0.0f;
	default rangeSet.MoveResponseMultiplier = 1.0f;
	default rangeSet.TurnResponseMultiplier = 1.0f;
	default m_ProfileGeneral.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 0.7f);
	default rangeSet.SpeedMultiplier = 0.35f;
	default rangeSet.MoveResponseMultiplier = 0.8f;
	default rangeSet.TurnResponseMultiplier = 0.8f;
	default m_ProfileGeneral.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.7f, 1.2f);
	default rangeSet.SpeedMultiplier = 1.0f;
	default rangeSet.MoveResponseMultiplier = 1.0f;
	default rangeSet.TurnResponseMultiplier = 1.0f;
	default m_ProfileGeneral.InputSets.Add(rangeSet);

	// Sprint
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 0.0f;
	default rangeSet.MoveResponseMultiplier = 0.75f;
	default rangeSet.TurnResponseMultiplier = 0.75f;
	default m_ProfileSprint.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 1.0f);
	default rangeSet.SpeedMultiplier = 1.0f;
	default rangeSet.MoveResponseMultiplier = 0.3f;
	default rangeSet.TurnResponseMultiplier = 0.5f;
	default m_ProfileSprint.InputSets.Add(rangeSet);
};

UCLASS()
class ULocomotionConfig_AIHuman: ULocomotionConfig
{
	default m_ClimbingConfig = UClimbingConfig_Human::StaticClass();
	default m_SpeedConfig = USpeedConfig_Human::StaticClass();
	default m_GroundConfig = UGroundConfig_Human::StaticClass();
	default m_LandingConfig = ULandingConfig_Human::StaticClass();
	default m_AirConfig = UAirConfig_Human::StaticClass();
	default m_LookConfig = ULookConfig_Human::StaticClass();
	default m_TransitionConfig = UTransitionConfig_Human::StaticClass();
	default m_SwimConfig = USwimConfig_Human::StaticClass();
	default m_JumpConfig = UJumpConfig_Human::StaticClass();
	default m_WaterConfig = UWaterConfig_Human::StaticClass();
	default m_RagdollConfig = URagdollConfig_Human::StaticClass();
	default m_CurveConfig = ULocomotionCurveConfig_Biped::StaticClass();
	default m_MMConfig = UMMConfig_Player::StaticClass();
};
