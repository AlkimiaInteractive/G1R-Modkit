UCLASS()
class UAIAgentConfig_Human_NC_KDW_Riordian_605: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_KDW_Riordian_605::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_KDW_Riordian_605_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Rooms_Riordian);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_RIORDIAN");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_RIORDIAN");
}

UCLASS()
class UDailyRoutine_NC_KDW_Riordian_605_Start : UDailyRoutine_NC_KDW_Riordian_605_Ownership
{
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(9, 34, UAIState_PotionAlchemy(), n"IO_NC_POTION_ALCHEMY_03");
    default Schedule(12, 15, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_04",2000);
    default Schedule(13, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(15, 00, UAIState_PotionAlchemy(), n"IO_NC_POTION_ALCHEMY_03");
    default Schedule(21, 10, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_19");
    default Schedule(22, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_KDW_Riordian_605_Foundurshak : UDailyRoutine_NC_KDW_Riordian_605_Ownership
{
    default Schedule(5, 0, UAIState_StandAround(), n"FP_NC_RIORDIAN_WAIT_STORY", 200);
}

UCLASS()
class UDailyRoutine_NC_KDW_Riordian_605_TalkMiltenAway : UDailyRoutine_NC_KDW_Riordian_605_Ownership
{
    default Schedule(9, 34, UAIState_PotionAlchemy(), n"IO_NC_POTION_ALCHEMY_03");

}


