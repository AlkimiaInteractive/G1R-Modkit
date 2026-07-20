#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_JEREMIAH_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_JEREMIAH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_092711"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_JEREMIAH_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_JEREMIAH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QZIQTLI_20260429_145638"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_JEREMIAH_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_JEREMIAH;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_JEREMIAH_912");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_JEREMIAH_912") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_JEREMIAH_912").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_104533"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_JEREMIAH : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_JEREMIAH_912");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_JEREMIAH_912");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jeremiah_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jeremiah_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_JEREMIAH : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_JEREMIAH;
        }
    }
}
#endif /* WITH_STORY_G1R */