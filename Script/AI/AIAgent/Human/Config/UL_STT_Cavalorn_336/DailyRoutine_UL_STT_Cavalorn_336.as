
UCLASS()
class UAIAgentConfig_Human_UL_STT_Cavalorn_336 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_STT_Cavalorn_336::StaticClass();
}

UCLASS()
class UDailyRoutine_UL_STT_Cavalorn_336_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_CavalornValley_Cavalorn_Hut);
    default KnownPlaces.Add(Location::Bed, n"IO_UL_BED_CAVALORN");
    default KnownPlaces.Add(Location::Home, n"IO_UL_BED_CAVALORN");

    default Schedule(9, 0, UAIState_StandAround(), n"FP_CV_CAVALORN_CAMPFIRE");
    default Schedule(11, 0, UAIState_Cook(), n"IO_UL_PAN_01");
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_UL_CHAIRBENCH_01");
    default Schedule(15, 0, UAIState_Campfire(), n"FP_CV_CAVALORN_CAMPFIRE");
    default Schedule(18, 0, UAIState_Cook(), n"IO_CA_Hut_Cauldron_01");
    default Schedule(20, 0, UAIState_Leatherworking(), n"IO_CV_TANNING_03");
    default Schedule(22, 0, UAIState_Eat_Seated(), n"IO_UL_CHAIRBENCH_01");
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(9, 0, UAIState_RainShelter(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
