class USpellCharacterTargetConfig : UCharacterTargetConfig_AS
{
    default m_DetectionRadiusAI = 1000.f;
    default m_DetectionRadiusPlayer = 2000.f;

    default m_TargetCheckVisibilityRate = 0.25f;
    default m_TargetLostTimeout = 3.0f;

	default m_ShouldFindTargetOnVisualLost = false;
	default m_ShouldFindTargetOnTargetDefeated = false;
	default m_ShouldFindTargetOnTargetDie = false;
	default m_ShouldFindTargetOnTargetCantBeTargeted = true;
    default m_ShouldAimToTargetHeadOrChest = true;
    default m_ShouldFilterTargetByRelationship = true;
}