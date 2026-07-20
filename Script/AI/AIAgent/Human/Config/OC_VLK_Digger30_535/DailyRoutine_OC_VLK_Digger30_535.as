UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger30_535 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger30_535::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger30_535_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_76);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER535");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER535");

    default Schedule(6, 45, UAIState_SitAround(), n"FP_OC_CAMPFIRE_16", 300);
    default Schedule(8, 0, UAIState_LightFire(), n"FP_OC_CAMPFIRE_16", 300);
    default Schedule(11, 0, UAIState_WashSelf(), n"FP_OC_WASHSELF_02");
    default Schedule(11, 30, UAIState_SitAround(), n"FP_OC_CAMPFIRE_16", 300);
    default Schedule(12, 45, UAIState_Eat(), n"FP_OC_CAMPFIRE_16", 300);
    default Schedule(14, 15, UAIState_LightFire(), n"FP_OC_CAMPFIRE_16", 300);
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 45, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger30_535_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_14", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger30_535_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Chill(), n"FP_OC_INEXTREMO_14", 200);
}