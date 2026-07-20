UCLASS()
class UAIAgentConfig_Human_OC_GRD_Thorus_200 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Thorus_200::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Thorus_200_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom_01);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_THORUS");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_THORUS");

    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_36");
    default Schedule(8, 0, UAIState_Thorus_Guard(), n"FP_OC_GUARDPASSAGE_20",200);
    default Schedule(22, 00, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_36");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);
}

