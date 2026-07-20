UCLASS()
class UAIAgentConfig_Human_OM_SC_TPL_Templar05_1438 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_SC_TPL_Templar05_1438::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_SC_TPL_Templar05_1438_Start : UAIState_DailyRoutine_Human
{
    default Schedule(11, 0, UAIState_Smoke(), n"FP_OM_STAND_01");
    default Schedule(12, 0, UAIState_StandAround(), n"FP_OM_STAND_01");
    default Schedule(20, 0, UAIState_Campfire(), n"FP_OM_STAND_01");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OM_STAND_01");
}

UCLASS()
class UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_CheckBody(), n"FP_OM_FL_CHECKBODY_02");
    default Schedule(15, 0, UAIState_Sit(), n"FP_OM_FL_REST_01");
    default Schedule(22, 05, UAIState_CheckBody(), n"FP_OM_FL_CHECKBODY_02");
    default Schedule(1, 0, UAIState_Sit(), n"FP_OM_FL_REST_01");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OM_SC_TPL_Templar05_1438_AfterCollapsed : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_Guard(), n"FP_SC_GUARD_47", 300);
    default Schedule(15, 0, UAIState_SleepStanding(), n"FP_SC_GUARD_47", 300);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}