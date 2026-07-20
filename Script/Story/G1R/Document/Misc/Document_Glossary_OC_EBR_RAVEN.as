#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_EBR_RAVEN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_RAVEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_113146"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_RAVEN_Boss : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_RAVEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_100003"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_RAVEN_SwampCamp : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_RAVEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_140621"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_RAVEN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_RAVEN;
            default AutoEvaluateUnlockFor.Add(n"OC_EBR_RAVEN_105");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_EBR_RAVEN_105") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_EBR_RAVEN_105").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HWVXGON_20260609_111134"));
            }
        }
        
        
        class UDocument_Glossary_OC_EBR_RAVEN : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_EBR_RAVEN_105");
            default Metadata.Add(n"GlossaryForCharacter", "OC_EBR_RAVEN_105");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Raven_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Raven_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_EBR_RAVEN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_EBR_RAVEN;
        }
    }
}
#endif /* WITH_STORY_G1R */