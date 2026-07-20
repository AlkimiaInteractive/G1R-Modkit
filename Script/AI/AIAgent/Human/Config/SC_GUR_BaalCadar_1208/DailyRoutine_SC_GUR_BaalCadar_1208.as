UCLASS()
class UAIAgentConfig_Human_SC_GUR_BaalCadar_1208: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_BaalCadar_1208::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_GUR_BaalCadar_1208_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_BaalCadar);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_BAALCADAR");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_BAALCADAR");

    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Preach(), n"FP_SC_PREACHING_02");
    default Schedule(12, 56, UAIState_Smoke(), n"FP_SC_SMOKE_05", 300);
    default Schedule(13, 56, UAIState_Preach(), n"FP_SC_PREACHING_02");
    default Schedule(21, 30, UAIState_Smoke(), n"FP_SC_SMOKE_05", 300);
    default Schedule(22, 30, UAIState_Preach(), n"FP_SC_PREACHING_02");
}

