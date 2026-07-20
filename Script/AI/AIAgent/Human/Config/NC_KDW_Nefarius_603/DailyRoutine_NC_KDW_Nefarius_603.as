UCLASS()
class UAIAgentConfig_Human_NC_KDW_Nefarius_603: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_KDW_Nefarius_603::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_KDW_Nefarius_603_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Rooms_Nefarius);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_NEFARIUS");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_NEFARIUS");
}


UCLASS()
class UDailyRoutine_NC_KDW_Nefarius_603_Start : UDailyRoutine_NC_KDW_Nefarius_603_Ownership
{
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(9, 34, UAIState_PracticeMagic(), n"FP_NC_PRACTICEMAGIC_01");
    default Schedule(13, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(15, 0, UAIState_PracticeMagic(), n"FP_NC_PRACTICEMAGIC_01");
    default Schedule(18, 15, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_03",2000);
    default Schedule(21, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_01");
    default Schedule(22, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(23, 40, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_KDW_Nefarius_603_Ncreport : UDailyRoutine_NC_KDW_Nefarius_603_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_52");
}

