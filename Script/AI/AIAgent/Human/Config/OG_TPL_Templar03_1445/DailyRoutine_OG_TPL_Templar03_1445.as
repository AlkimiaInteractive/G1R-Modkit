UCLASS()
class UAIAgentConfig_Human_OG_TPL_Templar03_1445 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OG_TPL_Templar03_1445::StaticClass();

}



UCLASS()
class UDailyRoutine_OG_TPL_Templar03_1445_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Menace(), n"FP_OG_GUARD_5");
    default Schedule(12, 0, UAIState_Menace(), n"FP_OG_GUARD_5");
}