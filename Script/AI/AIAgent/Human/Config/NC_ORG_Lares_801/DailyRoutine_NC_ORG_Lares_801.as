UCLASS()
class UAIAgentConfig_Human_NC_ORG_Lares_801 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Lares_801::StaticClass();

}

class UDailyRoutine_NC_ORG_Lares_801_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Lares);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_LARES");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_LARES");
}

UCLASS()
class UDailyRoutine_NC_ORG_Lares_801_Start : UDailyRoutine_NC_ORG_Lares_801_Ownership
{
    

    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"FP_NC_STANDAROUND_24",400);
    default Schedule(8, 5, UAIState_StandAround(), n"FP_NC_STANDAROUND_24",400);
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_STANDAROUND_24",400);
    default Schedule(13, 56, UAIState_StandAround(), n"FP_NC_STANDAROUND_24",400);
    default Schedule(21, 30, UAIState_Eat(), n"FP_NC_STANDAROUND_24",400);
    default Schedule(22, 30, UAIState_StandAround(), n"FP_NC_STANDAROUND_24",400);
}

UCLASS()
class UDailyRoutine_NC_ORG_Lares_801_Collapse : UDailyRoutine_NC_ORG_Lares_801_Ownership
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_27",200);
}

UCLASS()
class UDailyRoutine_NC_ORG_Lares_801_Smoke : UDailyRoutine_NC_ORG_Lares_801_Ownership
{
    default Schedule(7, 0, UAIState_Smoke(), n"FP_NC_STANDAROUND_28",100);
}