#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OWR_UMOSH_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_UMOSH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_150246"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_UMOSH_AccessDenied : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_UMOSH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_150941"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_UMOSH_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_UMOSH;
            default AutoEvaluateUnlockFor.Add(n"OW_OWR_UMOSH_2406");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OWR_UMOSH_2406") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OWR_UMOSH_2406").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_151054"));
            }
        }
        
        
        class UDocument_Glossary_OW_OWR_UMOSH : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OWR_UMOSH_2406");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OWR_UMOSH_2406");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Umosh_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Umosh_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OWR_UMOSH : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OWR_UMOSH;
        }
    }
}
#endif /* WITH_STORY_G1R */