UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar06_1410 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar06_1410::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar06_1410_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_28);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR06");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR06");

    default Schedule(6, 0, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_04",500.0f);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_13",500.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}