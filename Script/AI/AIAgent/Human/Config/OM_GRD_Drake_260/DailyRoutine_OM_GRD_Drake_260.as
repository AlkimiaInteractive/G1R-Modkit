UCLASS()
class UAIAgentConfig_Human_OM_GRD_Drake_260: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Drake_260::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Drake_260_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_01",1000);
    default Schedule(8, 0, UAIState_Eat(), n"IO_OM_CHAIR_BENCH_07",1000);
    default Schedule(9, 0, UAIState_Guard(), n"FP_OM_GUARD_01",1000);
    default Schedule(23, 0, UAIState_Eat(), n"IO_OM_CHAIR_BENCH_07",1000);
}

UCLASS()
class UDailyRoutine_OM_GRD_Drake_260_Collapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_02",1000);
    default Schedule(11, 0, UAIState_CheckGoods(), n"FP_OM_FL_CHECKGOODS_01",1000);
    default Schedule(14, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_02",1000);
    default Schedule(17, 0, UAIState_CheckGoods(), n"FP_OM_FL_CHECKGOODS_01",1000);
    default Schedule(22, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_02",1000);
    default Schedule(23, 0, UAIState_SleepStanding(), n"FP_OM_FL_GUARD_02",1000);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(9, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_52");
    default Schedule(22, 0, UAIState_SleepStanding(), n"FP_OC_GUARDPASSAGE_52");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}