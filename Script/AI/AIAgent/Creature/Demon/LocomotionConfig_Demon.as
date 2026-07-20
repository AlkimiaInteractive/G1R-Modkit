
UCLASS()
class URagdollConfig_Demon: URagdollConfig
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
class ULocomotionConfig_Demon: ULocomotionConfig_Creature_Flying
{
	default m_SpeedConfig = USpeedConfig_Demon::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_RagdollConfig = URagdollConfig_Demon::StaticClass();
    default m_GroundConfig = UGroundConfig_Creature::StaticClass();
    default m_FlyConfig = UFlyConfig_Demon::StaticClass();
};
