UCLASS()
class UGenericSummonCreatureByHealth : UGenericSummonCreature
{

   	//We can spawn creature while the health is upper at x percentage
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnCreatureHealthPercentageUpper;

	//We can activate creature when the health is below at x percentage
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_ActivateCreatureHealthPercentageBelow;

}