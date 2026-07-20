UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard29_279 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard29_279::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard29_279_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_24",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_24",300);
    default Schedule(6, 30, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_24",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_24",300);


}