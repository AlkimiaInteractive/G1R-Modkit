UCLASS()
class UDifficultyManager : UDifficultyManagerSubsystem
{    
    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        // Difficulty presets initialization, modded ones will be added here too.
        AddDifficultyPreset(UDifficultyPreset_Easy::StaticClass());
        AddDifficultyPreset(UDifficultyPreset_Standard::StaticClass());
        AddDifficultyPreset(UDifficultyPreset_Hard::StaticClass());
        AddDifficultyPreset(UDifficultyPreset_Custom::StaticClass());

        AddGroupDifficultySettings(UCombatDifficultySettings_Easy::StaticClass(), EDifficultyGroup::Combat);
        AddGroupDifficultySettings(UCombatDifficultySettings_Standard::StaticClass(), EDifficultyGroup::Combat);
        AddGroupDifficultySettings(UCombatDifficultySettings_Hard::StaticClass(), EDifficultyGroup::Combat);        

        AddGroupDifficultySettings(UResourcesDifficultySettings_Easy::StaticClass(), EDifficultyGroup::Resources);
        AddGroupDifficultySettings(UResourcesDifficultySettings_Standard::StaticClass(), EDifficultyGroup::Resources);
        AddGroupDifficultySettings(UResourcesDifficultySettings_Hard::StaticClass(), EDifficultyGroup::Resources);

        AddGroupDifficultySettings(UProgressionDifficultySettings_Easy::StaticClass(), EDifficultyGroup::Progression);
        AddGroupDifficultySettings(UProgressionDifficultySettings_Standard::StaticClass(), EDifficultyGroup::Progression);
        AddGroupDifficultySettings(UProgressionDifficultySettings_Hard::StaticClass(), EDifficultyGroup::Progression);
        
        SetCurrentPreset(UDifficultyPreset_Standard::StaticClass());
    }
}