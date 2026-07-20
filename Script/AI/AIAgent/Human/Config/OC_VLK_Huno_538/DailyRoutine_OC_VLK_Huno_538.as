UCLASS()
class UAIAgentConfig_Human_OC_VLK_Huno_538 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Huno_538::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Huno_538_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_25);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_23);
    
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_HUNO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_HUNO");
}

UCLASS()
class UDailyRoutine_OC_VLK_Huno_538_Start : UDailyRoutine_OC_VLK_Huno_538_Ownership
{

    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_20_HUNO",300.0f);
    default Schedule(7, 0, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default Schedule(13, 0, UAIState_Drink(), n"IO_OC_CHAIR_BENCH_20_HUNO",300.0f);
    default Schedule(14, 0, UAIState_WashSelf(), n"FP_OC_WASHSELF_03",300.0f);
    default Schedule(14, 15, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(7, 0, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default ScheduleIfRaining(13, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(14, 15, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Huno_538_HeroInsideForge : UDailyRoutine_OC_VLK_Huno_538_Ownership
{
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_20_HUNO",300.0f);
    default Schedule(7, 0, UAIState_CarveWood(), n"IO_OC_CHAIR_BENCH_26");
    default Schedule(13, 0, UAIState_Drink(), n"IO_OC_CHAIR_BENCH_20_HUNO",300.0f);
    default Schedule(14, 15, UAIState_CarveWood(), n"IO_OC_CHAIR_BENCH_26");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(7, 0, UAIState_CarveWood(), n"IO_OC_CHAIR_BENCH_26");
    default ScheduleIfRaining(13, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(14, 15, UAIState_CarveWood(), n"IO_OC_CHAIR_BENCH_26");
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Huno_538_InExtremoWait : UDailyRoutine_OC_VLK_Huno_538_Ownership
{
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_20_HUNO",300.0f);
    default Schedule(7, 0, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default Schedule(13, 0, UAIState_Drink(), n"IO_OC_CHAIR_BENCH_20_HUNO",300.0f);
    default Schedule(14, 15, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(7, 0, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default ScheduleIfRaining(13, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(14, 15, UAISTate_Huno_Smith(), n"IO_OC_FORGE_02");
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}