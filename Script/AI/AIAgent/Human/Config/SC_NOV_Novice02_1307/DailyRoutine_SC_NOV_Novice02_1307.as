UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice02_1307 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice02_1307::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice02_1307_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE02");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE02");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice02_1307_Start : UDailyRoutine_SC_NOV_Novice02_1307_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_CAMPFIRE_04");
    default Schedule(8, 0, UAIState_Campfire(), n"FP_SC_CAMPFIRE_04");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_CAMPFIRE_04");
    default Schedule(13, 56, UAIState_Campfire(), n"FP_SC_CAMPFIRE_04");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_CAMPFIRE_04");
    default Schedule(22, 30, UAIState_Campfire(), n"FP_SC_CAMPFIRE_04");
}