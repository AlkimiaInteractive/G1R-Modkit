UCLASS()
class UAIAgentConfig_Human_OC_VLK_Kyle_536 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Kyle_536::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Kyle_536_Ownership : UDailyRoutine_Digger
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_KYLE");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_KYLE");
}

UCLASS()
class UDailyRoutine_OC_VLK_Kyle_536_Start : UDailyRoutine_OC_VLK_Kyle_536_Ownership
{
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_43",500.0f);
    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_60",500.0f);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_43",500.0f);
    default Schedule(14, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_60",500.0f);
    default Schedule(19, 0, UAIState_Drink(), n"IO_OC_CHAIR_43",500.0f);
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_60",500.0f);
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}