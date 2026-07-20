UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger29_534 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger29_534::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger29_534_Start : UAIState_DailyRoutine_Human_Digger
{
    default Schedule(6, 6, UAIState_WashSelf(), n"FP_OW_OC_WASHSELFRIVER_02");
    default Schedule(7, 0, UAIState_Pee(), n"FP_OW_OC_PEE_01");
    default Schedule(8, 0, UAIState_SitAround(), n"IO_OC_OUTSIDE_CHAIR_01");
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_OC_OUTSIDE_CHAIR_01");
    default Schedule(14, 0, UAIState_SitAround(), n"IO_OC_OUTSIDE_CHAIR_01");
    default Schedule(20, 0, UAIState_Drink(), n"IO_OC_OUTSIDE_CHAIR_01");
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_OUTSIDE_CHAIR_01");
    default Schedule(22, 0, UAIState_Sleep(), n"Bed_Digger534");
}
