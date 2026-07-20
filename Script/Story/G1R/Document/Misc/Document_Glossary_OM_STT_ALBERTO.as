#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_STT_ALBERTO_Introduction_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_ALBERTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_162112"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_ALBERTO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_ALBERTO;
            default AutoEvaluateUnlockFor.Add(n"OM_STT_ALBERTO_300");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_STT_ALBERTO_300") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_STT_ALBERTO_300").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_162212"));
            }
        }
        
        
        class UDocument_Glossary_OM_STT_ALBERTO : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_STT_ALBERTO_300");
            default Metadata.Add(n"GlossaryForCharacter", "OM_STT_ALBERTO_300");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Alberto_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Alberto_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_STT_ALBERTO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_STT_ALBERTO;
        }
    }
}
#endif /* WITH_STORY_G1R */