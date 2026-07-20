#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_NOV_BAALKAGAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALKAGAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_104443"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_NOV_BAALKAGAN_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALKAGAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_104957"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_NOV_BAALKAGAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALKAGAN;
            default AutoEvaluateUnlockFor.Add(n"NC_NOV_BAALKAGAN_1332");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_NOV_BAALKAGAN_1332") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_NOV_BAALKAGAN_1332").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_110907"));
            }
        }
        
        
        class UDocument_Glossary_NC_NOV_BAALKAGAN : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_NOV_BAALKAGAN_1332");
            default Metadata.Add(n"GlossaryForCharacter", "NC_NOV_BAALKAGAN_1332");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalKagan_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalKagan_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_NOV_BAALKAGAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_NOV_BAALKAGAN;
        }
    }
}
#endif /* WITH_STORY_G1R */