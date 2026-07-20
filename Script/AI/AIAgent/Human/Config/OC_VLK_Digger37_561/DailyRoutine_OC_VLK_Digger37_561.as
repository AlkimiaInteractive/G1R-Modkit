UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger37_561 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger37_561::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger37_561_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_21);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER561");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER561");

    default Schedule(7, 15, UAIState_Eat(), n"FP_OC_EAT_06");
    default Schedule(8, 15, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_EAT_05");
    default Schedule(14, 0, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default Schedule(16, 0, UAIState_CarryWood(n"FP_OC_TakeWood_02", n"FP_OC_LeaveWood_02"), NAME_None);
    default Schedule(18, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_40");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_165",500);
    default ScheduleIfRaining(8, 15, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default ScheduleIfRaining(13, 0, UAIState_Eat(), n"FP_OC_EAT_05");
    default ScheduleIfRaining(14, 0, UAIState_CutWood_Tree(), n"FP_OC_CUTWOOD_02");
    default ScheduleIfRaining(16, 0, UAIState_CarryWood(n"FP_OC_TakeWood_02", n"FP_OC_LeaveWood_02"), NAME_None);
    default ScheduleIfRaining(18, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_44");
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
