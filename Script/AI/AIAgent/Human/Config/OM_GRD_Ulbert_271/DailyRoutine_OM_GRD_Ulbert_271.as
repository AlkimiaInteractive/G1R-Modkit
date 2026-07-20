UCLASS()
class UAIAgentConfig_Human_OM_GRD_Ulbert_271 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_GRD_Ulbert_271::StaticClass();

}

UCLASS()
class UDailyRoutine_OM_GRD_Ulbert_271_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldMine_Interior_GreatStope_Level_04_Ulbert);
}

UCLASS()
class UDailyRoutine_OM_GRD_Ulbert_271_Start : UDailyRoutine_OM_GRD_Ulbert_271_Ownership
{
    
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 
    
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_05");
}


UCLASS()
class UDailyRoutine_OM_GRD_Ulbert_271_Away : UDailyRoutine_OM_GRD_Ulbert_271_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Subordinate); 
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OM); 

    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_GUARD_28",300);
}