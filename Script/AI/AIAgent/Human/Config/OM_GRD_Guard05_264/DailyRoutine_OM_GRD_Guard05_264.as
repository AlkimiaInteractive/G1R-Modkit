UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard05_264 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard05_264::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard05_264_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_02");
    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_GUARD_02");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard05_264_Collapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_03");
    default Schedule(22, 0, UAIState_SleepStanding(), n"FP_OM_FL_GUARD_03");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
