#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_TPL_GORNABAR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_TPL_GORNABAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_115046"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_TPL_GORNABAR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_TPL_GORNABAR;
            default AutoEvaluateUnlockFor.Add(n"OM_TPL_GORNABAR_1400");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_TPL_GORNABAR_1400") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_TPL_GORNABAR_1400").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_115353"));
            }
        }
        
        
        class UDocument_Glossary_OM_TPL_GORNABAR : UGlossarySwampCampDocument
        {
            default Title = LocText("OM_TPL_GORNABAR_1400");
            default Metadata.Add(n"GlossaryForCharacter", "OM_TPL_GORNABAR_1400");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNabar_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNabar_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_TPL_GORNABAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_TPL_GORNABAR;
        }
    }
}
#endif /* WITH_STORY_G1R */