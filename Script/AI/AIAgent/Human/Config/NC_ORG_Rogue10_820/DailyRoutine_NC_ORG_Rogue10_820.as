UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue10_820 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue10_820::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue10_820_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_14);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE820");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE820");

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"FP_NC_CAMPFIRE_11");
    default Schedule(8, 0, UAIState_CutWood_Trunk(), n"IO_NC_CUTTRUNK_2");
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_CAMPFIRE_11");
    default Schedule(13, 56, UAIState_CutWood_Trunk(), n"IO_NC_CUTTRUNK_2");
    default Schedule(22, 0, UAIState_Eat(), n"FP_NC_CAMPFIRE_11");
    default Schedule(22, 30, UAIState_StandAround(), n"IO_NC_CUTTRUNK_2");
}