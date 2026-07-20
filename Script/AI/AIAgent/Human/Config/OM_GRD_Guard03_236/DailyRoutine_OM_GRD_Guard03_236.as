UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard03_236 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard03_236::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard03_236_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_11");
    default Schedule(6, 0, UAIState_Guard(), n"FP_OM_GUARD_11");
}