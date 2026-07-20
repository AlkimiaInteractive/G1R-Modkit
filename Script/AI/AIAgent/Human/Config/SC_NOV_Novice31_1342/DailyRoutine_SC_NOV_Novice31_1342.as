UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice31_1342 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice31_1342::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice31_1342_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_22);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE31");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE31");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice31_1342_Start : UDailyRoutine_SC_NOV_Novice31_1342_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_EAT_02");
    default Schedule(7, 30, UAIState_Listen(), n"FP_SC_MEDITATE_13");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_MEDITATE_13");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_MEDITATE_13");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_MEDITATE_13");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_MEDITATE_13");
    default Schedule(23, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice31_1342_Ritual : UDailyRoutine_SC_NOV_Novice31_1342_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_14");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}