UCLASS()
class UAIAgentConfig_Human_SC_NOV_Ghorim_1310 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Ghorim_1310::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Ghorim_1310_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Ghorim);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_GHORIM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_GHORIM");
}

UCLASS()
class UDailyRoutine_SC_NOV_Ghorim_1310_Sleep : UDailyRoutine_SC_NOV_Ghorim_1310_Ownership  //WE NEED TO CHANGE BOTH ROUTINES
{
    
    default Schedule(23, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Ghorim_1310_Start : UDailyRoutine_SC_NOV_Ghorim_1310_Ownership
{
    default Schedule(8, 50, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_01");
    default Schedule(23, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Ghorim_1310_Wait : UDailyRoutine_SC_NOV_Ghorim_1310_Ownership
{
    default Schedule(8, 50, UAIState_StandAround(), n"FP_SC_GHORIM_STAY");
    default Schedule(17, 50, UAIState_Smoke(), n"FP_SC_GHORIM_STAY");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Ghorim_1310_Sleepy : UDailyRoutine_SC_NOV_Ghorim_1310_Ownership
{
    default Schedule(8, 50, UAIState_StandAround(), n"FP_SC_GHORIM_SLEEPY");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}