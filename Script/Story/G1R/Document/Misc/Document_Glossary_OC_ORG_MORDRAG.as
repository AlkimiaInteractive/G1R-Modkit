#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_122921"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_124519"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_Courier : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_124605"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_Guide : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_131730"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_NewCamp : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_131835"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_MordragKO : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_132038"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_ORG_MORDRAG_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_ORG_MORDRAG;
            default AutoEvaluateUnlockFor.Add(n"OC_ORG_MORDRAG_826");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_ORG_MORDRAG_826") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_ORG_MORDRAG_826").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_132101"));
            }
        }
        
        
        class UDocument_Glossary_OC_ORG_MORDRAG : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_ORG_MORDRAG_826");
            default Metadata.Add(n"GlossaryForCharacter", "OC_ORG_MORDRAG_826");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Mordrag_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Mordrag_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_ORG_MORDRAG : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_ORG_MORDRAG;
        }
    }
}
#endif /* WITH_STORY_G1R */