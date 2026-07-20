UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger15_516 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger15_516::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger15_516_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_74);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER516");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER516");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Pee(), n"FP_OC_PEE_01");
    default Schedule(7, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_02");
    default Schedule(10, 0, UAIState_Sweep(), n"FP_OC_SWEEP_27",2500);
    default Schedule(13, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_02", 1500.0f);
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_39");
    default Schedule(17, 5, UAIState_Sweep(), n"FP_OC_SWEEP_27",2500);
    default Schedule(20, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_02");
}
