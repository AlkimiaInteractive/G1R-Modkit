UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger06_506 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger06_506::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger06_506_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_10);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER506");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER506");

    default Schedule(6, 45, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_48");
    default Schedule(9, 0, UAIState_CarryPlanks(n"FP_OC_TakePlank_01", n"FP_OC_LeavePlank_01"), NAME_None);
    default Schedule(11, 30, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_24");
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_EAT_03");
    default Schedule(14, 0, UAIState_CarryPlanks(n"FP_OC_TakePlank_01", n"FP_OC_LeavePlank_01"), NAME_None);
    default Schedule(17, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_24");
    default Schedule(19, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_53");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    //default Schedule(13, 0, UAIState_ServeFoodAndEat(), n"FP_OC_CALDRUON_LINE_1",1500.f);
    
    default ScheduleIfRaining(6, 45, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_24",750);
    default ScheduleIfRaining(9, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(11, 30, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_24",750);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(17, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_24",750);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger06_506_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_03", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger06_506_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_03", 200);
}