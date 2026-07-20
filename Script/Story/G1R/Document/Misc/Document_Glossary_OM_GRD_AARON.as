#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_GRD_AARON_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_AARON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_143124"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_AARON_Deceived : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_AARON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_145809"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_AARON_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_AARON;
            default AutoEvaluateUnlockFor.Add(n"OM_GRD_AARON_262");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_GRD_AARON_262") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_GRD_AARON_262").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_145235"));
            }
        }
        
        
        class UDocument_Glossary_OM_GRD_AARON : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_GRD_AARON_262");
            default Metadata.Add(n"GlossaryForCharacter", "OM_GRD_AARON_262");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Aaron_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Aaron_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_GRD_AARON : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_GRD_AARON;
        }
    }
}
#endif /* WITH_STORY_G1R */