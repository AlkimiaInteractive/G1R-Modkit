UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary04_706 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary04_706::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary04_706_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_32);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY706"); 
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY706");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"FP_NC_STANDAROUND_18",1000);
    default Schedule(8, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_18",1000);
    default Schedule(11, 0, UAIState_Cook(), n"IO_NC_CAMP_CAULDRON_02");
    default Schedule(13, 3, UAIState_Eat(), n"FP_NC_STANDAROUND_18",1000);
    default Schedule(14, 1, UAIState_StandAround(), n"FP_NC_STANDAROUND_18",1000);
    default Schedule(17, 0, UAIState_Cook(), n"IO_NC_CAMP_CAULDRON_02");
    default Schedule(21, 30, UAIState_Eat(), n"FP_NC_STANDAROUND_18",1000);
    default Schedule(22, 31, UAIState_StandAround(), n"FP_NC_STANDAROUND_18",1000);
}