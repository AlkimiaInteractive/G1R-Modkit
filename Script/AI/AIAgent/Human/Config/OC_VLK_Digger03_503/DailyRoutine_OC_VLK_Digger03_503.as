UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger03_503 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger03_503::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger03_503_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_35);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_27");
    default Schedule(7, 0, UAIState_PickOre(), n"FP_OC_PICKORE_1");
    default Schedule(10, 15, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03");
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_27");
    default Schedule(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03");
    default Schedule(16, 30, UAIState_PickOre(), n"FP_OC_PICKORE_1");
    default Schedule(21, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_27");
    default Schedule(22, 45, UAIState_Sleep(), n"IO_OC_BED_DIGGER503", WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_199");
    default ScheduleIfRaining(10, 15, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03", 200);
    default ScheduleIfRaining(13, 30, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_199");
    default ScheduleIfRaining(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03", 200);
    default ScheduleIfRaining(16, 30, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_199");
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), n"IO_OC_BED_DIGGER503", WaypointRadius = 500);
}