UCLASS()
class UAIAgentConfig_Human_OC_VLK_Guy_530 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Guy_530::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Guy_530_Ownership : UDailyRoutine_Digger
{
     default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_17);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUY");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUY");
}

UCLASS()
class UDailyRoutine_OC_VLK_Guy_530_Start : UDailyRoutine_OC_VLK_Guy_530_Ownership
{
   

    default Schedule(6, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_02",300.0f);
    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_50_GUY",800.0f);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_49",300.0f);
    default Schedule(14, 0, UAIState_Eat(), n"IO_OC_CHAIR_41",700.0f);
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_49",500.0f);
    default Schedule(17, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_02",300.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(14, 0, UAIState_Eat(), n"IO_OC_CHAIR_41",700.0f);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_02",3000.0f);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ArenaSpectatorSchedule(UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03");
}