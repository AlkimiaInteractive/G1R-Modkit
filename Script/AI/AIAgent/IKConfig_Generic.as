UCLASS()
class UIKConfig_Biped_Generic : UBipedIKConfig
{
    default m_UpPelvisSpeed = 12.0f;
    default m_UpSpeed = 30.0f;
    default m_HeadSpeed = 1.0f;
    default m_DownSpeed = 15.0f;
    default m_UpTraceDistance = 30.0f;
    default m_DownTraceDistance = 50.0f;

    default m_MaxFootIKStandingTargetDistance = 15.5f;
    default m_MaxFootIKCrouchedTargetDistance = 20.f;
    
    default m_IKBoneL_Target = n"VB foot_target_l";
    default m_IKBoneR_Target = n"VB foot_target_r";
    default m_RightBoneName = n"ik_foot_r";
    default m_LeftBoneName = n"ik_foot_l";

    default m_DistanceLookAtPoint = 400.0f;
    default m_SwitchLookSolve = false;
    default m_SwitchLegSolve = false;
}

UCLASS()
class UIKConfig_Quadruped_Generic : UQuadrupedIKConfig
{
    default m_UpPelvisSpeed = 12.0f;
    default m_UpSpeed = 30.0f;
    default m_DownSpeed = 15.0f;
    default m_HeadSpeed = 1.0f;
    default m_UpTraceDistance = 30.0f;
    default m_DownTraceDistance = 50.0f;

    default m_BackRightBoneName = n"ik_foot_r";
    default m_BackLeftBoneName = n"ik_foot_l";
    default m_FrontRightBoneName = n"ik_foot_r_front";
    default m_FrontLeftBoneName = n"ik_foot_l_front";
    default m_SpineBoneReferenceName = n"spine_02";
    default m_NeckCorrector = 4.0f;
    default m_NeckMaxSlope = 50.0f;
    default m_MinNeckRotation = FRotator(0.0f,0.0f,-30.0f);
    default m_MaxNeckRotation = FRotator(0.0f,0.0f,30.0f);
    default m_HipNTailRayLength = 0.0f;
    default m_MaxYawRotation = 80.0f;
}

UCLASS()
class UIKConfig_Razor_Generic : UIKConfig_Quadruped_Generic
{
    default m_UpPelvisSpeed = 12.0f;
    default m_UpSpeed = 30.0f;
    default m_DownSpeed = 15.0f;
    default m_HeadSpeed = 1.0f;
    default m_UpTraceDistance = 30.0f;
    default m_DownTraceDistance = 50.0f;

    default m_BackRightBoneName = n"ik_foot_r";
    default m_BackLeftBoneName = n"ik_foot_l";
    default m_FrontRightBoneName = n"ik_hand_r";
    default m_FrontLeftBoneName = n"ik_hand_l";
    default m_SpineBoneReferenceName = n"spine_02";
    default m_NeckCorrector = 4.0f;
    default m_NeckMaxSlope = 50.0f;
    default m_MinNeckRotation = FRotator(0.0f,0.0f,-30.0f);
    default m_MaxNeckRotation = FRotator(0.0f,0.0f,30.0f);
    default m_HipNTailRayLength = 0.0f;
    default m_MaxYawRotation = 80.0f;
}

UCLASS()
class UIKConfig_Minecrawler_Generic : UMinecrawlerIKConfig
{
    default m_UpPelvisSpeed = 12.0f;
    default m_UpSpeed = 30.0f;
    default m_DownSpeed = 15.0f;
    default m_HeadSpeed = 1.0f;
    default m_UpTraceDistance = 60.0f;
    default m_DownTraceDistance = 100.0f;
    
    default m_BackRightBoneName = n"ik_foot_r";
    default m_BackLeftBoneName = n"ik_foot_l";
    default m_MidRightBoneName = n"ik_foot_r_middel";
    default m_MidLeftBoneName = n"ik_foot_l_middel";
    default m_FrontRightBoneName = n"ik_foot_r_front";
    default m_FrontLeftBoneName = n"ik_foot_l_front";
}
