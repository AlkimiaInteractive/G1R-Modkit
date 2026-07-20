UCLASS()
class UAIAgentConfig_Human_SC_NOV_Fortuno_1357 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Fortuno_1357::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Fortuno_1357_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Fortuno);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_FORTUNO_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_FORTUNO_CM");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat(), n"IO_SC_BENCH_2", 200);
    //default Schedule(7, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_02", 200);
    default Schedule(7, 30, UAIState_Stand(), n"FP_SC_STANDAROUND_02",200);
    default Schedule(20, 0, UAIState_Eat(), n"FP_SC_STANDAROUND_02",200);
    default Schedule(21, 0, UAIState_Stand(), n"FP_SC_STANDAROUND_02",200);

    

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(6, 0, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_07");
    default ScheduleIfRaining(7, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_02", 200);
    default ScheduleIfRaining(14, 0, UAIState_Stand(), n"FP_SC_STANDAROUND_02",100);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_SC_STANDAROUND_02",100);
    default ScheduleIfRaining(21, 0, UAIState_Stand(), n"FP_SC_STANDAROUND_02",100);

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);

}
