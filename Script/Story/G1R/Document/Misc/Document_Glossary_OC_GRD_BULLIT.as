#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_BULLIT_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_BULLIT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_153901"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_BULLIT_Bully : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_BULLIT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_160905"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_BULLIT_Forgiven : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_BULLIT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_161353"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_BULLIT_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_BULLIT;
            default AutoEvaluateUnlockFor.Add(n"OCR_GRD_BULLIT_203");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OCR_GRD_BULLIT_203") != nullptr && AGothicCharacterState::FindByUniqueName(n"OCR_GRD_BULLIT_203").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_153925"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_BULLIT : UGlossaryOldCampDocument
        {
            default Title = LocText("OCR_GRD_BULLIT_203");
            default Metadata.Add(n"GlossaryForCharacter", "OCR_GRD_BULLIT_203");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Bullit_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Bullit_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_BULLIT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_BULLIT;
        }
    }
}
#endif /* WITH_STORY_G1R */