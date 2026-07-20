UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary18_736 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary18_736::StaticClass();
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary18_736_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_33);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Exterior_Huts_17);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY736");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY736");
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary18_736_Start : UDailyRoutine_NC_SLD_Mercenary18_736_Ownership
{
    default Schedule(7, 10, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_19");
    default Schedule(9, 35, UAIState_PracticeMace_1H(), n"IO_NC_DUMMY_01");
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_SIT_02");
    default Schedule(13, 56, UAIState_PracticeMace_1H(), n"IO_NC_DUMMY_01");
    default Schedule(20, 30, UAIState_Eat(), n"FP_NC_SIT_02");
    default Schedule(21, 30, UAIState_PracticeMace_1H(), n"IO_NC_DUMMY_01");
    default Schedule(22, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 10, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_19");
    default ScheduleIfRaining(22, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary18_736_Fmtaken : UDailyRoutine_NC_SLD_Mercenary18_736_Ownership
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_NC_GATE_GUARD");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary18_736_Follow : UDailyRoutine_NC_SLD_Mercenary18_736_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowCharacter(n"NC_SLD_Cord_709",150,400), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary18_736_Fmtaken2 : UDailyRoutine_NC_SLD_Mercenary18_736_Ownership
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_FM_GUARD_09");
}