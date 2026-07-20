UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger40_576 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger40_576::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger40_576_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_24);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER576");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER576");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 30, UAIState_Pee(), n"FP_OC_PEE_02");
    default Schedule(9, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_49",1000.0f);
    default Schedule(13, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_02");
    default Schedule(14, 0, UAIState_WashSelf(), n"FP_OC_WASHSELF_04");
    default Schedule(14, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_49",1000.0f);
    default Schedule(22, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_34");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(13, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_02");
    default ScheduleIfRaining(14, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_10",500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger40_576_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_19", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger40_576_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_19", 200);
}