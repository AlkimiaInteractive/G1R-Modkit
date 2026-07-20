#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OCR_GRD_SKIP_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_SKIP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_110638"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_SKIP_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_SKIP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_110829"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_SKIP_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_SKIP;
            default AutoEvaluateUnlockFor.Add(n"OCR_GRD_SKIP_211");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OCR_GRD_SKIP_211") != nullptr && AGothicCharacterState::FindByUniqueName(n"OCR_GRD_SKIP_211").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_111055"));
            }
        }
        
        
        class UDocument_Glossary_OCR_GRD_SKIP : UGlossaryOldCampDocument
        {
            default Title = LocText("OCR_GRD_SKIP_211");
            default Metadata.Add(n"GlossaryForCharacter", "OCR_GRD_SKIP_211");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Skip_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Skip_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OCR_GRD_SKIP : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OCR_GRD_SKIP;
        }
    }
}
#endif /* WITH_STORY_G1R */