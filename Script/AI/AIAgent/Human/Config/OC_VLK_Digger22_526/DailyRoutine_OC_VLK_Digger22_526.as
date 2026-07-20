UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger22_526 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger22_526::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger22_526_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_46);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER526");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER526");

    default Schedule(6, 30, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_03", n"FP_OC_LeaveFoodBag_01"), NAME_None);
    default Schedule(12, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_23",600);
    default Schedule(14, 0, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_03", n"FP_OC_LeaveFoodBag_01"), NAME_None);
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger22_526_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_11", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger22_526_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_11", 200);
}