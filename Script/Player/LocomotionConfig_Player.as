
UCLASS()
class UWaterConfig_Player: UWaterConfigBase
{
	default m_Buoyancy = 1.8;
	default m_RagdollUnderWaterHeight = 140;
	default m_IsWaterVelocityInfluencingWalkingSpeed = true;
	default m_WaterVelocityInfluencesWalkingSpeedMinWaterDepth = 65.0f;
	default m_WaterVelocityInfluencesWalkingSpeedMinWaterSpeed = 105.0f;

	default m_SurfaceWaterEffect = UGE_SurfaceWater_Player::StaticClass();
    default m_MidWaterEffect = UGE_MidWater_Player::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater_Player::StaticClass();
};

UCLASS()
class UJumpConfig_Player: UJumpConfig
{
	default m_JumpZVelocity = 620;
	default m_ShouldUseJumpPrediction = true;
};

UCLASS()
class ULandingConfig_Player: ULandingConfig
{
	default m_BrakingFrictionFactorStrong = 3;
	default m_BrakingFrictionFactorWeak = 0.5;
	default m_BrakingFrictionFactorResetTime = 0.5;
	
	default m_StopResetTimeWeak = 0.0f;
	default m_StopResetTimeStrong = 0.4f;
	default m_MaxFallingStrongStopHeight = 200;

	FLandingMontages LandingsUntrained;
	default LandingsUntrained.Montages.FindOrAdd(250.f) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/InAir/Jump/Land/HardLandings/A_Man_N_LandHeavyStep_Ma_Montage.A_Man_N_LandHeavyStep_Ma_Montage'";
	default LandingsUntrained.Montages.FindOrAdd(350.f) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/InAir/Jump/Land/HardLandings/A_Man_N_LandHeavyStep_Un_Montage.A_Man_N_LandHeavyStep_Un_Montage'";
	FLandingMontages LandingsTrained;
	default LandingsTrained.Montages.FindOrAdd(250.0f) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/InAir/Jump/Land/HardLandings/A_Man_N_LandHeavyStep_Ma_Montage.A_Man_N_LandHeavyStep_Ma_Montage'";
	default LandingsTrained.Montages.FindOrAdd(350.0f) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/InAir/Jump/Land/HardLandings/A_Man_N_LandHeavy_Roll_Montage.A_Man_N_LandHeavy_Roll_Montage'";
	
	default m_LandingMontages.FindOrAdd(GameplayTag::Skill_Acrobatics_Untrained, LandingsUntrained);
	default m_LandingMontages.FindOrAdd(GameplayTag::Skill_Acrobatics_Trained, LandingsTrained);
};

UCLASS()
class ULookConfig_Player: ULookConfig
{
 	default m_LookUpDownRate = 1.25;
	default m_LookRightLeftRate = 1.0;
	default m_LookRightLeftMaxRate = 2.0f;
	default m_LookRightLeftEase = EEasingFunc::EaseOut;
	default m_LookRightLeftTime = 1.6f;
};

UCLASS()
class URagdollConfig_Player: URagdollConfig
{
	default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
	default m_GetUpBackAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/GetUp/A_Man_N_GetUp_Back_Montage.A_Man_N_GetUp_Back_Montage'";
	default m_GetUpFrontAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/GetUp/A_Man_N_GetUp_Front_Montage.A_Man_N_GetUp_Front_Montage'";
	default m_GetUpPlayRate = 1;
	default m_RagdollStartBlendOutTime = 0.2;
	default m_StopBonesMovementOnStart = false;
	default m_FallingRagdollAbility = UGA_FallingRagdoll::StaticClass();
};

UCLASS()
class USwimConfig_Player : USwimConfig
{
	default m_WalkToSwimHeight = 135;
	default m_SwimToDiveHeight = 120;
	default m_DiveToSwimHeight = 160;
	default m_SwimToWalkHeight = 115;
	default m_CrouchableWaterHeight = 60;
	default m_CapsuleSwimmingHalfHeight = 40.0f;

	default m_WaterWalkingEffect 	= UGE_WalkingOnWater::StaticClass();
	default m_SwimmingEffect 		= UGE_Swimming::StaticClass();
	default m_DivingEffect 			= UGE_Diving::StaticClass();
};

UCLASS()
class UTransitionConfig_Player: UTransitionConfig
{
	default m_DynTransitionBlendTime = 0.2;
	default m_DynTransitionPlayRate = 1.5;
	default m_DynTransitionStartTime = 0.8;
	default m_DynTransitionReTriggerDelay = 0.1f;
};

UCLASS()
class UGroundConfig_Player: UGroundConfig_Human
{
	default m_UpdateRotationMinimumSpeed = 150;
	default m_TargetInterpSpeedInteractuablesRotation = 200;
	default m_TargetInterpSpeedVelocityDirection = 10;
	default m_TargetInterpSpeedLookingDirection = 50;
	default m_TargetInterpSpeedAiming = 50;
	default m_ActorInterpSpeedFallingAiming = 15;
	default m_ActorInterpFalling = 100;
	default m_GroundedRotationRate_Aiming = 600;
	default m_GroundedRotationRate_Roll = 200;
	default m_GroundedRotationRate_Dodge = 600;
	default m_VelocityBlendInterpSpeed = 12;
	default m_GroundedLeanInterpSpeed = 12;//4
	default m_SmoothedAimingRotationInterpSpeed = 100;
	default m_InputYawOffsetInterpSpeed = 1000.f;
	default m_MovementInputMinimumAmountToSprint = 0.9f;
	default m_MovementInputMaximumYawToSprint = 50;
	default m_UpdateGaitSpeedOffset = 10;
	default m_LimitMovementOnEdge = false;
	default m_MaxStepHeightNormal = 50;
	default m_MaxStepHeightStrafe = 50;
};

UCLASS()
class UAirConfig_Player: UAirConfig
{
	default m_InAirRotationSpeedLimit = 100;
	default m_MaxFallingSpeed = -8000;
	default m_MinFallingSpeed = -100;
};

UCLASS()
class UMMConfig_Player: UMMConfig
{
	FInputSet rangeSet;
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 1.2f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileGeneral.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 0.7f); // Walk
	default rangeSet.SpeedMultiplier = 1.3f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.5f;
	default m_ProfileGeneral.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.7f, 1.2f); //Run
	default rangeSet.SpeedMultiplier = 1.1f;
	default rangeSet.MoveResponseMultiplier = 10.0f;//1.0f 2.5 or 3.5
	default rangeSet.TurnResponseMultiplier = 10.0f;//1.0f 2.0
	default m_ProfileGeneral.InputSets.Add(rangeSet);

	// Sprint
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 1.1f;
	default rangeSet.MoveResponseMultiplier = 10.0f; //0.15f
	default rangeSet.TurnResponseMultiplier = 10.0f; //0.15f
	default m_ProfileSprint.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 1.2f);
	default rangeSet.SpeedMultiplier = 1.1f;
	default rangeSet.MoveResponseMultiplier = 10.0f; //0.3f
	default rangeSet.TurnResponseMultiplier = 10.0f; //0.5f
	default m_ProfileSprint.InputSets.Add(rangeSet);

	// Strafe
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 1.0f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStrafe.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 0.7f); // Walk
	default rangeSet.SpeedMultiplier = 1.00f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStrafe.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.7f, 1.2f); //Run
	default rangeSet.SpeedMultiplier = 1.0f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStrafe.InputSets.Add(rangeSet);
    
	// Stealth
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 0.5f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStealthGeneral.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 0.7f); // Walk
	default rangeSet.SpeedMultiplier = 2.0f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStealthGeneral.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.7f, 1.2f); //Run
	default rangeSet.SpeedMultiplier = 1.1f;
	default rangeSet.MoveResponseMultiplier = 10.0f;//1.0f 2.5 or 3.5
	default rangeSet.TurnResponseMultiplier = 10.0f;//1.0f 2.0
	default m_ProfileStealthGeneral.InputSets.Add(rangeSet);

	//Stealth Strafe
	default rangeSet.InputRemapRange = FVector2D(0.0f, 0.1f);
	default rangeSet.SpeedMultiplier = 0.0f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStealthStrafe.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.1f, 0.7f); // Walk
	default rangeSet.SpeedMultiplier = 1.6f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStealthStrafe.InputSets.Add(rangeSet);

	default rangeSet.InputRemapRange = FVector2D(0.7f, 1.2f); //Run
	default rangeSet.SpeedMultiplier = 1.0f;
	default rangeSet.MoveResponseMultiplier = 10.0f;
	default rangeSet.TurnResponseMultiplier = 10.0f;
	default m_ProfileStealthStrafe.InputSets.Add(rangeSet);

	//default m_CamVelMultiplier = 0.0;
};

class UFlyConfig_Player : UFlyConfig
{
	// note: used for debug flying

	// scaling trace distance of GroundLocation detection: needed for NPCs to follow player while debug flying
    default m_MaximumHeight = 5000; 
}

UCLASS()
class ULocomotionConfig_Player: ULocomotionConfig
{
	default m_ClimbingConfig = UClimbingConfig_Player::StaticClass();
	default m_SpeedConfig = USpeedConfig_Player::StaticClass();
	default m_GroundConfig = UGroundConfig_Player::StaticClass();
	default m_LandingConfig = ULandingConfig_Player::StaticClass();
	default m_AirConfig = UAirConfig_Player::StaticClass();
	default m_LookConfig = ULookConfig_Player::StaticClass();
	default m_TransitionConfig = UTransitionConfig_Player::StaticClass();
	default m_SwimConfig = USwimConfig_Player::StaticClass();
	default m_JumpConfig = UJumpConfig_Player::StaticClass();
	default m_WaterConfig = UWaterConfig_Player::StaticClass();
	default m_RagdollConfig = URagdollConfig_Player::StaticClass();
	default m_CurveConfig = ULocomotionCurveConfig_Player_MM::StaticClass();
	default m_MMConfig = UMMConfig_Player::StaticClass();
	default m_FlyConfig = UFlyConfig_Player::StaticClass();
	default m_CollisionProfileName = n"Gothic_Player";
};