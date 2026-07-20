#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_ULMAR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_ULMAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_105241"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_ULMAR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_ULMAR;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_ULMAR_881N");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_ULMAR_881N") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_ULMAR_881N").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_105423"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_ULMAR : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_ULMAR_881N");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_ULMAR_881N");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ulmar_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ulmar_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_ULMAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_ULMAR;
        }
    }
}
#endif /* WITH_STORY_G1R */