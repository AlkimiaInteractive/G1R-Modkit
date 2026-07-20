UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard09_225 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard09_225::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard09_225_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"FP_OC_GUARD_05");
    default KnownPlaces.Add(Location::Home, n"FP_OC_GUARD_05");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard09_225_Start : UDailyRoutine_OC_GRD_Guard09_225_Ownership
{

    default Schedule(0, 0, UAIState_SleepStanding(), Location::Bed,300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARD_05",300);
    default Schedule(6, 30, UAIState_Guard(), n"FP_OC_GUARD_05",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARD_05",300);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed,300);
    default ScheduleIfRaining(6, 0, UAIState_Eat(), n"FP_OC_GUARD_13",300);
    default ScheduleIfRaining(6, 30, UAIState_Guard(), n"FP_OC_GUARD_13",300);
    default ScheduleIfRaining(23, 30, UAIState_Eat(), n"FP_OC_GUARD_13",300);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard09_225_WaitYard : UDailyRoutine_OC_GRD_Guard09_225_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STAND_YARD_9", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 
