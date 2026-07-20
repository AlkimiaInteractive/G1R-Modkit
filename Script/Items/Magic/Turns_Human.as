UCLASS()
class UTurnOnSpotConfig_Human_Magic : UTurnOnSpotConfig_Human
{
   default m_RotateMinThreshold = -20.f;
   default m_RotateMaxThreshold = 80.f;
}

UCLASS()
class UTurnsData_Default_Human_Magic : UTurnsData_Default_Human
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Human_Magic::StaticClass();
}