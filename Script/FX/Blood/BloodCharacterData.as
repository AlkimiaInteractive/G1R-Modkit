UCLASS()
class UBloodCharacterColorConfig : UDataAsset
{
	UFUNCTION(BlueprintCallable, Category="Custom")
	void SetBloodCharacterData(TSubclassOf<AGothicCharacter> Character, FLinearColor Color)
	{
        AGothicCharacter CharacterReference = Cast<AGothicCharacter>(Character.Get());
        UGothicBloodComponent BloodComponent = UGothicBloodComponent::Get(CharacterReference);
		BloodComponent.SetBloodColor(Color);
	}

	UPROPERTY(EditAnywhere, BlueprintReadWrite, meta = (DisplayName = "Blood Data Lookup"))
	TMap<EBloodType, FBloodCharacterColorData> BloodDataLookup;

	UPROPERTY(EditAnywhere, BlueprintReadWrite, meta = (DisplayName = "Blood Characters Lookup"))
	TMap<EBloodType, FBloodCharacterColorContainer> BloodCharactersLookup;
}