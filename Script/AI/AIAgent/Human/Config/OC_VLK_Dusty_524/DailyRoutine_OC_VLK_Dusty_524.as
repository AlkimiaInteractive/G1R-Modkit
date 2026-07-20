UCLASS()
class UAIAgentConfig_Human_OC_VLK_Dusty_524 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Dusty_524::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Dusty_524_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_38);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DUSTY");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DUSTY");
}

UCLASS()
class UDailyRoutine_OC_VLK_Dusty_524_Ownership_Swamp : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_24);
}

UCLASS()
class UDailyRoutine_OC_VLK_Dusty_524_Start : UDailyRoutine_OC_VLK_Dusty_524_Ownership
{
    default Schedule(7, 0, UAIState_SitAround(), n"IO_OC_CHAIR_50_DUSTY",200);
    default Schedule(11, 30, UAIState_Eat(), n"IO_OC_CHAIR_50_DUSTY",200);
    default Schedule(13, 0, UAIState_SitAround(), n"IO_OC_CHAIR_50_DUSTY",200);
    default Schedule(17, 30, UAIState_Drink(), n"IO_OC_CHAIR_50_DUSTY",200);
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Dusty_524_Follow : UDailyRoutine_OC_VLK_Dusty_524_Ownership_Swamp
{
    default bSimulateRoutineTasksFromStartTime = false;

    default Schedule(23, 0, UAIState_FollowHero(200), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_VLK_Dusty_524_Prepareritual : UDailyRoutine_OC_VLK_Dusty_524_Ownership_Swamp
{
    default Schedule(7, 45, UAIState_Listen(), n"FP_SC_MEDITATE_14");
    default Schedule(23, 0, UAIState_Sleep(), n"IO_SC_BED_DUSTY");
}

