UCLASS()
class UAIAgentConfig_Human_NC_SLD_Cord_709 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Cord_709::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Cord_709_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Cord);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_CORD_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_CORD_CM");
}

UCLASS()
class UDailyRoutine_NC_SLD_Cord_709_Start : UDailyRoutine_NC_SLD_Cord_709_Ownership 
{
    default Schedule(6, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_17", 300);
    default Schedule(9, 30, UAIState_Teach_Train(), n"FP_NC_GUARD_33",20);
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_GUARD_30",20);
    default Schedule(13, 56, UAIState_Teach_Train(), n"FP_NC_GUARD_33",20);
    default Schedule(20, 30, UAIState_Eat(), n"FP_NC_GUARD_30",20);
    default Schedule(21, 30, UAIState_Teach_Train(), n"FP_NC_GUARD_33",20);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_17");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_SLD_Cord_709_Fmtaken : UDailyRoutine_NC_SLD_Cord_709_Ownership 
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_NC_GATE_GUARD3");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Cord_709_Follow : UDailyRoutine_NC_SLD_Cord_709_Ownership 
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowCharacter(n"NC_SLD_Gorn_699",150,400), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_NC_SLD_Cord_709_Fmtaken2 : UDailyRoutine_NC_SLD_Cord_709_Ownership 
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_FM_GUARD_01");
}