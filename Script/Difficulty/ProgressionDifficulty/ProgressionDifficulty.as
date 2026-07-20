UCLASS()
class UScriptProgressionDifficultySettings : UProgressionDifficultySettings
{
    // Set of default return statements that could be used in case there's no overrided method in a subclass.
    // Some of these variables could be enough in some standard cases.
    int32 m_defaultIntValue = 1;
    float32 m_defaultFloatValue = 1.0f;
    FString m_defaultFStringValue = FString("");

    // Default return statements
    int32 GetDefaultIntValue() const{ return m_defaultIntValue; }
    float32 GetDefaultFloatValue() const { return m_defaultFloatValue; }
    FString GetDefaultFStringValue() const { return m_defaultFStringValue; }
    //

    // Fall damage
    float32 GetFallDamageMultiplier() const { return GetDefaultFloatValue(); }

    // Lessons
    TArray<TSubclassOf<UGE_Skill_Generic>> GetDifficultyLessons() const { return TArray<TSubclassOf<UGE_Skill_Generic>>(); }

}