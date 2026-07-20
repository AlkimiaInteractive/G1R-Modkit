UCLASS()
class UAIAgentConfig_Human_NC_ORG_Ulmar_881N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Ulmar_881N::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Ulmar_881N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"IO_NC_CHAIR_BENCH_39");
    default Schedule(7, 15, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_39");
    default Schedule(8, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_39");
    default Schedule(12, 56, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_39");
}