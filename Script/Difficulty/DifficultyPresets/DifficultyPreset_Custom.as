class UDifficultyPreset_Custom : UDifficultyPresetBase
{
    default m_presetName = "ui_difficulty_custom";
    default m_presetDescription = "ui_difficulty_customdescription";
    default m_uiSortingPriority = 3.0f;

    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Combat) = nullptr;
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Resources) = nullptr;
    default m_presetDifficultySettings.FindOrAdd(EDifficultyGroup::Progression) = nullptr;
}