#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_BUTCH_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_BUTCH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_112052"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_BUTCH_Avoid : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_BUTCH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_105902"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_BUTCH_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_BUTCH;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_BUTCH_851");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_BUTCH_851") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_BUTCH_851").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_112155"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_BUTCH : UGlossaryNewCampDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Butch_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Butch_S");
            default Title = LocText("NC_ORG_BUTCH_851");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_BUTCH_851");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_BUTCH : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_BUTCH;
        }
    }
}
#endif /* WITH_STORY_G1R */