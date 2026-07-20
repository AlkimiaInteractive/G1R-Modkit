#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_TPL_GORNADRAK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNADRAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_171027"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNADRAK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNADRAK;
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_GORNADRAK_1439");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNADRAK_1439") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNADRAK_1439").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_172416"));
            }
        }
        
        
        class UDocument_Glossary_SC_TPL_GORNADRAK : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_TPL_GORNADRAK_1439");
            default Metadata.Add(n"GlossaryForCharacter", "SC_TPL_GORNADRAK_1439");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNadrak_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNadrak_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_TPL_GORNADRAK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_TPL_GORNADRAK;
        }
    }
}
#endif /* WITH_STORY_G1R */