UCLASS()
class UAIAgentConfig_Human_OC_STT_Whistler_309 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Whistler_309::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Whistler_309_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_75);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_WHISTLER");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_WHISTLER");

    default Schedule(8, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_23_WHISTLER");
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_23_WHISTLER");
    default Schedule(14, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_23_WHISTLER");
    default Schedule(19, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_23_WHISTLER");
    default Schedule(20, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_23_WHISTLER");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500); 

    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_23_WHISTLER",200);
    default ScheduleIfRaining(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_STT_Whistler_309_InspectSword : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_75);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_WHISTLER");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_WHISTLER");

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    default AutoSwitchToRoutine = UDailyRoutine_OC_STT_Whistler_309_Start;

    default Schedule(8, 0, UAIState_SharpWeapon(), n"IO_OC_CHAIR_BENCH_23_WHISTLER");

}