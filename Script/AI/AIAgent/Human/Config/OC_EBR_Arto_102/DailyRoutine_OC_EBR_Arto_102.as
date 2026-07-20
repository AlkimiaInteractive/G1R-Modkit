UCLASS()
class UAIAgentConfig_Human_OC_EBR_Arto_102 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_EBR_Arto_102::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_EBR_Arto_102_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom_01);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_ARTO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_ARTO");
}

UCLASS()
class UDailyRoutine_OC_EBR_Arto_102_Start : UDailyRoutine_OC_EBR_Arto_102_Ownership
{
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 35, UAIState_Eat(), n"IO_OC_CHAIR_44", 400);
    default Schedule(8, 35, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_54",1000);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_44", 400);
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_54",1000);
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_44", 400);
    default Schedule(22, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_88",1000);

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_BartholoPlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent_Clap(), n"FP_OC_STANDAROUND_90",400);

}

UCLASS()
class UDailyRoutine_OC_EBR_Arto_102_Ot : UDailyRoutine_OC_EBR_Arto_102_Ownership
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_34",500);
}

