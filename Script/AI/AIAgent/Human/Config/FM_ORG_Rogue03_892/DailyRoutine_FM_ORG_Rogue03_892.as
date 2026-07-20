UCLASS()
class UAIAgentConfig_Human_FM_ORG_Rogue03_892 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_ORG_Rogue03_892::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_ORG_Rogue03_892_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Exterior_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_FM_BED_ROGUE892_CM");
    default KnownPlaces.Add(Location::Home, n"IO_FM_BED_ROGUE892_CM");

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Sit(), n"IO_FM_CHAIR_HAY_01");
    default Schedule(9, 0, UAIState_PlayKnife(), n"IO_FM_CHAIR_HAY_01");
    default Schedule(12, 56, UAIState_Sit(), n"IO_FM_CHAIR_HAY_01");
    default Schedule(13, 56, UAIState_Sit_PlayStone(), n"IO_FM_CHAIR_HAY_01");
    default Schedule(21, 30, UAIState_Sit(), n"IO_FM_CHAIR_HAY_01");
    default Schedule(22, 30, UAIState_PlayKnife(), n"IO_FM_CHAIR_HAY_01");

    default ScheduleIfRaining(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelterNoMouth(), n"FP_FM_RAINSHELTER_02");
}