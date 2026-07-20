UCLASS()
class UAIAgentConfig_Human_SC_NOV_Theron_1372N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Theron_1372N::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Theron_1372N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 30, UAIState_Sit(), n"FP_SC_SIT_GROUND");
}

UCLASS()
class UDailyRoutine_SC_NOV_Theron_1372N_VistaPoint : UAIState_DailyRoutine_Human
{
    default Schedule(6, 30, UAIState_Sit(), n"FP_SC_SIT_GROUND2");
    default Schedule(11, 30, UAIState_Smoke(), n"FP_SC_SIT_GROUND2");
    default Schedule(18, 30, UAIState_Eat(), n"IO_SC_CHAIR_29", 300);
    default Schedule(21, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_06");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Theron_1372N_Test_Climb_Up : UAIState_DailyRoutine_Human
{
    default ScheduleTimeOffsetMinutesMin = 0.f;
    default ScheduleTimeOffsetMinutesMax = 0.f;

    default Schedule(09, 58, UAIState_TestGotoWP(), FName(n"FP_TOP_02"), 50.0f);
    default Schedule(10, 20, UAIState_TestGotoWP(), FName(n"FP_DOWN_02"), 50.0f);
}