#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_SNAF_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_SNAF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_153324"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_SNAF_DailyMeal : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_SNAF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_155811"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_SNAF_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_SNAF;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_SNAF_581");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_SNAF_581") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_SNAF_581").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094302"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_SNAF : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_SNAF_581");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_SNAF_581");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Snaf_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Snaf_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_SNAF : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_SNAF;
        }
    }
}
#endif /* WITH_STORY_G1R */