class UProgressionDifficultySettings_Standard : UScriptProgressionDifficultySettings
{
    default m_settingsName = "ui_difficulty_standard";
    default m_uiSortingPriority = 1.0f;
    
    private const float32 m_FallDamageMultiplier = 1.0f;

    float32 GetFallDamageMultiplier() const override { return m_FallDamageMultiplier; }
}