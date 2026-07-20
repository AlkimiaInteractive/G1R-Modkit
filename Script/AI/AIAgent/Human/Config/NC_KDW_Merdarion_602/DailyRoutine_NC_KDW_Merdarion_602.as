UCLASS()
class UAIAgentConfig_Human_NC_KDW_Merdarion_602: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_KDW_Merdarion_602::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_KDW_Merdarion_602_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Rooms_Merdarion);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERDARION");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERDARION");
}


UCLASS()
class UDailyRoutine_NC_KDW_Merdarion_602_Start : UDailyRoutine_NC_KDW_Merdarion_602_Ownership
{
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(9, 15, UAIState_ReadBook_Seated(), n"IO_NC_CHAIR_53");
    default Schedule(10, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_02");
    default Schedule(12, 14, UAIState_Cook(), n"IO_NC_CAMPFIRE_CAULDRON_02");
    default Schedule(13, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(15, 45, UAIState_ReadBook_Seated(), n"IO_NC_CHAIR_53");
    default Schedule(18, 15, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_02",2000);
    default Schedule(22, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_KDW_Merdarion_602_TalkMiltenAway : UDailyRoutine_NC_KDW_Merdarion_602_Ownership
{

    default Schedule(8, 0, UAIState_Cook(), n"IO_NC_CHAIR_52");
}

