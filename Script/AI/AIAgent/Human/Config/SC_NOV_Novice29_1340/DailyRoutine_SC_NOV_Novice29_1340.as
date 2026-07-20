UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice29_1340 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice29_1340::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice29_1340_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_25);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE29");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE29");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice29_1340_Start : UDailyRoutine_SC_NOV_Novice29_1340_Ownership
{
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_CHAIR_19", 300);
    default Schedule(8, 0, UAIState_Listen(), n"FP_SC_LISTEN_03");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_LISTEN_03");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_LISTEN_03");
    default Schedule(21, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_05");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_LISTEN_03");
}