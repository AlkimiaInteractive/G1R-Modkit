#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_151506"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_151723"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_HateRiceLord : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_101937"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_152715"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_Reason : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_150436"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_Learning : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_153312"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HORATIO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HORATIO;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_HORATIO_901");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_HORATIO_901") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_HORATIO_901").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_152814"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_HORATIO : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_HORATIO_901");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_HORATIO_901");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Horatio_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Horatio_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_HORATIO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_HORATIO;
        }
    }
}
#endif /* WITH_STORY_G1R */