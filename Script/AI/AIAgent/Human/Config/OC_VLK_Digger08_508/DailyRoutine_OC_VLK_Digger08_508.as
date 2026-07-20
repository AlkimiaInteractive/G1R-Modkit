UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger08_508 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger08_508::StaticClass();

}

 

UCLASS()
class UDailyRoutine_OC_VLK_Digger08_508_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_27);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER508");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER508");

    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_44");
    default Schedule(11, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_26");
    default Schedule(13, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_29",200);
    default Schedule(14, 30, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_26");
    default Schedule(18, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_33");
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_44");
    default ScheduleIfRaining(11, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger08_508_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_04", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger08_508_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_04", 200);
}