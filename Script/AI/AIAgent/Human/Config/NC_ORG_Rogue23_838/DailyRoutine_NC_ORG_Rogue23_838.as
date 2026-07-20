UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue23_838 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue23_838::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue23_838_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_17);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE838");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE838");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue23_838_Start : UDailyRoutine_NC_ORG_Rogue23_838_Ownership
{
    default Schedule(2, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"FP_NC_SMALLTALK_18a");
    default Schedule(9, 5, UAIState_CarryBoxes(n"FP_NC_TakeBox", n"FP_NC_LeaveBox"), NAME_None);
    default Schedule(21, 30, UAIState_Eat(), n"FP_NC_SMALLTALK_18a");
    default Schedule(22, 30, UAIState_CarryBoxes(n"FP_NC_TakeBox", n"FP_NC_LeaveBox"), NAME_None);
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue23_838_FMTaken : UDailyRoutine_NC_ORG_Rogue23_838_Ownership
{
    default Schedule(7, 30, UAIState_Guard(), n"FP_NC_GATE_GUARD6",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}