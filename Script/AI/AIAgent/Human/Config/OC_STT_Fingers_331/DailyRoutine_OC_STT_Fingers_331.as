UCLASS()
class UAIAgentConfig_Human_OC_STT_Fingers_331 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Fingers_331::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Fingers_331_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_59);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_FINGERS");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_FINGERS");

    default Schedule(7, 30, UAIState_Guard(), n"FP_OC_STANDAROUND_27", 100);
    default Schedule(8, 15, UAIState_Eat(), n"FP_OC_STANDAROUND_27", 100); 
    default Schedule(9, 15, UAIState_Guard(), n"FP_OC_STANDAROUND_27", 100);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_27", 100);
    default Schedule(14, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_27", 100);
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed);
}