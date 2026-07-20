UCLASS()
class UAIAgentConfig_Human_NC_KDW_Cronos_604: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_KDW_Cronos_604::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_KDW_Cronos_604_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Rooms_Cronos);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_CRONOS");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_CRONOS");
}

UCLASS()
class UDailyRoutine_NC_KDW_Cronos_604_Start : UDailyRoutine_NC_KDW_Cronos_604_Ownership
{
    default Schedule(7, 40, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(8, 30, UAIState_Stand(), n"FP_NC_STANDAROUND_21");
    default Schedule(13, 10, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(15, 00, UAIState_Stand(), n"FP_NC_STANDAROUND_21");
    default Schedule(17, 30, UAIState_Stand(), n"FP_NC_STANDAROUND_21");
    default Schedule(22, 10, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_KDW_Cronos_604_FMOre : UDailyRoutine_NC_KDW_Cronos_604_Ownership
{
    default Schedule(5, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_21");
}
