UCLASS()
class UAIAgentConfig_Human_SC_GUR_BaalOrun_1209: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_BaalOrun_1209::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_GUR_BaalOrun_1209_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_BaalOrun);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_BAALORUN");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_BAALORUN");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalOrun_1209_Start : UDailyRoutine_SC_GUR_BaalOrun_1209_Ownership
{
    default Schedule(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 25, UAIState_Eat(), n"IO_SC_CHAIR_25");
    default Schedule(7, 5, UAIState_GuardPatrol(), n"FP_SC_GUARD_40");
    default Schedule(12, 56, UAIState_Smoke(), n"FP_SC_GUARD_17");
    default Schedule(13, 56, UAIState_GuardPatrol(), n"FP_SC_GUARD_40");
    default Schedule(21, 30, UAIState_Smoke(), n"FP_SC_GUARD_17");
    default Schedule(22, 30, UAIState_GuardPatrol(), n"FP_SC_GUARD_40");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalOrun_1209_CampDivided : UDailyRoutine_SC_GUR_BaalOrun_1209_Ownership
{
    default Schedule(8, 0, UAIState_PotionAlchemy(), n"IO_SC_POTION_ALCHEMY_02");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


