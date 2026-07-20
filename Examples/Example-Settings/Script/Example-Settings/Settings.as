

UCLASS(Config=GameUserSettings)
class UGothicModExt_UserSettings_Example : UGothicModExt_UserSettings
{
	default CategoryName = FText::FromString("Example Settings");

	UPROPERTY(Config)
	FModUserSettingsBool ExampleBoolean = FModUserSettingsBool(
		Value = true,
		DefaultValue = false,
		DisplayText = FText::FromString("Example Boolean"));

	UPROPERTY(Config)
	FModUserSettingsInt ExampleInteger = FModUserSettingsInt(
		Value = 10,
		DefaultValue = 5,
		DisplayText = FText::FromString("Example Integer"),
		MinValue = 1,
		MaxValue = 50,
		Changeability = EModUserSettingsChangeability::MainMenu);

	UPROPERTY(Config)
	FModUserSettingsFloat ExampleFloat = FModUserSettingsFloat(
		Value = 1.0f,
		DefaultValue = 1.0f,
		DisplayText = FText::FromString("Example Float"),
		MinValue = 0.5f,
		MaxValue = 2.0f,
		StepSize = 0.1f);
}

/** Subsystem that reads out one of the config variables as example. */
class UExampleSubsystemThatReadsASettingVariable : UGothicModExt_WorldSubsystem
{
	UFUNCTION(BlueprintOverride)
	void HandleReadyForPlay()
	{
		if (!IsValid(AGothicPlayerState::MainPlayerState))
			return;
		
		int32 Value = UGothicModExt_UserSettings_Example.DefaultObject.ExampleInteger.Value;
		AGothicPlayerState::MainPlayerState.Inventory.AddItemOfClass(UItMi_Orenugget, Value);
	}
}