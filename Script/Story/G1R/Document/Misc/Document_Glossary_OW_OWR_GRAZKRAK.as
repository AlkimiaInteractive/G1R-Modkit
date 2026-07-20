#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OWR_GRAZKRAK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_GRAZKRAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_131408"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_GRAZKRAK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_GRAZKRAK;
            default AutoEvaluateUnlockFor.Add(n"OW_OWR_GRAZKRAK_2400");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OWR_GRAZKRAK_2400") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OWR_GRAZKRAK_2400").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_131637"));
            }
        }
        
        
        class UDocument_Glossary_OW_OWR_GRAZKRAK : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OWR_GRAZKRAK_2400");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OWR_GRAZKRAK_2400");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Grazkrak_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Grazkrak_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OWR_GRAZKRAK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OWR_GRAZKRAK;
        }
    }
}
#endif /* WITH_STORY_G1R */