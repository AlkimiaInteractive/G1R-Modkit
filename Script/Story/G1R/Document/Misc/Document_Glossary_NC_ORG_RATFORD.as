#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_RATFORD_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_RATFORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_133602"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_RATFORD_Advice : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_RATFORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_134654"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_RATFORD_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_RATFORD;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_RATFORD_818");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_RATFORD_818") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_RATFORD_818").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_140317"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_RATFORD : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_RATFORD_818");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_RATFORD_818");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ratford_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ratford_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_RATFORD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_RATFORD;
        }
    }
}
#endif /* WITH_STORY_G1R */