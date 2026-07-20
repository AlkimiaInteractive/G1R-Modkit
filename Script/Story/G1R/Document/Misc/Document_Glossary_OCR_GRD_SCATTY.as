#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OCR_GRD_SCATTY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_SCATTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_115210"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_SCATTY_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_SCATTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_125119"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_SCATTY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_SCATTY;
            default AutoEvaluateUnlockFor.Add(n"OCR_GRD_SCATTY_210");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OCR_GRD_SCATTY_210") != nullptr && AGothicCharacterState::FindByUniqueName(n"OCR_GRD_SCATTY_210").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_161908"));
            }
        }
        
        
        class UDocument_Glossary_OCR_GRD_SCATTY : UGlossaryOldCampDocument
        {
            default Title = LocText("OCR_GRD_SCATTY_210");
            default Metadata.Add(n"GlossaryForCharacter", "OCR_GRD_SCATTY_210");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Scatty_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Scatty_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OCR_GRD_SCATTY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OCR_GRD_SCATTY;
        }
    }
}
#endif /* WITH_STORY_G1R */