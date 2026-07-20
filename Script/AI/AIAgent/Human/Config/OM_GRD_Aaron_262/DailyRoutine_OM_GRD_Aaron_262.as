UCLASS()
class UAIAgentConfig_Human_OM_GRD_Aaron_262 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Aaron_262::StaticClass();

}

UCLASS()
class UDailyRoutine_OM_GRD_Aaron_262_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_04");
    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_GUARD_04");
}

UCLASS()
class UDailyRoutine_OM_GRD_Aaron_262_Trick : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_TRICK_AARON");
    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_TRICK_AARON");
}

UCLASS()
class UDailyRoutine_OM_GRD_Aaron_262_Collapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_01");
    default Schedule(18, 0, UAIState_CheckBody(), n"FP_OM_FL_CHECKBODY_01");
    default Schedule(22, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_01");
    default Schedule(0, 0, UAIState_SleepStanding(), n"FP_OM_FL_GUARD_01");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OM_GRD_Aaron_262_AfterCollapsed : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(8, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_51");
    default Schedule(23, 0, UAIState_SleepStanding(), n"FP_OC_GUARDPASSAGE_51");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}