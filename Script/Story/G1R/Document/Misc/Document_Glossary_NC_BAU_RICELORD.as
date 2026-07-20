#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_RICELORD_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RICELORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_100949"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_RICELORD_Respect : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RICELORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_105301"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_RICELORD_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_RICELORD;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_RICELORD_900");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_RICELORD_900") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_RICELORD_900").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_105411"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_RICELORD : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_RICELORD_900");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_RICELORD_900");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ricelord_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ricelord_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_RICELORD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_RICELORD;
        }
    }
}
#endif /* WITH_STORY_G1R */