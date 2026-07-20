UCLASS()
class UAIAgentConfig_Human_OM_GRD_Guard12_277 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Guard12_277::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Guard12_277_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Nameless); 

    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_22");
    default Schedule(6, 0, UAIState_Guard(), n"FP_OM_GUARD_22");
}