UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow09_322 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow09_322::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_STT_Shadow09_322_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_1);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW322");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW322");
}

UCLASS()
class UDailyRoutine_OC_STT_Shadow09_322_Start : UDailyRoutine_OC_STT_Shadow09_322_Ownership
{
    default Schedule(6, 45, UAIState_SitAround(), n"IO_OC_CHAIR_50");
    default Schedule(7, 45, UAIState_Eat(), n"IO_OC_CHAIR_50");
    default Schedule(11, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_61",500);
    default Schedule(15, 0, UAIState_SitAround(), n"IO_OC_CHAIR_50");
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_60",500);
    default Schedule(18, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_36");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 45, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    
}

UCLASS()
class UDailyRoutine_OC_STT_Shadow09_322_Omfull : UDailyRoutine_OC_STT_Shadow09_322_Ownership
{
    default Schedule(7, 0, UAIState_StandAround(), n"OCR_TO_MAINGATE");
    default Schedule(23, 0, UAIState_Sleep(), n"OCR_HUT_3");
}