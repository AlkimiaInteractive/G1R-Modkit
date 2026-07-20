UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger26_531 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger26_531::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger26_531_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_31);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER531");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER531");

    default Schedule(8, 0, UAIState_Eat(), n"IO_OC_CHAIR_39");
    default Schedule(9, 0, UAIState_PlayDarts(), n"FP_OC_PLAYDARTS",300);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_40");
    default Schedule(13, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_01",200);
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_40");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
