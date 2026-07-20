UCLASS()
class UAIAgentConfig_Human_OM_TPL_GorNaVid_1433 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_TPL_GorNaVid_1433::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_TPL_GorNaVid_1433_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 30, UAIState_SitAround(), n"IO_OM_CHAIR_05");
    default Schedule(7, 0, UAIState_LightFire(), n"FP_OM_LIGHTFIRE_01");
    default Schedule(9, 0, UAIState_SitAround(), n"IO_OM_CHAIR_05");
    default Schedule(22, 30, UAIState_LightFire(), n"FP_OM_LIGHTFIRE_01");
}


UCLASS()
class UDailyRoutine_OM_TPL_GorNaVid_1433_Tunnel : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_29");
}

UCLASS()
class UDailyRoutine_OM_TPL_GorNaVid_1433_Smoke : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smoke(), n"FP_OM_STAND_3", 100);
}