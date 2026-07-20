class UMeleeCharacterTargetConfig : UCharacterTargetConfig_AS
{
    default m_DetectionRadiusAI = 1000.f;
    default m_DetectionRadiusPlayer = 2000.f;

    default m_TargetCheckVisibilityRate = 0.25f;
    default m_TargetLostTimeout = 3.0f;

	default m_ShouldFindTargetOnVisualLost = true;
	default m_ShouldFindTargetOnTargetDefeated = true;
	default m_ShouldFindTargetOnTargetDie = true;
	default m_ShouldFindTargetOnTargetCantBeTargeted = true;
    default m_ShouldAimToTargetHeadOrChest = true;
    default m_ShouldFilterTargetByRelationship = true;
}