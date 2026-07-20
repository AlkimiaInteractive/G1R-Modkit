class UDifficultyPreset_Standard : UDifficultyPresetBase
{
    default m_presetName = "ui_difficulty_standard";
    default m_presetDescription = "ui_difficulty_standarddescription";
    default m_uiSortingPriority = 1.0f;

    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Combat) = UCombatDifficultySettings_Standard::StaticClass();
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Resources) = UResourcesDifficultySettings_Standard::StaticClass();
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Progression) = UProgressionDifficultySettings_Standard::StaticClass();
}