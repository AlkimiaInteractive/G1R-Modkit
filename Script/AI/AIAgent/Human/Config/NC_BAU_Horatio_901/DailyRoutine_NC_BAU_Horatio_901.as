UCLASS()
class UAIAgentConfig_Human_NC_BAU_Horatio_901 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Horatio_901::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Horatio_901_Start : UDailyRoutines_Peasants
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_01);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_HORATIO");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_HORATIO");

    //default Schedule(7, 5, UAIState_WashSelf_and_Work(n"FP_NC_WASHSELF_03"), n"FP_NC_PICKRICE_21");
    default Schedule(7, 5, UAIState_QueueWashThenPickRice(), n"FP_NC_PICKRICE_21");
    //default Schedule(7, 25, UAIState_PickRice(), n"FP_NC_PICKRICE_21");
    default Schedule(13, 1, UAIState_Eat(), n"FP_NC_PICKRICE_21");
    default Schedule(13, 31, UAIState_PickRice(), n"FP_NC_PICKRICE_21");
    default Schedule(20, 35, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), n"FP_NC_RAINSHELTER_17");
    default ScheduleIfRaining(20, 35, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}