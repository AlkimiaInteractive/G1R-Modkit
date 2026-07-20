UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow11_330 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow11_330::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_STT_Shadow11_330_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_65);

    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW330");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW330");
}

UCLASS()
class UDailyRoutine_OC_STT_Shadow11_330_Start : UDailyRoutine_OC_STT_Shadow11_330_Ownership
{
    default Schedule(7, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_65");
    default Schedule(11, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_08");
    default Schedule(13, 12, UAIState_SitAround(), n"FP_OC_STANDAROUND_65");
    default Schedule(22, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_69",500);
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500); 

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_106",500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}


UCLASS()
class UDailyRoutine_OC_STT_Shadow11_330_Prestart : UDailyRoutine_OC_STT_Shadow11_330_Ownership
{
    default Schedule(7, 30, UAIState_SitAround(), n"FP_OC_STANDAROUND_65");
    default Schedule(10, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_08");
    default Schedule(17, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_65");
    default Schedule(23, 0, UAIState_Sleep(), n"IO_OC_BED_SHADOW330", WaypointRadius = 500);
}
