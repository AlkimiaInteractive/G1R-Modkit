#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_BLOODWYN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_090546"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Pay : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_BLOODWYN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_092556"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_BLOODWYN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_092655"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_AfterFireMages : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_BLOODWYN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_104659"));
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_105002"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_BLOODWYN;
            default AutoEvaluateUnlockFor.Add(n"OCR_GRD_BLOODWYN_233");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OCR_GRD_BLOODWYN_233") != nullptr && AGothicCharacterState::FindByUniqueName(n"OCR_GRD_BLOODWYN_233").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_110428"));
            }
        }
        
        
        class UDocument_Glossary_OCR_GRD_BLOODWYN : UGlossaryOldCampDocument
        {
            default Title = LocText("OCR_GRD_BLOODWYN_233");
            default Metadata.Add(n"GlossaryForCharacter", "OCR_GRD_BLOODWYN_233");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Bloodwyn_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Bloodwyn_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OCR_GRD_BLOODWYN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OCR_GRD_BLOODWYN;
        }
    }
}
#endif /* WITH_STORY_G1R */