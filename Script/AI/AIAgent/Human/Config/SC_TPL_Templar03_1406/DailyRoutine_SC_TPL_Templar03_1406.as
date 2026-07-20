UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar03_1406 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar03_1406::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar03_1406_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_03");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_03");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_03");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_03");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar03_1406_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(7, 30, UAIState_Guard(), n"FP_OG_GUARD_01",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar03_1406_CampDivided_Ambient : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_StandAround(), n"FP_OG_STAND_01");

    default ScheduleIfRaining(12, 0, UAIState_StandAround(), n"FP_OG_STAND_01",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar03_1406_Confrontation : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_04");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}