UCLASS()
class UHellArmsAreaRingSpellConfig : UDemonAreaBaseSpellConfig
{
	default m_LifeSpan = 15.f;

	UPROPERTY(EditAnywhere)
	float m_RingExtraAreaIncrement = 150.f;

	//Min distance to the border of the circle (from the center of the area) where the detection will work for arm spawn- P.E: 500.f -> 5 meters or less close to the border.
	UPROPERTY(EditAnywhere)
	float m_MinDistanceToBorder = 150.f;

	//Size of the angle where the arms are spawned on the circle border
	UPROPERTY(EditAnywhere)
	float m_BorderAngle = 25.f;

	UPROPERTY(EditAnywhere)
	int m_MaxArmsToSpawn = 35;

	default m_AreaRadius = 600.f;

	default m_MinAttackTime = 0.2f;

    default m_MaxAttackTime = 1.f;

	default m_EnableDebugLines = true;

}