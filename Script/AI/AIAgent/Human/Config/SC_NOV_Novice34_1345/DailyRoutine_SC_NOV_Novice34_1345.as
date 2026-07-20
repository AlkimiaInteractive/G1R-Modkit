UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice34_1345 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice34_1345::StaticClass();

}


UCLASS()
class UDailyRoutine_SC_NOV_Novice34_1345_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_16);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE34");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE34");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice34_1345_Start : UDailyRoutine_SC_NOV_Novice34_1345_Ownership
{
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_CHAIR_12", 300);
    default Schedule(8, 0, UAIState_Listen(), n"FP_SC_LISTEN_01");
    default Schedule(12, 56, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_05");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_LISTEN_01");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_LISTEN_01");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_LISTEN_01");
}