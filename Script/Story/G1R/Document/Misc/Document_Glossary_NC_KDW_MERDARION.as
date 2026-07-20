#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_KDW_MERDARION_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_MERDARION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_145906"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_MERDARION_Teach : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_MERDARION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_150137"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_MERDARION_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_MERDARION;
            default AutoEvaluateUnlockFor.Add(n"NC_KDW_MERDARION_602");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_KDW_MERDARION_602") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_KDW_MERDARION_602").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_150530"));
            }
        }
        
        
        class UDocument_Glossary_NC_KDW_MERDARION : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_KDW_MERDARION_602");
            default Metadata.Add(n"GlossaryForCharacter", "NC_KDW_MERDARION_602");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Merdarion_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Merdarion_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_KDW_MERDARION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_KDW_MERDARION;
        }
    }
}
#endif /* WITH_STORY_G1R */