class UTelekinesisItemVisualWorldTargetConfig : UItemVisualWorldTargetConfig_AS
{
    default m_DetectionRadiusAI = 1500.f;
    default m_DetectionRadiusPlayer = 1500.f;

    default m_TargetCheckVisibilityRate = 0.25f;
    default m_TargetLostTimeout = 1.0f;

	default m_ShouldFindTargetOnVisualLost = false;
	default m_ShouldFindTargetOnTargetDefeated = false;
	default m_ShouldFindTargetOnTargetDie = false;
	default m_ShouldFindTargetOnTargetCantBeTargeted = true;
}