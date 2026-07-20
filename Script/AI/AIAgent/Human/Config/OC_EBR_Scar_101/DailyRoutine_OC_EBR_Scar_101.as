UCLASS()
class UAIAgentConfig_Human_OC_EBR_Scar_101 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_EBR_Scar_101::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_EBR_Scar_101_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom_02);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SCAR");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SCAR");
}

UCLASS()
class UDailyRoutine_OC_EBR_Scar_101_Start : UDailyRoutine_OC_EBR_Scar_101_Ownership
{
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 35, UAIState_Eat(), n"IO_OC_CHAIR_49");
    default Schedule(8, 35, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_25",1000);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_49");
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_25",1000);
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_49");
    default Schedule(22, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_87",1000);

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_BartholoPlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent_Clap(), n"FP_OC_STANDAROUND_90",400);

}


UCLASS()
class UDailyRoutine_OC_EBR_Scar_101_Ot : UDailyRoutine_OC_EBR_Scar_101_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_36");
}
