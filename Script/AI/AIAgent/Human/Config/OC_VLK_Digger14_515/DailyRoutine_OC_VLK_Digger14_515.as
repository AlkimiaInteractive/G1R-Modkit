UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger14_515 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger14_515::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger14_515_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_15);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER515");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER515");

     default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
     default Schedule(6, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_37", 1500.0f);
    default Schedule(7, 0, UAIState_LeanWall(), n"FP_OC_STANDAROUND_17", 700.0f);
     default Schedule(14, 30, UAIState_PlayDarts(), n"FP_OC_PLAYDARTS_2");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_05", 5000.0f);

}

UCLASS()
class UDailyRoutine_OC_VLK_Digger14_515_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_07", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger14_515_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_07", 200);
}