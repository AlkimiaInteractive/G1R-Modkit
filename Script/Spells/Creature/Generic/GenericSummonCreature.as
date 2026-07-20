UCLASS()
class UGenericSummonCreature : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

   
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FAISpawnData m_CharacterToSpawn;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_MaxSpawnCount;

	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	TSubclassOf<UGameplayEffect> m_SummonedEffect;
}
