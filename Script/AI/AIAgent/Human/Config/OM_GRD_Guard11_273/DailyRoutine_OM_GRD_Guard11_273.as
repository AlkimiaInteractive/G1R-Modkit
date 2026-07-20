UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard11_273 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard11_273::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard11_273_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_19");
    default Schedule(6, 0, UAIState_Guard(), n"FP_OM_GUARD_19");
}