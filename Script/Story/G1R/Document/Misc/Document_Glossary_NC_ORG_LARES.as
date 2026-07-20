#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_LARES_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_LARES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_114900"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_LARES_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_LARES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_115255"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_LARES_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_LARES;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_LARES_801");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_LARES_801") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_LARES_801").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HWVXGON_20260609_093202"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_LARES : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_LARES_801");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_LARES_801");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lares_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lares_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_LARES : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_LARES;
        }
    }
}
#endif /* WITH_STORY_G1R */