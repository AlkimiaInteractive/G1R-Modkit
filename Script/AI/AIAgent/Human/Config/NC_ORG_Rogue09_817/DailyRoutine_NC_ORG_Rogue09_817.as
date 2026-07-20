UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue09_817 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue09_817::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue09_817_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_10);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE817_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE817_CM");

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"FP_NC_CAMPFIRE_09");
    default Schedule(8, 0, UAIState_Cook(), n"IO_NC_CAMPFIRE_PAN_06",350);
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_CAMPFIRE_09");
    default Schedule(20, 40, UAIState_RoastScavenger(), n"IO_NC_CAMPFIRE_ROTISSERIE_06",350);
    default Schedule(22, 0, UAIState_Eat(), n"FP_NC_CAMPFIRE_09");
    default Schedule(22, 30, UAIState_Cook(), n"IO_NC_CAMPFIRE_PAN_06",350);
}