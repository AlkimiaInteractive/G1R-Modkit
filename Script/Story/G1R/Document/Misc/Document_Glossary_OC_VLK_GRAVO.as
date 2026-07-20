#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_GRAVO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRAVO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_143154"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GRAVO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRAVO;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_GRAVO_572");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_GRAVO_572") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_GRAVO_572").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093701"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_GRAVO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_GRAVO_572");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_GRAVO_572");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gravo_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gravo_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_GRAVO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_GRAVO;
        }
    }
}
#endif /* WITH_STORY_G1R */