UCLASS()
class UAIAgentConfig_Human_OC_VLK_Graham_573 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Graham_573::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Graham_573_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_53);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GRAHAM");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GRAHAM");
}


UCLASS()
class UDailyRoutine_OC_VLK_Graham_573_Start : UDailyRoutine_OC_VLK_Graham_573_Ownership
{
    

    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_09",500.0f);
    default Schedule(7, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_52",2000);
    default Schedule(11, 0, UAIState_WashSelf(), n"FP_OC_WASHSELF_06",4000.0f);
    default Schedule(11, 30, UAIState_StandAround(), n"FP_OC_STANDAROUND_52");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_09",500.0f);
    default Schedule(14, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_52",2000);
    default Schedule(18, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_09");
    default Schedule(21, 0, UAIState_LeanBar(), n"FP_OC_WORKONMAPS",500.0f);
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Graham_573_InExtremoWait : UDailyRoutine_OC_VLK_Graham_573_Ownership
{
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_09",500.0f);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_09",500.0f);
    default Schedule(18, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_09");
    default Schedule(21, 0, UAIState_LeanBar(), n"FP_OC_WORKONMAPS",500.0f);
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
