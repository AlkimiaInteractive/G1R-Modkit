#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_KIRGO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_KIRGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_142016"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_142747"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_KIRGO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_KIRGO;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_KIRGO_251");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_KIRGO_251") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_KIRGO_251").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162024"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_KIRGO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_KIRGO_251");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_KIRGO_251");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Kirgo_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Kirgo_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_KIRGO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_KIRGO;
        }
    }
}
#endif /* WITH_STORY_G1R */