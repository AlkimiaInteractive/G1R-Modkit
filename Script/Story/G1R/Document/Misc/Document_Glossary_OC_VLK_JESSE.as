#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_JESSE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_JESSE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_111421"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_JESSE_Warning : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_JESSE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_113831"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_JESSE_WarningTooLate : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_JESSE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_115700"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_JESSE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_JESSE;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_JESSE_564");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_JESSE_564") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_JESSE_564").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094016"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_JESSE : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_JESSE_564");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_JESSE_564");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jesse_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jesse_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_JESSE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_JESSE;
        }
    }
}
#endif /* WITH_STORY_G1R */