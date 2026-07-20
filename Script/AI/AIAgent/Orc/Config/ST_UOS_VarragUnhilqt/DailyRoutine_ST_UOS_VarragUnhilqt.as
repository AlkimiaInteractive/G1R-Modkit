UCLASS()
class UAIAgentConfig_Orc_ST_UOS_VarragUnhilqt : UAIAgentConfig_UndeadOrc_Shaman
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_ST_UOS_VarragUnhilqt::StaticClass();
}

UCLASS()
class UGameplayAbility_CharacterAI_Orc_ST_UOS_VarragUnhilqt : UGameplayAbility_CharacterAI_Orc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Unhilqt::StaticClass());
    default EngageConflictDistance = 50000;
}