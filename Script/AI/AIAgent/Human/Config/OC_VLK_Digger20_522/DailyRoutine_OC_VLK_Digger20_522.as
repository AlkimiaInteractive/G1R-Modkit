UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger20_522 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger20_522::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger20_522_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_71);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER522");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER522");

    default Schedule(8, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_03");
    default Schedule(9, 0, UAIState_CarryBoxes(n"FP_OC_TakeBox_01", n"FP_OC_LeaveBox_01"), NAME_None,500);
    default Schedule(20, 45, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_13");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 50);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger20_522_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_10", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger20_522_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_10", 200);
}