// This class holds modifiers 
class UProgressionDifficultySettings_Easy : UScriptProgressionDifficultySettings
{

    default m_settingsName = "ui_difficulty_easy";
    default m_uiSortingPriority = 0.0f;
    
    default m_ExperienceMultiplier = 0.8f;
    private const float32 m_FallDamageMultiplierEasy = 0.5f;

    // Additional skills for the player in easy progression difficulty.
    private const TArray<TSubclassOf<UGE_Skill_Generic>> m_easyModeSkills;
    default m_easyModeSkills.Add(UGE_Skill_Melee_OneHanded_Trained);

    float32 GetFallDamageMultiplier() const override{ return m_FallDamageMultiplierEasy; }
    TArray<TSubclassOf<UGE_Skill_Generic>> GetDifficultyLessons() const override{ return m_easyModeSkills; }
}