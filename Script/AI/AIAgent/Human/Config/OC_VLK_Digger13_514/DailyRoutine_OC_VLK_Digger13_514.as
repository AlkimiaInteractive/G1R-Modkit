UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger13_514 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger13_514::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger13_514_Start : UDailyRoutine_Digger
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER514");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER514");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_01", n"FP_OC_LeaveFoodBag_03"), NAME_None);
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_37",1500.f);
    default Schedule(18, 0, UAIState_Eat(), n"IO_OC_CHAIR_53", 500.0f);

    //default Schedule(13, 0, UAIState_ServeFoodAndEat(), n"FP_OC_CALDRUON_LINE_1",1500.f);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_08", 5000.0f);

    default ArenaSpectatorSchedule(UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03");
}