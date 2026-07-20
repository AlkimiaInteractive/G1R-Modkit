UCLASS()
class UAIAgentConfig_Human_NC_BAU_Jeremiah_912 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Jeremiah_912::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Jeremiah_912_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Kitchen);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Room_Silas);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_JEREMIAH");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_JEREMIAH");

    default Schedule(7, 15, UAIState_Eat(), n"IO_NC_CHAIR_17", 600);
    default Schedule(8, 0, UAIState_Sweep(60.0f), n"FP_NC_SWEEP",2000);
    default Schedule(13, 30, UAIState_Eat(), n"IO_NC_CHAIR_17", 600);
    default Schedule(15, 0, UAIState_Sweep(60.0f), n"FP_NC_SWEEP",2000);
    default Schedule(20, 15, UAIState_Drink(), n"IO_NC_CHAIR_14",600);
    default Schedule(22, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}

UCLASS()
class UDailyRoutine_NC_BAU_Jeremiah_912_AfterSilasRemoved : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Kitchen);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Room_Silas);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_JEREMIAH");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_JEREMIAH");

    default Schedule(0, 0, UAIState_LeanBar(), n"FP_OC_STANDAROUND_89_SILAS",170);
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_PotionAlchemy(), n"IO_NC_POTION_ALCHEMY_02");
    default Schedule(8, 30, UAIState_LeanBar(), n"FP_OC_STANDAROUND_89_SILAS",170);
    default Schedule(23, 0, UAIState_PotionAlchemy(), n"IO_NC_POTION_ALCHEMY_02");


    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}