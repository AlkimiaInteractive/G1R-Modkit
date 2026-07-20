UCLASS()
class UAIAgentConfig_Human_SC_NOV_Shrat_1356 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Shrat_1356::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCampOutskirts_WildSwamp_ShratCamp_Hut);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_SHRAT");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_SHRAT");
}

UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_Start : UDailyRoutine_SC_NOV_Shrat_1356_Ownership
{
    default Schedule(8, 0, UAIState_SitCampfire(), n"IO_SC_BENCH_SHRAT_01");
    default Schedule(11, 0, UAIState_CutWood_Trunk(), n"IO_SC_WOOD_SHRAT_01");
    default Schedule(13, 0, UAIState_Eat(), n"IO_SC_BENCH_SHRAT_01");
    default Schedule(16, 0, UAIState_SitCampfire(), n"IO_SC_BENCH_SHRAT_01");
    default Schedule(18, 0, UAIState_Smoke(), n"FP_SC_SMOKE_SHRAT_01");
    default Schedule(21, 0, UAIState_Eat(), n"IO_SC_BENCH_SHRAT_01");
    default Schedule(23, 30, UAIState_Sleep(), n"IO_SC_BED_SHRAT");
}


UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_Follow : UDailyRoutine_SC_NOV_Shrat_1356_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(250), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideNC : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_NC_FOLLOWER_WAIT",100);
}

UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideOC : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_OC_FOLLOWER_WAIT",100);
}

UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideSC : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_SC_FOLLOWER_WAIT",100);
}

UCLASS()
class UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideKalom : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_SC_KALOM_FOLLOWER_WAIT",100);
}