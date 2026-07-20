#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_WSC_NATALIA_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_WSC_NATALIA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FJEGGUI_20260327_174612"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_WSC_NATALIA_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_WSC_NATALIA;
            default AutoEvaluateUnlockFor.Add(n"SC_WSC_NATALIA_1207");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_WSC_NATALIA_1207") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_WSC_NATALIA_1207").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FJEGGUI_20260327_174755"));
            }
        }
        
        
        class UDocument_Glossary_SC_WSC_NATALIA : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_WSC_NATALIA_1207");
            default Metadata.Add(n"GlossaryForCharacter", "SC_WSC_NATALIA_1207");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Natalia_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Natalia_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_WSC_NATALIA : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_WSC_NATALIA;
        }
    }
}
#endif /* WITH_STORY_G1R */