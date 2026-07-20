UCLASS()
class UAIAgentConfig_Human_NC_ORG_Cipher_873 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Cipher_873::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Cipher_873_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Cipher);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_CIPHER");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_CIPHER");

    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_29",);
    default Schedule(7, 30, UAIState_Trader_CountOre(), n"FP_NC_STANDAROUND_04",);
    default Schedule(12, 55, UAIState_Eat(), n"IO_NC_CHAIR_29");
    default Schedule(13, 54, UAIState_Trader_CountOre(), n"FP_NC_STANDAROUND_04");
    default Schedule(22, 25, UAIState_Eat(), n"IO_NC_CHAIR_29");
    default Schedule(23, 31, UAIState_Trader_CountOre(), n"FP_NC_STANDAROUND_04");

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Rogue31PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_NC_PLAYLUTE");

}