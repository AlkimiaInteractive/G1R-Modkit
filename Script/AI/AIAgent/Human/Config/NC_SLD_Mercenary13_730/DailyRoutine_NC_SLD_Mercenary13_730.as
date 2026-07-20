UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary13_730 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary13_730::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary13_730_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY730");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY730");

    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_14",400);
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_06",300);
    default Schedule(12, 57, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_14",400);
    default Schedule(14, 2, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_06",300);
    default Schedule(20, 28, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_14",400);
    default Schedule(21, 29, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_06",300);
    default Schedule(22, 55, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}