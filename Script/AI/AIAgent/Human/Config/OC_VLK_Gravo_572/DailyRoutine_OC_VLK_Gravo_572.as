UCLASS()
class UAIAgentConfig_Human_OC_VLK_Gravo_572 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Gravo_572::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_VLK_Gravo_572_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_55);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GRAVO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GRAVO");

    default Schedule(6, 0, UAIState_Leatherworking(), n"Interactive_TanningTable2116415",500.0f);
    default Schedule(12, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_03",500.0f);
    default Schedule(15, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_14",500.0f);
    default Schedule(16, 0, UAIState_Leatherworking(), n"Interactive_TanningTable2116415",500.0f);
    default Schedule(18, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_03",500.0f);
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}