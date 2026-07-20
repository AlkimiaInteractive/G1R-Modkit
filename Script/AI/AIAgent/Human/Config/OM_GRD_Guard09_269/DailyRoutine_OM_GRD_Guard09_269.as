UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard09_269 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard09_269::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard09_269_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_03");
    default Schedule(9, 0, UAIState_CheckGoods_TakeNotes(), n"FP_OM_GUARD_03",3000);
    default Schedule(11, 0, UAIState_Guard(), n"FP_OM_GUARD_03");
    default Schedule(20, 0, UAIState_CheckGoods_TakeNotes(), n"FP_OM_GUARD_03",3000);
    default Schedule(22, 0, UAIState_Drink(), n"IO_OM_CHAIR_BENCH_08");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard09_269_Collapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(8, 30, UAIState_Guard(), n"FP_OM_FL_GUARD_04");
    default Schedule(22, 20, UAIState_SleepStanding(), n"FP_OM_FL_GUARD_04");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}