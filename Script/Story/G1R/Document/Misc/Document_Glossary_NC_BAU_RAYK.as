#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_RAYK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RAYK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_110421"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_RAYK_Useful : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RAYK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_112119"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_RAYK_Backstory : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RAYK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FEKGWP_20251028_222532"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_RAYK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RAYK;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_RAYK_941");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_RAYK_941") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_RAYK_941").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_111837"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_RAYK : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_RAYK_941");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_RAYK_941");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Rayk_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Rayk_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_RAYK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_RAYK;
        }
    }
}
#endif /* WITH_STORY_G1R */