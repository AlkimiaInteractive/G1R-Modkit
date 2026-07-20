UCLASS()
class UAIAgentConfig_Human_OC_STT_Omid_325 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Omid_325::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Omid_325_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 30, UAIState_Eat(), n"IO_OC_CHAIR_28",300);
    default Schedule(8, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_17",1000); 
    default Schedule(11, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_CAULDRON_06",1000);
    default Schedule(12, 30, UAIState_Drink(), n"IO_OC_CHAIR_28",300);
    default Schedule(13, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_CAULDRON_06",1000);
    default Schedule(14, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_17",1000);
    default Schedule(19, 30, UAIState_Eat(), n"IO_OC_CHAIR_28",300);
    default Schedule(20, 30, UAIState_Sit(), n"IO_OC_CHAIR_28",300);
    default Schedule(23, 30, UAIState_Sleep(), n"IO_OC_BED_OMID", WaypointRadius = 500);

}