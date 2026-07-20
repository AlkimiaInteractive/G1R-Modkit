UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard04_218 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard04_218::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard04_218_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SleepStanding(), n"FP_OC_GUARDPASSAGE_05",500);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_05",500);
    default Schedule(6, 35, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_05",500);
    default Schedule(23, 35, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_05",500);

    default ScheduleIfRaining(0, 10, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_48",500);
}