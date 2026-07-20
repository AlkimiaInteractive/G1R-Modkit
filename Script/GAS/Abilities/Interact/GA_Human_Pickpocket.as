class UGA_Human_Pickpocket : UGameplayAbilityPickpocket
{
    default m_DetectionRadius = 500.0f;
    default m_DetectionAngleDegrees = 90.0f;

    // Sight settings.
    default m_Sight.m_Modifier = 25.0f;
    default m_Sight.m_MinTimeSeconds = 1.0f;
    default m_Sight.m_AwarenessThreshold = 50.0f;
}