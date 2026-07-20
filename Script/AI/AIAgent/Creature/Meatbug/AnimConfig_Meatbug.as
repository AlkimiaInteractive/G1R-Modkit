
UCLASS()
class UItemAnimConfig_Meatbug : UItemAnimConfig
{
	// HITS
	default m_HitsData = UHitData_Default_Meatbug::StaticClass();
	//
}

UCLASS()
class UAnimConfig_Meatbug : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();

	default SetDefaultMovementAnimData(UItemAnimConfig_Meatbug::StaticClass());
}
