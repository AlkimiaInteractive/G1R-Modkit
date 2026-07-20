#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_CUTTER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_CUTTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_161754"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_CUTTER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_CUTTER;
            default AutoEvaluateUnlockFor.Add(n"OCR_GRD_CUTTER_208");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OCR_GRD_CUTTER_208") != nullptr && AGothicCharacterState::FindByUniqueName(n"OCR_GRD_CUTTER_208").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_161857"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_CUTTER : UGlossaryOldCampDocument
        {
            default Title = LocText("OCR_GRD_CUTTER_208");
            default Metadata.Add(n"GlossaryForCharacter", "OCR_GRD_CUTTER_208");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cutter_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cutter_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_CUTTER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_CUTTER;
        }
    }
}
#endif /* WITH_STORY_G1R */