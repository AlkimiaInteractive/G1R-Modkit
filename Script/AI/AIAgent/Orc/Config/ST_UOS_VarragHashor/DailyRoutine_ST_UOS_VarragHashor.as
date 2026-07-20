UCLASS()
class UAIAgentConfig_Orc_ST_UOS_VarragHashor : UAIAgentConfig_UndeadOrc_Shaman
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_ST_UOS_VarragHashor;
}

UCLASS()
class UGameplayAbility_CharacterAI_Orc_ST_UOS_VarragHashor : UGameplayAbility_CharacterAI_Orc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Hashor);
    default EngageConflictDistance = 50000;
}