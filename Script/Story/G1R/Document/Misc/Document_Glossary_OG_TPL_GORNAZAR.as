#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OG_TPL_GORNAZAR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OG_TPL_GORNAZAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_105514"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OG_TPL_GORNAZAR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OG_TPL_GORNAZAR;
            default AutoEvaluateUnlockFor.Add(n"OG_TPL_GORNAZAR_1446");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OG_TPL_GORNAZAR_1446") != nullptr && AGothicCharacterState::FindByUniqueName(n"OG_TPL_GORNAZAR_1446").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_105531"));
            }
        }
        
        
        class UDocument_Glossary_OG_TPL_GORNAZAR : UGlossarySwampCampDocument
        {
            default Title = LocText("OG_TPL_GORNAZAR_1446");
            default Metadata.Add(n"GlossaryForCharacter", "OG_TPL_GORNAZAR_1446");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNazar_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNazar_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OG_TPL_GORNAZAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OG_TPL_GORNAZAR;
        }
    }
}
#endif /* WITH_STORY_G1R */