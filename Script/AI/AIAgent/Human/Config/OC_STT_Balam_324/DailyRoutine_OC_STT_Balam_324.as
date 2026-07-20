UCLASS()
class UAIAgentConfig_Human_OC_STT_Balam_324 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Balam_324::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Balam_324_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 30, UAIState_Eat(), n"IO_OC_CHAIR_03",500);
    default Schedule(8, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_CAULDRON_06",1000); 
    default Schedule(10, 0, UAIState_Drink(), n"IO_OC_CHAIR_03",500);
    default Schedule(14, 30, UAIState_Cook(), n"IO_OC_CAMPFIRE_CAULDRON_06",1000);
    default Schedule(19, 30, UAIState_Eat(), n"IO_OC_CHAIR_03",500);
    default Schedule(20, 30, UAIState_Sit(), n"IO_OC_CHAIR_03",500);
    default Schedule(23, 30, UAIState_Sleep(), n"IO_OC_BED_BALAM", WaypointRadius = 500);

}