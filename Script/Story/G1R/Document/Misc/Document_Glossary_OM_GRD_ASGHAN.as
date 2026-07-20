#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_GRD_ASGHAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_ASGHAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_150229"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_ASGHAN_Impress : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_ASGHAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_153725"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_ASGHAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_ASGHAN;
            default AutoEvaluateUnlockFor.Add(n"OM_GRD_ASGHAN_263");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_GRD_ASGHAN_263") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_GRD_ASGHAN_263").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_154403"));
            }
        }
        
        
        class UDocument_Glossary_OM_GRD_ASGHAN : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_GRD_ASGHAN_263");
            default Metadata.Add(n"GlossaryForCharacter", "OM_GRD_ASGHAN_263");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Asgha_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Asgha_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_GRD_ASGHAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_GRD_ASGHAN;
        }
    }
}
#endif /* WITH_STORY_G1R */