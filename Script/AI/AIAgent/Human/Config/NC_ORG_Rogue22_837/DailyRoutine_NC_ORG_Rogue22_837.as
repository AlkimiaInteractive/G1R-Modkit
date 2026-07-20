UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue22_837 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue22_837::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue22_837_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_09);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE837_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE837_CM");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue22_837_Start : UDailyRoutine_NC_ORG_Rogue22_837_Ownership
{
    default Schedule(2, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"FP_NC_SMALLTALK_14");
    default Schedule(9, 5, UAIState_LeanWall(), n"FP_NC_SMALLTALK_14",300);
    default Schedule(21, 30, UAIState_Eat(), n"FP_NC_SMALLTALK_17a");
    default Schedule(22, 30, UAIState_LeanWall(), n"FP_NC_SMALLTALK_17a",300);
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue22_837_FMTaken : UDailyRoutine_NC_ORG_Rogue22_837_Ownership
{
    default Schedule(7, 30, UAIState_Guard(), n"FP_NC_GATE_GUARD5",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}