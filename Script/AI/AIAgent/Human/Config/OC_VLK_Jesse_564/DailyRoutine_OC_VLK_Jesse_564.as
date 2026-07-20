UCLASS()
class UAIAgentConfig_Human_OC_VLK_Jesse_564 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Jesse_564::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Jesse_564_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_44);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_JESSE");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_JESSE");
}

UCLASS()
class UDailyRoutine_OC_VLK_Jesse_564_Start : UDailyRoutine_OC_VLK_Jesse_564_Ownership
{

    default Schedule(6, 45, UAIState_Eat(), n"IO_OC_CHAIR_51_JESSE",500.0f);
    default Schedule(7, 45, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_04",1000.0f);
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_10",300.0f);
    default Schedule(17, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_51_JESSE",500.0f);
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_51_JESSE",500.0f);
    default Schedule(22, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_51_JESSE",500.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 45, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
