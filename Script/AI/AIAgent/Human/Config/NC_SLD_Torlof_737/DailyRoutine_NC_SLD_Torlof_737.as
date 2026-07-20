UCLASS()
class UAIAgentConfig_Human_NC_SLD_Torlof_737 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Torlof_737::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Torlof_737_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Torlof);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_TORLOF_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_TORLOF_CM");
}

UCLASS()
class UDailyRoutine_NC_SLD_Torlof_737_Start : UDailyRoutine_NC_SLD_Torlof_737_Ownership
{
    default Schedule(1, 0, UAIState_Eat(), n"FP_NC_CAMPFIRE_12",500);
    default Schedule(1, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 45, UAIState_Eat(), n"FP_NC_CAMPFIRE_12",500);
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_07");
    default Schedule(12, 57, UAIState_Guard(), n"FP_NC_GUARD_43",500);
    default Schedule(14, 1, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_07");
    default Schedule(20, 28, UAIState_Guard(), n"FP_NC_GUARD_43",500);
    default Schedule(21, 29, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_07");
    default Schedule(23, 0, UAIState_Guard(), n"FP_NC_GUARD_43",500);

}

UCLASS()
class UDailyRoutine_NC_SLD_Torlof_737_Wait : UDailyRoutine_NC_SLD_Torlof_737_Ownership
{
    default Schedule(23, 0, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_21",200);
}

UCLASS()
class UDailyRoutine_NC_SLD_Torlof_737_Collapse : UDailyRoutine_NC_SLD_Torlof_737_Ownership
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_26",400);
}

UCLASS()
class UDailyRoutine_NC_SLD_Torlof_737_FMReport : UDailyRoutine_NC_SLD_Torlof_737_Ownership
{
    default Schedule(7, 0, UAIState_StandAround(), n"NC_STAND_TORLOF_STORY",200);
}

