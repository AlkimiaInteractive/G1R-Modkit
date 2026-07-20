UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary08_720 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary08_720::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary08_720_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 30, UAIState_Sleep_Seated(), n"IO_NC_CHAIR_BENCH_18");
    default Schedule(7, 0, UAIState_Eat(), n"FP_NC_STANDAROUND_19",1000);
    default Schedule(8, 0, UAIState_RoastScavenger(), n"IO_NC_CAMPFIRE_ROTISSERIE_01",1000);
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_STANDAROUND_19",1000);
    default Schedule(13, 56, UAIState_RoastScavenger(), n"IO_NC_CAMPFIRE_ROTISSERIE_01",1000);
    default Schedule(21, 0, UAIState_Eat(), n"FP_NC_STANDAROUND_19",1000);
    default Schedule(22, 0, UAIState_SitAround(), n"FP_NC_STANDAROUND_19",1000);
}