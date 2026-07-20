UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice01_1306 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice01_1306::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice01_1306_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_04);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE01");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE01");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice01_1306_Start : UDailyRoutine_SC_NOV_Novice01_1306_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_CAMPFIRE_03");
    default Schedule(8, 0, UAIState_Campfire(), n"FP_SC_CAMPFIRE_03");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_CAMPFIRE_03");
    default Schedule(13, 56, UAIState_Campfire(), n"FP_SC_CAMPFIRE_03");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_CAMPFIRE_03");
    default Schedule(22, 30, UAIState_Campfire(), n"FP_SC_CAMPFIRE_03");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice01_1306_AfterRitual : UDailyRoutine_SC_NOV_Novice01_1306_Ownership
{
    // default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_END_10");
    // default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_CAMPFIRE_03");
    default Schedule(8, 0, UAIState_Campfire(), n"FP_SC_CAMPFIRE_03");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_CAMPFIRE_03");
    default Schedule(13, 56, UAIState_Campfire(), n"FP_SC_CAMPFIRE_03");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_CAMPFIRE_03");
    default Schedule(22, 30, UAIState_Campfire(), n"FP_SC_CAMPFIRE_03");

}