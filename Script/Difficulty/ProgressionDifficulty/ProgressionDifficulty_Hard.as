class UProgressionDifficultySettings_Hard : UScriptProgressionDifficultySettings
{
    default m_settingsName = "ui_difficulty_hard";
    default m_uiSortingPriority = 2.0f;

    default m_ExperienceMultiplier = 1.2f;
    private const float32 m_FallDamageMultiplierHard = 1.2f;

    float32 GetFallDamageMultiplier() const override{ return m_FallDamageMultiplierHard; }
}