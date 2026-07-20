UCLASS()
class UAIAgentConfig_Human_OC_STT_Sly_315 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Sly_315::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_STT_Sly_315_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_50);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SLY");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SLY");
}

UCLASS()
class UDailyRoutine_OC_STT_Sly_315_Start : UDailyRoutine_OC_STT_Sly_315_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500); 
    default Schedule(6, 0, UAIState_GuardPatrol(40), n"FP_OC_STANDAROUND_74",1000);
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_46",1000); 
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_24_SLY",500);
    default Schedule(13, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_24_SLY",500);

    default ScheduleIfRaining(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
}

UCLASS()
class UDailyRoutine_OC_STT_Sly_315_InExtremoWait : UDailyRoutine_OC_STT_Sly_315_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500); 
    default Schedule(6, 0, UAIState_GuardPatrol(40), n"FP_OC_STANDAROUND_74",1000);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_24_SLY",500);
    default Schedule(13, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_24_SLY",500);

    default ScheduleIfRaining(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
}