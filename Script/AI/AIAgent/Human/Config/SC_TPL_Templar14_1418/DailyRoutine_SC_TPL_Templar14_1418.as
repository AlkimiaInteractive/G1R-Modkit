UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar14_1418 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar14_1418::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar14_1418_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_12);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR14");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR14");

    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}