UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice04_1309 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice04_1309::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice04_1309_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE04");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE04");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice04_1309_Start : UDailyRoutine_SC_NOV_Novice04_1309_Ownership
{
    default Schedule(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 25, UAIState_Eat(), n"FP_SC_HERBALCHEMY_01");
    default Schedule(7, 5, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_03", 200);
    default Schedule(10, 0, UAIState_Cook(), n"IO_SC_CAMP_CAULDRON_02");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_HERBALCHEMY_01");
    default Schedule(13, 56, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_03", 200);
    default Schedule(18, 0, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_30");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_HERBALCHEMY_01");
    default Schedule(22, 30, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_03", 200);
    default Schedule(23, 30, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_30");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice04_1309_Ritual : UDailyRoutine_SC_NOV_Novice04_1309_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_END_1");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice04_1309_AfterRitual : UDailyRoutine_SC_NOV_Novice04_1309_Ownership
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_END_1");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}