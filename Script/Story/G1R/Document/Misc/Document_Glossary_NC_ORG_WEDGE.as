#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_WEDGE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WEDGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_105645"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_WEDGE_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WEDGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_110527"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_WEDGE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WEDGE;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_WEDGE_850");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_WEDGE_850") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_WEDGE_850").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_110555"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_WEDGE : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_WEDGE_850");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_WEDGE_850");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Wedge_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Wedge_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_WEDGE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_WEDGE;
        }
    }
}
#endif /* WITH_STORY_G1R */