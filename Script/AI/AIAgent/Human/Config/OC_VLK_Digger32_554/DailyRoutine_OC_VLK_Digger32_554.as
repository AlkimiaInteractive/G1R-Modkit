UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger32_554 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger32_554::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger32_554_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_77);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER554");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER554");

    default Schedule(6, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_18");
    default Schedule(7, 45, UAIState_WashSelf(), n"FP_OC_WASHSELF_07");
    default Schedule(8, 30, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_04", n"FP_OC_LeaveFoodBag_02"), NAME_None);
    default Schedule(12, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_17");
    default Schedule(13, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_50"); 
    default Schedule(16, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_13");
    default Schedule(18, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_17");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(8, 30, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_13");
    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_132",500);
    default ScheduleIfRaining(16, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_13");
    default ScheduleIfRaining(18, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger32_554_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_15", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger32_554_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_15", 200);
}
