#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_TPL_GORNARAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNARAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_155639"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNARAN_CampDivided : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNARAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_155951"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNARAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNARAN;
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_GORNARAN_1405");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNARAN_1405") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNARAN_1405").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_160023"));
            }
        }
        
        
        class UDocument_Glossary_SC_TPL_GORNARAN : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_TPL_GORNARAN_1405");
            default Metadata.Add(n"GlossaryForCharacter", "SC_TPL_GORNARAN_1405");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNaran_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNaran_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_TPL_GORNARAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_TPL_GORNARAN;
        }
    }
}
#endif /* WITH_STORY_G1R */