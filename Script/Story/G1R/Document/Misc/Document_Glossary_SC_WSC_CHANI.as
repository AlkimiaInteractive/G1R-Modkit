#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_WSC_CHANI_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_WSC_CHANI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FJEGGUI_20260327_174154"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_WSC_CHANI_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_WSC_CHANI;
            default AutoEvaluateUnlockFor.Add(n"SC_WSC_CHANI_1205");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_WSC_CHANI_1205") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_WSC_CHANI_1205").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FJEGGUI_20260327_174418"));
            }
        }
        
        
        class UDocument_Glossary_SC_WSC_CHANI : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_WSC_CHANI_1205");
            default Metadata.Add(n"GlossaryForCharacter", "SC_WSC_CHANI_1205");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Chani_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Chani_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_WSC_CHANI : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_WSC_CHANI;
        }
    }
}
#endif /* WITH_STORY_G1R */