UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger24_528 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger24_528::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger24_528_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_51);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER528");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER528");
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger24_528_Start : UDailyRoutine_OC_VLK_Digger24_528_Ownership
{
    TArray<FName> actionPoints;
    default actionPoints.Add(n"OC_Patrol_LightTorches1");
    default actionPoints.Add(n"OC_Patrol_LightTorches2");
    default actionPoints.Add(n"OC_Patrol_LightTorches3");

    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_14");
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_13");
    // default Schedule(10, 0, UAIState_SitAround(), n"IO_OC_CHAIR_14");
    default Schedule(12, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_09");
    default Schedule(14, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_86");
    //default Schedule(18, 0, UAIState_LightTorch(actionPoints),NAME_None);
    default Schedule(19, 0, UAIState_Eat(), n"IO_OC_CHAIR_14");
    default Schedule(20, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_86");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 100);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 100);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger24_528_InExtremoWait : UDailyRoutine_OC_VLK_Digger24_528_Ownership
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_21", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger24_528_InExtremoConcert : UDailyRoutine_OC_VLK_Digger24_528_Ownership
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_21", 200);
}