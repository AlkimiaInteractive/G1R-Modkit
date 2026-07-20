UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger41_577 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger41_577::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger41_577_Start : UDailyRoutine_Digger 
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_5);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER577");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER577");

    default Schedule(0, 0, UAIState_Sleep(), n"IO_OC_BED_DIGGER577", WaypointRadius = 500);
    default Schedule(8, 0, UAIState_RepairFloor(), n"FP_OC_BUILDSTAGE_01",5000.0f);
    default Schedule(12, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_04");
    default Schedule(15, 0, UAIState_RepairFloor(), n"FP_OC_BUILDSTAGE_01",5000.0f);
    default Schedule(19, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_04");
    default Schedule(20, 30, UAIState_SitAround(), n"FP_OC_CAMPFIRE_04");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_52",500);
    default ScheduleIfRaining(12, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_52",500);
    default ScheduleIfRaining(19, 0, UAIState_RainShelter_Digger(), Location::Home,500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger41_577_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_20", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger41_577_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_20", 200);
}