#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_NOV_BAALTARAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_NOV_BAALTARAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_120401"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_NOV_BAALTARAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_NOV_BAALTARAN;
            default AutoEvaluateUnlockFor.Add(n"OC_NOV_BAALTARAN_1331");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_NOV_BAALTARAN_1331") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_NOV_BAALTARAN_1331").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_122427"));
            }
        }
        
        
        class UDocument_Glossary_OC_NOV_BAALTARAN : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_NOV_BAALTARAN_1331");
            default Metadata.Add(n"GlossaryForCharacter", "OC_NOV_BAALTARAN_1331");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalTaran_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalTaran_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_NOV_BAALTARAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_NOV_BAALTARAN;
        }
    }
}
#endif /* WITH_STORY_G1R */