////////////////////////////////
//// Scripted Mad Cor Kalom ////
///////////////////////////////

////////////////////////////////
// Into Trance Mad Cor Kalom ///
///////////////////////////////
UCLASS()
class UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212_Into_Trance : UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212
{
    default m_AbilitiesEffect = UGE_Human_AI_MadCorKalom_Into_Trance::StaticClass();
    default m_UniqueName = n"ST_GUR_MadCorKalom_1212_Into_Trance";
}

UCLASS()
class UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212_Into_Trance: UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212_Into_Trance::StaticClass();

}

class USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212_Into_Trance : USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212
{

    default AIAgentConfigClass = UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212_Into_Trance::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}


////////////////////////////////
////  Trance Mad Cor Kalom /////
///////////////////////////////
UCLASS()
class UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212_Trance : UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212
{
    default m_AbilitiesEffect = UGE_Human_AI_MadCorKalom_Trance::StaticClass();
    default m_UniqueName = n"ST_GUR_MadCorKalom_1212_Trance";
}

UCLASS()
class UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212_Trance: UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212_Trance::StaticClass();

}


class USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212_Trance : USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212
{

    default AIAgentConfigClass = UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212_Trance::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}


////////////////////////////////
//  Trance End Mad Cor Kalom ///
///////////////////////////////
UCLASS()
class UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212_Trance_End : UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212
{
    default m_AbilitiesEffect = UGE_Human_AI_MadCorKalom_Trance_End::StaticClass();
    default m_UniqueName = n"ST_GUR_MadCorKalom_1212_Trance_End";
}

UCLASS()
class UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212_Trance_End: UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212_Trance_End::StaticClass();

}


class USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212_Trance_End : USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212
{

    default AIAgentConfigClass = UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212_Trance_End::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}
