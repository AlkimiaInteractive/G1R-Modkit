#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_SHARKY_Introduction_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SHARKY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_085138"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_SHARKY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SHARKY;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_SHARKY_843");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_SHARKY_843") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_SHARKY_843").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_090304"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_SHARKY : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_SHARKY_843");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_SHARKY_843");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Sharky_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Sharky_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_SHARKY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_SHARKY;
        }
    }
}
#endif /* WITH_STORY_G1R */