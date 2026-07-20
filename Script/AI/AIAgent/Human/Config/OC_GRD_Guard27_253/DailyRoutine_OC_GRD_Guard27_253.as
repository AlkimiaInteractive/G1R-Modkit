UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard27_253 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard27_253::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard27_253_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD253");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD253");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard27_253_Start : UDailyRoutine_OC_GRD_Guard27_253_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_30",300);
    default Schedule(13, 00, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(14, 45, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_30",300);
    default Schedule(22, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_183",500);
    default ScheduleIfRaining(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(14, 45, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_183",500);
    default ScheduleIfRaining(22, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard27_253_Fmtaken : UDailyRoutine_OC_GRD_Guard27_253_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_32");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OC_GRD_Guard27_253_Fmtaken2 : UDailyRoutine_OC_GRD_Guard27_253_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_32");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

