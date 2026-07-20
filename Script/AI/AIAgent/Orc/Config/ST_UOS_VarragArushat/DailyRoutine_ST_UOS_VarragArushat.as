UCLASS()
class UAIAgentConfig_Orc_ST_UOS_VarragArushat : UAIAgentConfig_UndeadOrc_Shaman
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_ST_UOS_VarragArushat;
    //default m_NavigationConfig = UAIAgentConfig_Navigation_Orc_SleeperBossArena;
}

UCLASS()
class UGameplayAbility_CharacterAI_Orc_ST_UOS_VarragArushat : UGameplayAbility_CharacterAI_Orc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Arushat);
    default EngageConflictDistance = 50000;
}