#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OWR_KRASHOK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_KRASHOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_131814"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_KRASHOK_Access : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_KRASHOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_134328"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_KRASHOK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_KRASHOK;
            default AutoEvaluateUnlockFor.Add(n"OW_OWR_KRASHOK_2405");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OWR_KRASHOK_2405") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OWR_KRASHOK_2405").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_141343"));
            }
        }
        
        
        class UDocument_Glossary_OW_OWR_KRASHOK : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OWR_KRASHOK_2405");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OWR_KRASHOK_2405");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Krashok_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Krashok_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OWR_KRASHOK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OWR_KRASHOK;
        }
    }
}
#endif /* WITH_STORY_G1R */