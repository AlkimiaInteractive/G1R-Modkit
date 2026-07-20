UCLASS()
class UAIAgentConfig_Human_NC_KDW_Saturas_600: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_KDW_Saturas_600::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_KDW_Saturas_600_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Rooms_Saturas);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_SATURAS");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_SATURAS");
}

UCLASS()
class UDailyRoutine_NC_KDW_Saturas_600_Start : UDailyRoutine_NC_KDW_Saturas_600_Ownership
{
    default Schedule(8, 20, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(9, 45, UAIState_Inscription(), n"IO_NC_INSCRIPTION_02");
    default Schedule(11, 25, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_05",2000);
    default Schedule(14, 20, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(15, 00, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_05",2000);
    default Schedule(19, 45, UAIState_Inscription(), n"IO_NC_INSCRIPTION_02");
    default Schedule(22, 50, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(23, 40, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_KDW_Saturas_600_NoSeated : UDailyRoutine_NC_KDW_Saturas_600_Ownership
{
    default Schedule(9, 45, UAIState_Inscription(), n"IO_NC_INSCRIPTION_02");
    default Schedule(11, 25, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_05",2000);
    default Schedule(15, 00, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_05",2000);
    default Schedule(19, 45, UAIState_Inscription(), n"IO_NC_INSCRIPTION_02");
    default Schedule(23, 40, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_KDW_Saturas_600_Ncreport : UDailyRoutine_NC_KDW_Saturas_600_Ownership
{
    default Schedule(23, 0, UAIState_Smalltalk(), n"FP_NC_CAVE_CENTER2");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_KDW_Saturas_600_OreMount : UDailyRoutine_NC_KDW_Saturas_600_Ownership
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_NC_OREMOUNT_SATURAS");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

