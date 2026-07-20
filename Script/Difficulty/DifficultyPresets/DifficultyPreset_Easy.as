class UDifficultyPreset_Easy : UDifficultyPresetBase
{
    default m_presetName = "ui_difficulty_easy";
    default m_presetDescription = "ui_difficulty_easydescription";
    default m_uiSortingPriority = 0.0f;

    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Combat) = UCombatDifficultySettings_Easy::StaticClass();
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Resources) = UResourcesDifficultySettings_Easy::StaticClass();
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Progression) = UProgressionDifficultySettings_Easy::StaticClass();
}