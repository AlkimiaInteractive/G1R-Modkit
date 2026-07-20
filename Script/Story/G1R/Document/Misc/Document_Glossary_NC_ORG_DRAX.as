#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_DRAX_Introduction_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_DRAX;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_114016"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_DRAX_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_DRAX;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_DRAX_819");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_DRAX_819") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_DRAX_819").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_114202"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_DRAX : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_DRAX_819");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_DRAX_819");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Drax_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Drax_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_DRAX : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_DRAX;
        }
    }
}
#endif /* WITH_STORY_G1R */