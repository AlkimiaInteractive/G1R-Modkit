UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice23_1334 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice23_1334::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice23_1334_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_WeedHarvesters_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE23");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE23");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice23_1334_Start : UDailyRoutine_SC_NOV_Novice23_1334_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 30, UAIState_Eat(), n"IO_SC_BENCH_41");
    default Schedule(7, 0, UAIState_PickRice(), n"FP_SC_PICKRICE_05");
    default Schedule(12, 56, UAIState_Rest(), n"FP_SC_PICKRICE_06");
    default Schedule(13, 56, UAIState_PickRice(), n"FP_SC_PICKRICE_05");
    default Schedule(21, 30, UAIState_SitAround(), n"IO_SC_BENCH_41");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(6, 30, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_05");
    default ScheduleIfRaining(7, 0, UAIState_PickRice(), n"FP_SC_PICKRICE_05");
    default ScheduleIfRaining(12, 56, UAIState_Rest(), n"FP_SC_PICKRICE_06");
    default ScheduleIfRaining(13, 56, UAIState_PickRice(), n"FP_SC_PICKRICE_05");
    default ScheduleIfRaining(21, 30, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_05");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice23_1334_Ritual : UDailyRoutine_SC_NOV_Novice23_1334_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_11");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice23_1334_AfterRitual : UDailyRoutine_SC_NOV_Novice23_1334_Ownership
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_11");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}