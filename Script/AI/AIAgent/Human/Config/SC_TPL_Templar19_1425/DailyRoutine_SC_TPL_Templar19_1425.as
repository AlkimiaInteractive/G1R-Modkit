UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar19_1425 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar19_1425::StaticClass();
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar19_1425_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_06");
    default Schedule(5, 0, UAIState_Eat(), n"FP_SC_GUARD_06");
    default Schedule(6, 30, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_22"), n"FP_SC_GUARD_06");
    default Schedule(20, 0, UAIState_Eat(), n"FP_SC_GUARD_06");
    default Schedule(21, 0, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_22"), n"FP_SC_GUARD_06");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_01");
    default ScheduleIfRaining(5, 0, UAIState_Eat(), n"FP_SC_GUARD_01");
    default ScheduleIfRaining(6, 30, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_22"), n"FP_SC_GUARD_01");
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_SC_GUARD_01");
    default ScheduleIfRaining(21, 0, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_22"), n"FP_SC_GUARD_01");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar19_1425_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Guard(), n"FP_OG_GUARD_02");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}