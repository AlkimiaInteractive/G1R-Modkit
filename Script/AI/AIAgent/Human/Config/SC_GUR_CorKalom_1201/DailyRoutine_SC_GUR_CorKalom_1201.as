UCLASS()
class UAIAgentConfig_Human_SC_GUR_CorKalom_1201: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_CorKalom_1201::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_CorKalom);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_CORKALOM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_CORKALOM");
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_Start : UDailyRoutine_SC_GUR_CorKalom_1201_Ownership
{
    default Schedule(8, 0, UAIState_PotionAlchemy(), n"IO_SC_POTION_ALCHEMY_02");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_Callsleeper : UDailyRoutine_SC_GUR_CorKalom_1201_Ownership
{
    default Schedule(12, 0, UAIState_StandAround(), n"FP_SC_CALL_SLEEPER_LEFT");
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_AfterInvocation : UDailyRoutine_SC_GUR_CorKalom_1201_Ownership
{
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_SC_YEBERION_CHAMBER3");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_Preach : UDailyRoutine_SC_GUR_CorKalom_1201_Ownership
{
    default Schedule(12, 0, UAIState_Preach(), n"FP_SC_YEBERION_CHAMBER3");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_Discussion : UDailyRoutine_SC_GUR_CorKalom_1201_Ownership
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_SC_STAND_KALOM");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_PreparePotionsForOneHour : UDailyRoutine_SC_GUR_CorKalom_1201_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(20);
    default AutoSwitchToRoutine = UDailyRoutine_SC_GUR_CorKalom_1201_Callsleeper;

    default Schedule(8, 0, UAIState_PotionAlchemy(), n"IO_SC_POTION_ALCHEMY_02");
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Pray(), n"FP_OG_PRAY_01",500);
    default Schedule(12, 0, UAIState_Meditate(), n"FP_OG_PRAY_01",500);
    default Schedule(14, 0, UAIState_PotionAlchemy(), n"IO_OG_ALCHEMYTABLE_01",500);
    default Schedule(18, 0, UAIState_Pray(), n"FP_OG_PRAY_01",500);
    default Schedule(21, 0, UAIState_Meditate(), n"FP_OG_PRAY_01",500);
    default Schedule(1, 0, UAIState_PotionAlchemy(), n"IO_OG_ALCHEMYTABLE_01",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_CorKalom_1201_Dead : UAIState_DailyRoutine_Human
{
}
