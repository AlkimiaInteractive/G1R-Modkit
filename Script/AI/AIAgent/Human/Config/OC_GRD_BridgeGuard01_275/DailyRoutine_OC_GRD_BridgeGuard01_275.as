UCLASS()
class UAIAgentConfig_Human_OC_GRD_BridgeGuard01_275 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_BridgeGuard01_275::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_BridgeGuard01_275_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SleepStanding(), n"FP_GUARDPASSAGE_A_OW_01",500);
    default Schedule(6, 30, UAIState_Eat(), n"FP_GUARDPASSAGE_A_OW_01",500);
    default Schedule(7, 0, UAIState_Guard(), n"FP_GUARDPASSAGE_A_OW_01",500);
    default Schedule(23, 30, UAIState_Eat(), n"FP_GUARDPASSAGE_A_OW_01",500);
}