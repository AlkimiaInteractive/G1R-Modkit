UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar05_1409 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar05_1409::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar05_1409_Start : UAIState_DailyRoutine_Human
{
        default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_24);

    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR05_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR05_CM");

    default Schedule(7, 10, UAIState_Eat(), n"IO_SC_BENCH_6");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_26",500.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 10, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_03");
    default ScheduleIfRaining(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_26",500.0f);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}