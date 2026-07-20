UCLASS()
class UAIAgentConfig_Human_NC_ORG_Bruce_828 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Bruce_828::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Bruce_828_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Bruce);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_BRUCE");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_BRUCE");

    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Sit(), n"FP_NC_STANDAROUND_13",400);
    default Schedule(7, 30, UAIState_CountOre(), n"FP_NC_STANDAROUND_06",400);
    default Schedule(12, 56, UAIState_Sit(), n"FP_NC_STANDAROUND_13",400);
    default Schedule(13, 56, UAIState_CountOre(), n"FP_NC_STANDAROUND_06",400);
    default Schedule(21, 30, UAIState_Sit(), n"FP_NC_STANDAROUND_13",400);
    default Schedule(22, 30, UAIState_CountOre(), n"FP_NC_STANDAROUND_06",400);
}