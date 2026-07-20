UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar23_1440 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar23_1440::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar23_1440_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_01");
    default Schedule(9, 0, UAIState_GuideToSwampCamp_GorNaDrak_Templar23(), n"FP_SC_SMALLTALK_16");
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_16");
    default Schedule(19, 0, UAIState_GuideToOldMine_GorNaDrak_Templar23(), n"FP_OM_SMALLTALK_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::Never;
    default ScheduleTimeOffsetMinutesMax = 0;
    default ScheduleTimeOffsetMinutesMin = 0;
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar23_1440_Rest : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_01");
}


UCLASS()
class UDailyRoutine_SC_TPL_Templar23_1440_FMTaken : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_16");
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar23_1440_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_SC_GUARD_50",100);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar23_1440_RunToPlayer : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(0, 0, UAIState_FollowHero(100, false),NAME_None);
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar23_1440_BackToCamp : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_SC_GUARD_48");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}