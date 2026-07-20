#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_NOV_BAALPARVEZ_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_NOV_BAALPARVEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_112536"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_NOV_BAALPARVEZ_Guide : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_NOV_BAALPARVEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_114330"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_NOV_BAALPARVEZ_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_NOV_BAALPARVEZ;
            default AutoEvaluateUnlockFor.Add(n"OC_NOV_BAALPARVEZ_1330");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_NOV_BAALPARVEZ_1330") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_NOV_BAALPARVEZ_1330").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_115801"));
            }
        }
        
        
        class UDocument_Glossary_OC_NOV_BAALPARVEZ : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_NOV_BAALPARVEZ_1330");
            default Metadata.Add(n"GlossaryForCharacter", "OC_NOV_BAALPARVEZ_1330");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalParvez_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalParvez_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_NOV_BAALPARVEZ : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_NOV_BAALPARVEZ;
        }
    }
}
#endif /* WITH_STORY_G1R */