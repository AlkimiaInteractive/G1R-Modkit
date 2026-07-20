#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_ORG_KILLIAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_KILLIAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_165723"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_KILLIAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_KILLIAN;
            default AutoEvaluateUnlockFor.Add(n"UL_ORG_KILLIAN_861");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_ORG_KILLIAN_861") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_ORG_KILLIAN_861").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_165911"));
            }
        }
        
        
        class UDocument_Glossary_UL_ORG_KILLIAN : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_ORG_KILLIAN_861");
            default Metadata.Add(n"GlossaryForCharacter", "UL_ORG_KILLIAN_861");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Killian_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Killian_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_ORG_KILLIAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_ORG_KILLIAN;
        }
    }
}
#endif /* WITH_STORY_G1R */