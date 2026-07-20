UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar04_1408 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar04_1408::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar04_1408_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_10",3000.0f);
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_11",3000.0f);
    default Schedule(20, 0, UAIState_Cook(), n"IO_SC_CAMP_CAULDRON_05");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_10",3000.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_11",3000.0f);
}