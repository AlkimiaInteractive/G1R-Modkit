UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger19_521 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger19_521::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger19_521_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_68);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER521");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER521");

    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_29");
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_57",400);
    default Schedule(11, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_19");
    default Schedule(13, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_57",400);
    default Schedule(16, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_29");
    default Schedule(18, 0, UAIState_TuneInstrument(), n"IO_OC_CHAIR_BENCH_17",200);
    default Schedule(19, 0, UAIState_Digger19PlayLute(), n"FP_OC_STANDAROUND_29", 100);
    default Schedule(23, 15, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleRemoveAllForEvent(UAIWorldEvent_Explicit_Digger19PlayLute::StaticClass());
}


