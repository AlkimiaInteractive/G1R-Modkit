UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger35_557 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger35_557::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger35_557_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_52);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER557");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER557");

    default Schedule(6, 30, UAIState_WashSelf(), n"FP_OC_WASHSELF_06");
    default Schedule(7, 6, UAIState_Eat(), n"FP_OC_CAMPFIRE_09");
    default Schedule(8, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_CAULDRON_01");
    default Schedule(23, 15, UAIState_Sleep(), Location::Bed, WaypointRadius = 50);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 15, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger35_557_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_16", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger35_557_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_16", 200);
}