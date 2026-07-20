UCLASS()
class UAIAgentConfig_Human_NC_BAU_Homer_935 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Homer_935::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_BAU_Homer_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Homer);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_HOMER_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_HOMER_CM");
}

//WE MUST CHANGE PRESTART AND START

UCLASS()
class UDailyRoutine_NC_BAU_Homer_935_Start : UDailyRoutine_NC_BAU_Homer_Ownership
{
    default Schedule(13, 0, UAIState_CheckGoods(), n"FP_NC_GUARD_12");
    default Schedule(22, 2, UAIState_Sleep(), n"FP_NC_GUARD_42");
}


UCLASS()
class UDailyRoutine_NC_BAU_Homer_935_AfterLurker : UDailyRoutine_NC_BAU_Homer_Ownership
{
    default Schedule(8, 30, UAIState_SitAround(), n"FP_NC_CAMPFIRE_08");
    default Schedule(12, 30, UAIState_Drink(), n"IO_NC_CHAIR_27");
    default Schedule(14, 30, UAIState_RoastScavenger(), n"IO_NC_CAMPFIRE_ROTISSERIE_06");
    default Schedule(16, 30, UAIState_SitAround(), n"FP_NC_CAMPFIRE_08");
    default Schedule(20, 30, UAIState_Campfire(), n"FP_NC_CAMPFIRE_18");
    default Schedule(21, 30, UAIState_Sleep(), n"IO_NC_BED_HOMER_CM");
}


UCLASS()
class UDailyRoutine_NC_BAU_Homer_935_Damnpast : UDailyRoutine_NC_BAU_Homer_Ownership
{
    default Schedule(7, 30, UAIState_SitAround(), n"FP_NC_SITGROUND_HOMER");
    default Schedule(21, 30, UAIState_Sleep(), n"IO_NC_BED_HOMER_CM");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}