UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary03_705 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary03_705::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary03_705_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_31);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY705");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY705");
}


UCLASS()
class UDailyRoutine_NC_SLD_Mercenary03_705_Start : UDailyRoutine_NC_SLD_Mercenary03_705_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_SHARP_01",750);
    default Schedule(9, 45, UAIState_Smith_Sharp(), n"IO_NC_SHARP_01",750);
    default Schedule(13, 1, UAIState_Eat(), n"IO_NC_SHARP_01",750);
    default Schedule(14, 2, UAIState_Smith_Sharp(), n"IO_NC_SHARP_01",750);
    default Schedule(16, 0, UAIState_SitAround(), n"IO_NC_SHARP_01",750);
    default Schedule(18, 0, UAIState_Smith_Sharp(), n"IO_NC_SHARP_01",750);
    default Schedule(21, 31, UAIState_Eat(), n"IO_NC_SHARP_01",750);
    default Schedule(22, 31, UAIState_Smith_Sharp(), n"IO_NC_SHARP_01",750);
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary03_705_FMReport : UDailyRoutine_NC_SLD_Mercenary03_705_Ownership
{
    default Schedule(13, 1, UAIState_StandAround(), n"NC_STAND_MERCENARY_STORY",300);
}