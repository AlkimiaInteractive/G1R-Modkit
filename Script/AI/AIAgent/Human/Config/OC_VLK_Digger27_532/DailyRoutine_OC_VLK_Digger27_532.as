UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger27_532 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger27_532::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger27_532_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_28);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER532");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER532");

    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_33");
    default Schedule(11, 0, UAIState_Smoke(), n"FP_OC_CAMPFIRE_33");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_33");
    default Schedule(17, 0, UAIState_Smoke(), n"FP_OC_CAMPFIRE_33");
    default Schedule(19, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_33");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger27_532_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_13", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger27_532_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_13", 200);
}