UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard14_281N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard14_281N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard14_281N_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    // default Schedule(0, 0, UAIState_Guard(), n"FP_OM_REST_02");
    // default Schedule(18, 12, UAIState_EscortOre(), NAME_None); 

    default Schedule(6, 0, UAIState_FollowCharacterAggressive(n"OM_VLK_Digger36_1051N", 300, 500), NAME_None);
    default Schedule(18, 0, UAIState_Rest(), n"FP_OM_REST_03");

    default ScheduleIfRaining(6, 0, UAIState_FollowCharacterAggressive(n"OM_VLK_Digger36_1051N", 300, 500), NAME_None);
    default ScheduleIfRaining(18, 0, UAIState_Rest(), n"FP_OM_REST_03");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard14_281N_SmallTalk : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_08");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard14_281N_Collapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(10, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_01");
    default Schedule(15, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_01");
    default Schedule(20, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_01");
    default Schedule(1, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_01");
    default Schedule(6, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_01");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UAIState_EscortOre : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.GuardPassage(n"FP_OC_GUARDPASSAGE_27", 200);

        while(!bShouldExitState)
        {
            AI.GuardPassage(n"FP_OM_REST_02", 200);

            ReportTimeSkipWhateverIsLeft();
            WaitOneTick();
        }
    }
}