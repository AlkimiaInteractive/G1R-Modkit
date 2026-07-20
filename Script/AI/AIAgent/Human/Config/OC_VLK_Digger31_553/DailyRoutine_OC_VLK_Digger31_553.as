UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger31_553 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger31_553::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger31_553_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_32);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER553");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER553");

    default Schedule(6, 45, UAIState_Eat(), n"IO_OC_CHAIR_40");
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_39",1500);
    default Schedule(11, 0, UAIState_Eat(), n"IO_OC_CHAIR_40");
    default Schedule(13, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_05",200);
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_40");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 45, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
