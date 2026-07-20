UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary20_739N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary20_739N::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary20_739N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Drink(), n"IO_NC_CHAIR_44",200);
    default Schedule(11, 0, UAIState_Smoke(), n"FP_NC_SMOKE_03",300);
    default Schedule(13, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_16",300);
    default Schedule(16, 0, UAIState_LeanWall(), n"FP_NC_LEANWALL_1",300);
    default Schedule(23, 0, UAIState_Drink(), n"IO_NC_CHAIR_44",200);
    default Schedule(2, 0, UAIState_Sleep_Table(), n"IO_NC_CHAIR_44",200);

    default ScheduleIfRaining(8, 0, UAIState_Drink(), n"IO_NC_CHAIR_44",200);
    default ScheduleIfRaining(8, 0, UAIState_Sleep_Table(), n"IO_NC_CHAIR_44",200);
}