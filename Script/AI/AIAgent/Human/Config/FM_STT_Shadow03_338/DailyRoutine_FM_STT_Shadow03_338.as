UCLASS()
class UAIAgentConfig_Human_FM_STT_Shadow03_338 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_STT_Shadow03_338::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_STT_Shadow03_338_Start : UAIState_DailyRoutine_Human
{
    default Schedule(12, 30, UAIState_Cook(), n"IO_FM_Cauldron_02");
    default Schedule(14, 0, UAIState_SitAround(), n"IO_FM_CHAIR_3");
}

UCLASS()
class UDailyRoutine_FM_STT_Shadow03_338_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(12, 30, UAIState_Cook(), n"IO_FM_Cauldron_02");
    default Schedule(14, 0, UAIState_SitAround(), n"IO_FM_CHAIR_3");
}
