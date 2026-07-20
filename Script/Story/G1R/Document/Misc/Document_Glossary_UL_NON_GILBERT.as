#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_NON_GILBERT_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_NON_GILBERT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_162339"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_NON_GILBERT_ExtraInfo : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_NON_GILBERT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_162557"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_NON_GILBERT_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_NON_GILBERT;
            default AutoEvaluateUnlockFor.Add(n"UL_NON_GILBERT_1500");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_NON_GILBERT_1500") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_NON_GILBERT_1500").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_162609"));
            }
        }
        
        
        class UDocument_Glossary_UL_NON_GILBERT : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_NON_GILBERT_1500");
            default Metadata.Add(n"GlossaryForCharacter", "UL_NON_GILBERT_1500");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gilbert_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gilbert_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_NON_GILBERT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_NON_GILBERT;
        }
    }
}
#endif /* WITH_STORY_G1R */