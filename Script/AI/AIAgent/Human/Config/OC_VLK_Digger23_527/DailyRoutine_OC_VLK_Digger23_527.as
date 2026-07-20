UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger23_527 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger23_527::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger23_527_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_54);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER527");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER527");

    default Schedule(6, 30, UAIState_Pee(), n"FP_OC_PEE_12",500);
    default Schedule(6, 45, UAIState_WashSelf(), n"FP_OC_WASHSELF_05");
    default Schedule(8, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_21");
    default Schedule(9, 0, UAIState_RepairFloor(), n"FP_OC_BUILDSTAGE_01",2000);
    /*default Schedule(9, 0, UAIState_CutWood(), n"FP_OC_CUTWOOD_02");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_CUTWOOD_02");
    default Schedule(14, 0, UAIState_CutWood(), n"FP_OC_CUTWOOD_02");*/
    default Schedule(14, 0, UAIState_CarryWood(n"FP_OC_TakeWood_01", n"FP_OC_LeaveWood_01"), NAME_None);
    default Schedule(16, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_52");
    default Schedule(18, 30, UAIState_Campfire(), n"FP_OC_CAMPFIRE_11");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_54",500);
    default ScheduleIfRaining(18, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger23_527_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_12", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OC_VLK_Digger23_527_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_12", 200);
}