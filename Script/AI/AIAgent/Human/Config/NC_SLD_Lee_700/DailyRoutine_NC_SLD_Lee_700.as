UCLASS()
class UAIAgentConfig_Human_NC_SLD_Lee_700 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Lee_700::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Lee_700_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Lee);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_LEE");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_LEE");
}

UCLASS()
class UDailyRoutine_NC_SLD_Lee_700_Start : UDailyRoutine_NC_SLD_Lee_700_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_44");
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_23");
    default Schedule(19, 0, UAIState_ReadBook_Seated(), n"IO_NC_CHAIR_BENCH_44");
    default Schedule(22, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_44");
    default Schedule(22, 30, UAIState_ReadBook_Seated(), n"IO_NC_CHAIR_BENCH_44");
}


UCLASS()
class UDailyRoutine_NC_SLD_Lee_700_Damnpast : UDailyRoutine_NC_SLD_Lee_700_Ownership
{
    default Schedule(0, 0, UAIState_Drink(), n"FP_NC_GUARD_11");
}

UCLASS()
class UDailyRoutine_NC_SLD_Lee_700_Ncreport : UDailyRoutine_NC_SLD_Lee_700_Ownership
{
    default Schedule(23, 0, UAIState_Smalltalk(), n"FP_NC_CAVE_CENTER");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}



