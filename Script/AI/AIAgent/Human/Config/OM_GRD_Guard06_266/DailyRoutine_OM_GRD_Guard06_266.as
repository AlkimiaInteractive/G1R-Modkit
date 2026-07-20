UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard06_266 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard06_266::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard06_266_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(8, 0, UAIState_LookAround(), n"FP_OM_GUARD_14",3000);
    default Schedule(20, 0, UAIState_LookAround(), n"FP_OM_GUARD_14",3000);
}