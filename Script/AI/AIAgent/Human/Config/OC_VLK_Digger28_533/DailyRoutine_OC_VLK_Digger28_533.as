UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger28_533 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger28_533::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger28_533_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_41);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER533");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER533");

    default Schedule(6, 30, UAIState_Eat(), n"IO_OC_CAMPFIRE_PAN_01");
    default Schedule(7, 45, UAIState_Cook(), n"FP_OC_CAMPFIRE_03");
    default Schedule(17, 0, UAIState_Eat(), n"IO_OC_CAMPFIRE_PAN_01");
    default Schedule(18, 0, UAIState_Campfire(), n"IO_OC_CAMPFIRE_PAN_01");
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
