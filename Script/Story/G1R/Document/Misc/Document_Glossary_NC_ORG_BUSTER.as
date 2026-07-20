#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_BUSTER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_BUSTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_111329"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_BUSTER_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_BUSTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BPZWLS_20260326_142950"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_BUSTER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_BUSTER;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_BUSTER_833");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_BUSTER_833") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_BUSTER_833").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_111533"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_BUSTER : UGlossaryNewCampDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Buster_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Buster_S");
            default Title = LocText("NC_ORG_BUSTER_833");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_BUSTER_833");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_BUSTER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_BUSTER;
        }
    }
}
#endif /* WITH_STORY_G1R */