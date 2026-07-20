#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_JAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_JAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_155201"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_JAN_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_JAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_160755"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_JAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_JAN;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_JAN_942");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_JAN_942") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_JAN_942").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_092534"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_JAN : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_JAN_942");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_JAN_942");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jan_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jan_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_JAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_JAN;
        }
    }
}
#endif /* WITH_STORY_G1R */