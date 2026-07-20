UCLASS()
class UAIAgentConfig_Orc_ST_UOS_VarragKasorg : UAIAgentConfig_UndeadOrc_Shaman
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_ST_UOS_VarragKasorg::StaticClass();
}

UCLASS()
class UGameplayAbility_CharacterAI_Orc_ST_UOS_VarragKasorg : UGameplayAbility_CharacterAI_Orc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Kasorg::StaticClass());
    default EngageConflictDistance = 50000;
}