UCLASS()
class UAIAgentConfig_Human_OC_GRD_Scorpio_205 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Scorpio_205::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Scorpio_205_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SCORPIO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SCORPIO");
}

UCLASS()
class UDailyRoutine_OC_GRD_Scorpio_205_Start : UDailyRoutine_OC_GRD_Scorpio_205_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_06");
    default Schedule(7, 0, UAIState_Teach_Train(), n"FP_OC_GUARDPASSAGE_06");
    default Schedule(14, 00, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_06");
    default Schedule(15, 0, UAIState_Teach_Train(), n"FP_OC_GUARDPASSAGE_06");
    default Schedule(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_22");

    default ScheduleIfRaining(1, 0, UAIState_Sleep(), Location::Bed);
    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Guard(), n"FP_OC_SMALLTALK_06",500);
    default ScheduleIfRaining(7, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_47",500);
    default ScheduleIfRaining(14, 00, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_47",500);
    default ScheduleIfRaining(15, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_47",500);
    default ScheduleIfRaining(20, 0, UAIState_RainShelter_Guard(), n"FP_OC_SMALLTALK_06",500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Scorpio_205_InExtremoWait : UDailyRoutine_OC_GRD_Scorpio_205_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_06");
    default Schedule(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_22");

}

UCLASS()
class UDailyRoutine_OC_GRD_Scorpio_205_Bannished : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_UL_CHAIR_2");
    default KnownPlaces.Add(Location::Home, n"IO_UL_CHAIR_2");

    default Schedule(8, 0, UAIState_CutWood_Trunk(), n"IO_CUTTINWOOD_CAVALORN",300);
    default Schedule(11, 10, UAIState_Eat_Seated(), n"IO_UL_CHAIRBENCH_01");
    default Schedule(12, 45, UAIState_Smoke(), n"FP_CAVALORN_SCORPIO_BANNISHED");
    default Schedule(18, 0, UAIState_CutWood_Trunk(), n"IO_CUTTINWOOD_CAVALORN");
    default Schedule(21, 0, UAIState_Campfire(), n"FP_CAVALORN_SCORPIO_BANNISHED");
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;


    default ScheduleIfRaining(9, 0, UAIState_CarveWood(), n"IO_UL_CHAIR_2",500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Scorpio_205_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_CutWood_Trunk(), n"IO_CUTTINWOOD_CAVALORN",300);
    default Schedule(11, 10, UAIState_Eat_Seated(), n"IO_UL_CHAIRBENCH_01");
    default Schedule(12, 45, UAIState_Smoke(), n"FP_CAVALORN_SCORPIO_BANNISHED");
    default Schedule(18, 0, UAIState_CutWood_Trunk(), n"IO_CUTTINWOOD_CAVALORN");
    default Schedule(21, 0, UAIState_Campfire(), n"FP_CAVALORN_SCORPIO_BANNISHED");
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;


    default ScheduleIfRaining(9, 0, UAIState_CarveWood(), n"IO_UL_CHAIR_2",500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}


