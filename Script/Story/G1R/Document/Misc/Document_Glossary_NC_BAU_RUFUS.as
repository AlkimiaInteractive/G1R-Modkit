#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_RUFUS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RUFUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_113018"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_RUFUS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RUFUS;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_RUFUS_903");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_RUFUS_903") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_RUFUS_903").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_115832"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_RUFUS : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_RUFUS_903");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_RUFUS_903");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Rufus_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Rufus_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_RUFUS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_RUFUS;
        }
    }
}
#endif /* WITH_STORY_G1R */