UCLASS()
class UAIAgentConfig_Human_OC_GRD_Kirgo_251 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Kirgo_251::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_63);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_KIRGO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_KIRGO");
}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_Start : UDailyRoutine_OC_GRD_Kirgo_251_Ownership
{
    default Schedule(7, 45, UAIState_Smith_Sharp(), n"IO_OC_SHARP_04",500);
    default Schedule(10, 0, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_04",500);
    default Schedule(14, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_03",500);
    default Schedule(15, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_04",500);
    default Schedule(17, 15, UAIState_SharpWeapon(), n"IO_OC_CHAIR_BENCH_21_SCATTY",300);
    default Schedule(23, 45, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    
    default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsGorHanis, 0, 0, 
        UAIState_TrainingFightWith_OCArena(
            UAIWorldEventTimed_ArenaFight_KirgoVsGorHanis,
            n"SC_TPL_GorHanis_1422",
            GameplayTag::Action_Ambient_Practice1HSword), 
        n"FP_OC_ARENAFIGHT_KirgoVsGorHanis_Kirgo", 200);

    default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsKharim, 0, 0, 
        UAIState_TrainingFightWith_OCArena(
            UAIWorldEventTimed_ArenaFight_KirgoVsKharim, 
            n"OC_SLD_Kharim_729",
            GameplayTag::Action_Ambient_Practice1HSword), 
        n"FP_OC_ARENAFIGHT_KirgoVsKharim_Kirgo", 200);

    // default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsMud, 0, 0, 
    //     UAIState_TrainingFightWith_OCArena(
    //         UAIWorldEventTimed_ArenaFight_KirgoVsMud, 
    //         n"OC_VLK_Mud_574", 
    //         GameplayTag::Action_Ambient_Practice1HSword), 
    //     n"FP_OC_ARENAFIGHT_KirgoVsMud_Kirgo", 200);
}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_Guide : UDailyRoutine_OC_GRD_Kirgo_251_Ownership
{
    default Schedule(7, 45, UAIState_StandAround(), n"FP_OC_FIGHTTRAINING_5",200);
}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_Wait : UDailyRoutine_OC_GRD_Kirgo_251_Ownership
{
    default Schedule(7, 45, UAIState_StandAround(), n"FP_OC_STANDAROUND_03",500);
    default Schedule(10, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_03",500);
    default Schedule(15, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_04",500);
    default Schedule(17, 15, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_21_SCATTY",500);
    default Schedule(23, 45, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_Shipment : UDailyRoutine_OC_GRD_Kirgo_251_Ownership
{
    default Schedule(17, 15, UAIState_Guard(), n"EZ_KIRGO_WAIT",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
    default RelationshipModifiersToApply.Add(URelationshipModifier_OC_Convoy_TowardsNewCamp);
}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_ArenaGreetings : UDailyRoutine_OC_GRD_Kirgo_251_Ownership
{
    default Schedule(19, 0, UAIState_ArenaGreetings(), n"FP_OC_ARENAFIGHT",200);
}

UCLASS()
class UDailyRoutine_OC_GRD_Kirgo_251_ArenaAfterFight : UDailyRoutine_OC_GRD_Kirgo_251_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(15);
    default AutoSwitchToRoutine = UDailyRoutine_OC_GRD_Kirgo_251_Start;

    default Schedule(19, 0, UAIState_ArenaGreetings(), n"FP_OC_ARENAFIGHT",200);
}