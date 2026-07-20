UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard10_272 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard10_272::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard10_272_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_06");
    default Schedule(8, 0, UAIState_LookAround(), n"FP_OM_GUARD_06",4000);
    default Schedule(10, 0, UAIState_Guard(), n"FP_OM_GUARD_06");
    default Schedule(12, 0, UAIState_Eat(), n"IO_OM_CHAIR_10");
    default Schedule(20, 0, UAIState_LookAround(), n"FP_OM_GUARD_06",4000);
    default Schedule(22, 0, UAIState_Drink(), n"IO_OM_CHAIR_10");
}