UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice41_1353 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice41_1353::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice41_1353_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_28);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE41");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE41");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice41_1353_Start : UDailyRoutine_SC_NOV_Novice41_1353_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_CAMPFIRE_02");
    default Schedule(7, 30, UAIState_Listen(), n"FP_SC_MEDITATE_16");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_MEDITATE_16");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_MEDITATE_16");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_MEDITATE_16");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_MEDITATE_16");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}