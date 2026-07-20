class UDifficultyPreset_Hard : UDifficultyPresetBase
{
    default m_presetName = "ui_difficulty_hard";
    default m_presetDescription = "ui_difficulty_harddescription";
    default m_uiSortingPriority = 2.0f;

    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Combat) = UCombatDifficultySettings_Hard::StaticClass();
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Resources) = UResourcesDifficultySettings_Hard::StaticClass();
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Progression) = UProgressionDifficultySettings_Hard::StaticClass();
}