#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_LEFTY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_LEFTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_120107"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_LEFTY_BullyAdvice : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_LEFTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_125517"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_LEFTY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_LEFTY;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_LEFTY_844");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_LEFTY_844") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_LEFTY_844").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_133459"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_LEFTY : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_LEFTY_844");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_LEFTY_844");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lefty_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lefty_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_LEFTY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_LEFTY;
        }
    }
}
#endif /* WITH_STORY_G1R */