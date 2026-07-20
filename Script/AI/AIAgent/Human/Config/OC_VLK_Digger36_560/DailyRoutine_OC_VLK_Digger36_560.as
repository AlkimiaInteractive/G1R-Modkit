UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger36_560 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger36_560::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger36_560_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_11);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER560");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER560");

    default Schedule(7, 20, UAIState_WashSelf(), n"FP_OC_WASHSELF_05");
    default Schedule(8, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_34");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_34",1500.f);
    default Schedule(21, 0, UAIState_Drink(), n"FP_OC_STANDAROUND_34");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    //default Schedule(13, 0, UAIState_ServeFoodAndEat(), n"FP_OC_CALDRUON_LINE_1",1500.f);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger36_560_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_17", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger36_560_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Chill(), n"FP_OC_INEXTREMO_17", 200);
}