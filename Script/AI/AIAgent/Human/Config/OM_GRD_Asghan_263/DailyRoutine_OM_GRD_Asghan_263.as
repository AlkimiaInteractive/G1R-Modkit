UCLASS()
class UAIAgentConfig_Human_OM_GRD_Asghan_263 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Asghan_263::StaticClass();

}

UCLASS()
class UDailyRoutine_OM_GRD_Asghan_263_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Supervisor);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM);
    

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_25",500);
}

UCLASS()
class UDailyRoutine_OM_GRD_Asghan_263_AfterTalk : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Supervisor);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM);
    

    default Schedule(6, 0, UAIState_LeanWall(), n"FP_OM_GUARD_26",500);
}


UCLASS()
class UDailyRoutine_OM_GRD_Asghan_263_Opengate : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Supervisor);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM);
    

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_17",200);
    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_GUARD_17",200);
}