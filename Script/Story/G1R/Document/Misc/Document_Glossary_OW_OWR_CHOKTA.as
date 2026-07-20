#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OWR_CHOKTA_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_CHOKTA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_125010"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_CHOKTA_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_CHOKTA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_125735"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_CHOKTA_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_CHOKTA;
            default AutoEvaluateUnlockFor.Add(n"OW_OWR_CHOKTA_2407");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OWR_CHOKTA_2407") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OWR_CHOKTA_2407").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_131249"));
            }
        }
        
        
        class UDocument_Glossary_OW_OWR_CHOKTA : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OWR_CHOKTA_2407");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OWR_CHOKTA_2407");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Chokta_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Chokta_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OWR_CHOKTA : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OWR_CHOKTA;
        }
    }
}
#endif /* WITH_STORY_G1R */