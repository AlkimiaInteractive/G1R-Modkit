UCLASS()
class UAIAgentConfig_Human_OC_STT_Dexter_329 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Dexter_329::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_STT_Dexter_329_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_70);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DEXTER");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DEXTER");
}

UCLASS()
class UDailyRoutine_OC_STT_Dexter_329_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_WashSelf(), n"FP_OC_WASHSELF_01");
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_49"); 
    default Schedule(7, 45, UAIState_CheckGoods_TakeNotes(), n"FP_OC_CHECKGOODS_3");
    //default Schedule(9, 15, UAIState_Eat(), n"FP_OC_STANDAROUND_49"); 
    //default Schedule(10, 15, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_17");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_49");
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_67");
    default Schedule(17, 0, UAIState_CheckGoods_TakeNotes(), n"FP_OC_CHECKGOODS_3");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Digger19PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_OC_STANDAROUND_49");
}

UCLASS()
class UDailyRoutine_OC_STT_Dexter_329_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_49"); 
    default Schedule(7, 45, UAIState_CheckGoods_TakeNotes(), n"FP_OC_CHECKGOODS_3");
    //default Schedule(9, 15, UAIState_Eat(), n"FP_OC_STANDAROUND_49"); 
    //default Schedule(10, 15, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_17");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_49");
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_67");
    default Schedule(17, 0, UAIState_CheckGoods_TakeNotes(), n"FP_OC_CHECKGOODS_3");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}