UCLASS()
class UAIAgentConfig_Human_OM_GRD_Brandick_261 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Brandick_261::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_GRD_Brandick_261_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM_Diggers); 
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_15");
    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_GUARD_15");
}


UCLASS()
class UDailyRoutine_OM_GRD_Brandick_261_Watch : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM_Diggers); 
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_15");
    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_GUARD_15");
}