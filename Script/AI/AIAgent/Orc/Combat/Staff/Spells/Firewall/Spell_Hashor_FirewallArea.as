UCLASS()
class UHashorFirewallAreaRingSpellConfig : UFirewallAreaBaseSpellConfig
{
	default m_LifeSpan = 15.f;

	default m_ExtraAreaIncrement = 650.f;

	// //Min distance to the border of the circle (from the center of the area) where the detection will work for arm spawn- P.E: 500.f -> 5 meters or less close to the border.
	// UPROPERTY(EditAnywhere)
	// float m_MinDistanceToBorder = 150.f;

	default m_EnableDebugLines = true;

	default m_AreaRadius = 800.f;

}