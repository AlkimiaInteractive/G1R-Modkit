#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_KDW_SATURAS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_SATURAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_155508"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_SATURAS_Teach : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_SATURAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_161000"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_SATURAS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_SATURAS;
            default AutoEvaluateUnlockFor.Add(n"NC_KDW_SATURAS_600");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_KDW_SATURAS_600") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_KDW_SATURAS_600").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_161130"));
            }
        }
        
        
        class UDocument_Glossary_NC_KDW_SATURAS : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_KDW_SATURAS_600");
            default Metadata.Add(n"GlossaryForCharacter", "NC_KDW_SATURAS_600");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Saturnas_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Saturnas_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_KDW_SATURAS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_KDW_SATURAS;
        }
    }
}
#endif /* WITH_STORY_G1R */