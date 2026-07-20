UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger10_510 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger10_510::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger10_510_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_20);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER510");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER510");

    default Schedule(7, 15, UAIState_Eat(), n"IO_OC_CHAIR_BOX_03_DIGGER510");
    default Schedule(8, 15, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_EAT_05");
    default Schedule(14, 0, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default Schedule(16, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_41");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(8, 15, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default ScheduleIfRaining(13, 0, UAIState_Eat(), n"FP_OC_EAT_05");
    default ScheduleIfRaining(14, 0, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default ScheduleIfRaining(16, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_02");
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger10_510_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_05", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger10_510_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_05", 200);
}