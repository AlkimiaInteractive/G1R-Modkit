#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_GRD_ULBERT_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_ULBERT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_093058"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_ULBERT_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_ULBERT;
            default AutoEvaluateUnlockFor.Add(n"OM_GRD_ULBERT_271");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_GRD_ULBERT_271") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_GRD_ULBERT_271").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_095517"));
            }
        }
        
        
        class UDocument_Glossary_OM_GRD_ULBERT : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_GRD_ULBERT_271");
            default Metadata.Add(n"GlossaryForCharacter", "OM_GRD_ULBERT_271");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ulbert_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ulbert_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_GRD_ULBERT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_GRD_ULBERT;
        }
    }
}
#endif /* WITH_STORY_G1R */