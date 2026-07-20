UENUM()
enum EBloodColorType
{
	Unknown,
	Red,
	Blue,
	Purple,
	Yellow,
	Black,
	None,
	Light,
	Green
}

USTRUCT()
struct FBloodCharacterColorData
{
	UPROPERTY(BlueprintReadOnly, meta = (DisplayName = "Color"))
	FLinearColor Color;
}

USTRUCT()
struct FBloodCharacterColorContainer
{
	UPROPERTY(EditAnywhere, BlueprintReadOnly, meta = (DisplayName = "Characters Lookup"))
	TArray<TSubclassOf<AGothicCharacter>> Characters;
}