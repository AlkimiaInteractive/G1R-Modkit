#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_TPL_GORNADUN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNADUN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154710"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNADUN_Beated : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNADUN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154917"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNADUN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNADUN;
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_GORNADUN_1411");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNADUN_1411") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNADUN_1411").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154903"));
            }
        }
        
        
        class UDocument_Glossary_SC_TPL_GORNADUN : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_TPL_GORNADUN_1411");
            default Metadata.Add(n"GlossaryForCharacter", "SC_TPL_GORNADUN_1411");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNadun_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNadun_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_TPL_GORNADUN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_TPL_GORNADUN;
        }
    }
}
#endif /* WITH_STORY_G1R */