#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_GRD_BRANDICK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_BRANDICK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_154515"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_BRANDICK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_BRANDICK;
            default AutoEvaluateUnlockFor.Add(n"OM_GRD_BRANDICK_261");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_GRD_BRANDICK_261") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_GRD_BRANDICK_261").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_154537"));
            }
        }
        
        
        class UDocument_Glossary_OM_GRD_BRANDICK : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_GRD_BRANDICK_261");
            default Metadata.Add(n"GlossaryForCharacter", "OM_GRD_BRANDICK_261");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Brandick_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Brandick_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_GRD_BRANDICK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_GRD_BRANDICK;
        }
    }
}
#endif /* WITH_STORY_G1R */