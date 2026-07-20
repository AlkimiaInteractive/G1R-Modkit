UCLASS()
class UAIAgentConfig_Human_OM_SC_TPL_Templar04_1437 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_SC_TPL_Templar04_1437::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_SC_TPL_Templar04_1437_Start : UAIState_DailyRoutine_Human
{
    default Schedule(11, 0, UAIState_Smoke(), n"FP_OM_STAND_02");
    default Schedule(13, 0, UAIState_StandAround(), n"FP_OM_STAND_02");
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OM_CHAIR_11");
    default Schedule(23, 0, UAIState_StandAround(), n"FP_OM_STAND_02");
}