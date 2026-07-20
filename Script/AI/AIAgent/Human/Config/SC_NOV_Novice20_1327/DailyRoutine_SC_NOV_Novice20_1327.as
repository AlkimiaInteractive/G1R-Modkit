UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice20_1327 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice20_1327::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice20_1327_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_29);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE20");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE20");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice20_1327_Start : UDailyRoutine_SC_NOV_Novice20_1327_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 30, UAIState_Eat(), n"FP_SC_EAT_03");
    default Schedule(7, 0, UAIState_Smoke(), n"FP_SC_STANDAROUND_04");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_EAT_03");
    default Schedule(13, 56, UAIState_Smoke(), n"FP_SC_STANDAROUND_04");
    default Schedule(17, 30, UAIState_Cook(), n"IO_SC_CAMP_CAULDRON_01");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_EAT_03");
    default Schedule(22, 30, UAIState_Smoke(), n"FP_SC_STANDAROUND_04");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice20_1327_Ritual : UDailyRoutine_SC_NOV_Novice20_1327_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_40");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}