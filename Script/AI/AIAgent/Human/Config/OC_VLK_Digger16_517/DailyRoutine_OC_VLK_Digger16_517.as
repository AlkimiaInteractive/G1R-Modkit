UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger16_517 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger16_517::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger16_517_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_69);
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_57");
    default Schedule(11, 15, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_02", n"FP_OC_LeaveFoodBag_04"), NAME_None);
    default Schedule(13, 1, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_57");
    default Schedule(16, 0, UAIState_CarryFoodBags(n"FP_OC_TakeFoodBag_02", n"FP_OC_LeaveFoodBag_04"), NAME_None);
    default Schedule(21, 30, UAIState_Eat(), n"IO_OC_CHAIR_121", 200.0f);
    default Schedule(22, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_04", 1500.0f);
    default Schedule(23, 30, UAIState_Sleep(), n"IO_OC_BED_DIGGER517", WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger16_517_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_08", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger16_517_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_08", 200);
}