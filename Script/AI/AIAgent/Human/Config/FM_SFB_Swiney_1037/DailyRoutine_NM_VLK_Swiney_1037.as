UCLASS()
class UAIAgentConfig_Human_FM_SFB_Swiney_1037 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SFB_Swiney_1037::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SFB_Swiney_1037_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Exterior_Huts_09);
    default KnownPlaces.Add(Location::Bed, n"IO_FM_BED_SWINEY");
    default KnownPlaces.Add(Location::Home, n"IO_FM_BED_SWINEY");

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_FM_CHAIR_10");
    default Schedule(9, 0, UAIState_Smoke(), n"IO_FM_CHAIR_10");
    default Schedule(11, 0, UAIState_Cook(), n"IO_FME_Swiney_Cauldron_01");
    default Schedule(12, 56, UAIState_Eat(), n"IO_FM_CHAIR_10");
    default Schedule(13, 56, UAIState_StandAround(), n"FP_FM_SMOKE_03");
    default Schedule(19, 40, UAIState_Cook(), n"IO_FME_Swiney_Cauldron_01");
    default Schedule(21, 30, UAIState_Smoke(), n"FP_FM_SMOKE_03");
    default Schedule(22, 30, UAIState_Eat(), n"IO_FM_CHAIR_10");
}