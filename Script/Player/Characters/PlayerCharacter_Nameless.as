
UCLASS()
class UG1RPlayer_Nameless : UG1RPlayer
{
    default m_UniqueName = n"Hero";
    default m_CharacterVisualsDefinition = UPlayerCharacterVisualsDefinition_Nameless::StaticClass();
    default m_VoiceLinesOf.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice01_Hero));
}

UCLASS()
class UPlayerCharacterVisualsDefinition_Nameless : UArmorVisualsDefinition
{
    // default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/TierC/Nyras/MO_Nyras_Demo.MO_Nyras_Demo'";
   
    UPROPERTY()
    FString Clothes = "RobeDark"; //"JudgeRobe"; //"RobeDarkArts";
}

UCLASS()
class UPlayerConfig_Nameless : UPlayerConfig_G1R
{
	default m_CharacterDefinition = UG1RPlayer_Nameless::StaticClass();
}