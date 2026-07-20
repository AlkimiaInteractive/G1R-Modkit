UCLASS()
class UAIAgentConfig_Human_OC_GRD_Jackal_201 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Jackal_201::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Jackal_201_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_JACKAL");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_JACKAL");
}

UCLASS()
class UDailyRoutine_OC_GRD_Jackal_201_Start : UDailyRoutine_OC_GRD_Jackal_201_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Jackal);

    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(8, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_63",200);
    default Schedule(12, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_26",200);
    default Schedule(16, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_25",200);
    default Schedule(21, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(23, 46, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(8, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_16",200);
    default ScheduleIfRaining(12, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_14",200);
    default ScheduleIfRaining(16, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_07",200);
    default ScheduleIfRaining(21, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(23, 46, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Jackal_201_Fmtaken : UDailyRoutine_OC_GRD_Jackal_201_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Jackal);

    default Schedule(3, 0, UAIState_Guard(), n"FP_FM_GUARD_44");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OC_GRD_Jackal_201_Fmtaken2 : UDailyRoutine_OC_GRD_Jackal_201_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Jackal);
    
    default Schedule(3, 0, UAIState_Guard(), n"FP_FM_GUARD_44");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

