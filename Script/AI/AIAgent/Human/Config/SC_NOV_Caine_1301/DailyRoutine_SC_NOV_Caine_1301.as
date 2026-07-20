UCLASS()
class UAIAgentConfig_Human_SC_NOV_Caine_1301 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Caine_1301::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Caine_1301_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Caine);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_CAINE");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_CAINE");
}

UCLASS()
class UDailyRoutine_SC_NOV_Caine_1301_Start : UDailyRoutine_SC_NOV_Caine_1301_Ownership
{
    default Schedule(8, 0, UAIState_PotionAlchemyAndSmoke(n"FP_SC_SMOKE_03"), n"IO_SC_POTION_ALCHEMY_01");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_PotionAlchemyAndSmoke(n"FP_SC_SMOKE_09"), n"IO_SC_POTION_ALCHEMY_01");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Caine_1301_Dead : UAIState_DailyRoutine_Human
{
}