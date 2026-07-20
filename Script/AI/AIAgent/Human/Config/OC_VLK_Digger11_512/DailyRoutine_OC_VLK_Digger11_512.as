UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger11_512 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger11_512::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger11_512_Start : UDailyRoutine_Digger
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER512");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER512");
    
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_26");
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_20");
    //default Schedule(12, 1, UAIState_StandAround(), n"FP_OC_STANDAROUND_83",200);
    default Schedule(12, 0, UAIState_CarryBoxes(n"FP_OC_TakeBox_2", n"FP_OC_LeaveBox_2"), NAME_None,500);
    default Schedule(17, 2, UAIState_Rest(), n"FP_OC_CAMPFIRE_20",500);
    default Schedule(20, 45, UAIState_SitAround(), n"IO_OC_CHAIR_38");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(17, 2, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_192",500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
