UCLASS()
class UAIAgentConfig_Human_FM_STT_Shadow02_337 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_STT_Shadow02_337::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_STT_Shadow02_337_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_RoastScavenger(), n"IO_FM_CAMPFIRE_ROTISSERIE_01");
}

UCLASS()
class UDailyRoutine_FM_STT_Shadow02_337_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_RoastScavenger(), n"IO_FM_CAMPFIRE_ROTISSERIE_01");
}
