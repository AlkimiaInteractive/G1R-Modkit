
UCLASS()
class UIoExampleFire: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = false;
	default m_StartActive = false;
	default m_StopWithRain = true;
	default m_AttenuatedWithRain = false;
	default m_HoursForUnLite = 0.0f;
	default m_StopWithSpell = false;
	default m_TimeRange = UTimeRange_All::StaticClass();
};

UCLASS()
class UTorch_Interior: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = false;
	default m_UsableByPlayer = false;
	default m_StartActive = true;
	default m_StopWithRain = false;
	default m_AttenuatedWithRain = false;
	default m_StopWithSpell = false;
	default m_HoursForUnLite = 0.0f;
	default m_TimeRange = UTimeRange_All::StaticClass();
};

UCLASS()
class UTorch_Exterior: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = false;
	default m_UsableByPlayer = false;
	default m_StartActive = true;
	default m_StopWithRain = false;
	default m_StopWithSpell = false;
	default m_AttenuatedWithRain = true;
	default m_HoursForUnLite = 0.0f;
	default m_TimeRange = UTimeRange_All::StaticClass();
};

UCLASS()
class UTorch_Breadcrumb_Interior: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = false;
	default m_UsableByPlayer = true;
	default m_StartActive = false;
	default m_StopWithRain = false;
	default m_AttenuatedWithRain = false;
	default m_StopWithSpell = true;
	default m_HoursForUnLite = 0.0f;
	default m_TimeRange = nullptr;
};

UCLASS()
class UTorch_Breadcrumb_Exterior: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = false;
	default m_UsableByPlayer = true;
	default m_StartActive = false;
	default m_StopWithRain = true;
	default m_AttenuatedWithRain = false;
	default m_StopWithSpell = true;
	default m_HoursForUnLite = 0.0f;
	default m_TimeRange = nullptr;
};

UCLASS()
class UTorch_NPC: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = true;
	default m_UsableByPlayer = true;
	default m_StartActive = false;
	default m_StopWithRain = false;
	default m_AttenuatedWithRain = true;
	default m_StopWithSpell = true;
	default m_HoursForUnLite = 0.0f;
	default m_TimeRange = UTimeRange_Night::StaticClass();
};

UCLASS()
class UTorch_WaterMagePuzzle: UGenericLitInteractiveSpot
{
	default m_AddNPCInteractionSpots = false;
	default m_UsableByPlayer = false;
	default m_StartActive = false;
	default m_StopWithRain = false;
	default m_AttenuatedWithRain = false;
	default m_StopWithSpell = false;
	default m_HoursForUnLite = 0.0f;
	default m_TimeRange = nullptr;
};
