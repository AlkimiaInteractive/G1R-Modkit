UCLASS()
class UAIAgentConfig_Human_NC_ORG_Wolf_855 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Wolf_855::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Wolf_855_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Wolf);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_WOLF");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_WOLF");
}


UCLASS()
class UDailyRoutine_NC_ORG_Wolf_855_Start : UDailyRoutine_NC_ORG_Wolf_855_Ownership
{    
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_51",200);
    default Schedule(7, 30, UAIState_Leatherworking(), n"IO_NC_Tanning",200);
    default Schedule(10, 30, UAIState_RoastScavenger(), n"IO_NC_CAMPFIRE_ROTISSERIE_06");
    default Schedule(12, 55, UAIState_Eat(), n"FP_NC_CAMPFIRE_08");
    default Schedule(13, 54, UAIState_Leatherworking(), n"IO_NC_Tanning");
    default Schedule(20, 30, UAIState_SitAround(), n"FP_NC_CAMPFIRE_08");
    default Schedule(22, 25, UAIState_Eat(), n"FP_NC_CAMPFIRE_08");
    default Schedule(23, 31, UAIState_SitAround(), n"FP_NC_CAMPFIRE_08");
}

UCLASS()
class UDailyRoutine_NC_ORG_Wolf_855_FMTaken : UDailyRoutine_NC_ORG_Wolf_855_Ownership
{
    default Schedule(7, 30, UAIState_Guard(), n"FP_NC_GATE_GUARD4",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Wolf_855_CraftingArmor : UDailyRoutine_NC_ORG_Wolf_855_Ownership
{
    default Schedule(7, 30, UAIState_Smith_Workbench(), n"IO_NC_WORKBENCH_01",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
