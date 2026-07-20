UCLASS()
class UAIAgentConfig_Human_OC_VLK_Herek_511 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Herek_511::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Herek_511_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_43);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_HEREK");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_HEREK");
}

UCLASS()
class UDailyRoutine_OC_VLK_Herek_511_Start : UDailyRoutine_OC_VLK_Herek_511_Ownership
{
    default Schedule(6, 30, UAIState_Pee(), n"FP_OC_PEE_25");
    default Schedule(7, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_03",300.0f);
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_20",300.0f);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_43_HEREK",300.0f);
    default Schedule(13, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_03",250.0f);
    default Schedule(19, 30, UAIState_Drink(), n"IO_OC_CHAIR_BENCH_43_HEREK",500.0f);
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), n"IO_OC_CHAIR_BENCH_43_HEREK",100);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
