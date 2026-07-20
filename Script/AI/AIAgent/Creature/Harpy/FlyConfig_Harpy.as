class UFlyConfig_Harpy : UFlyConfig
{
    default m_PlayStartFlyingAnimation = true;
    default m_StartFlyingAnimationImpulse = 100;
    default m_MaximumHeight = 8000;
    default m_UseOnlyControllerYaw = true;
    default m_CanStrafe = true;
    default m_LimitHeightFlying = true;
    default m_LandHeight = 150.f;
}

class UFlyConfig_Harpy_Player : UFlyConfig
{
    default m_PlayStartFlyingAnimation = true;
    default m_StartFlyingAnimationImpulse = 400;
    default m_MaximumHeight = 8000;
    default m_UseOnlyControllerYaw = true;
    default m_CanStrafe = false;
    default m_LimitHeightFlying = true;
    default m_LandHeight = 100.f;
}