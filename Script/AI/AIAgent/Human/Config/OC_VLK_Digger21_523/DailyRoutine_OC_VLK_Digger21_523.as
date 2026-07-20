UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger21_523 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger21_523::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger21_523_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_37);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER523");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER523");

    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_28",200);
    default Schedule(7, 0, UAIState_CutWood_Trunk(), n"IO_OC_SLICEWOOD_01");
    // default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_28",200);
    // default Schedule(13, 0, UAIState_CutWood_Trunk(), n"IO_OC_SLICEWOOD_01");
    // default Schedule(18, 0, UAIState_Drink(), n"IO_OC_CHAIR_BENCH_28",200);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
