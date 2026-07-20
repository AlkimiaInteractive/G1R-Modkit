UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger39_575 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger39_575::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger39_575_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_45);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER575");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER575");

    default Schedule(6, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_23");
    default Schedule(7, 30, UAIState_StandAround(), n"FP_OC_STANDAROUND_61",1500);
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_43",300);
    default Schedule(17, 0, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_04", n"FP_OC_LeaveFoodBag_02"), NAME_None);
    default Schedule(22, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_23", 300);
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

