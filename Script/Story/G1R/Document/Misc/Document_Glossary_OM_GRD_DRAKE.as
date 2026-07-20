#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_GRD_DRAKE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_DRAKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_154709"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_DRAKE_Beer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_DRAKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_155423"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_DRAKE_Info : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_DRAKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_155506"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_DRAKE_NewCamper : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_DRAKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_160310"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_DRAKE_Impress : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_DRAKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_155740"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_GRD_DRAKE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_GRD_DRAKE;
            default AutoEvaluateUnlockFor.Add(n"OM_GRD_DRAKE_260");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_GRD_DRAKE_260") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_GRD_DRAKE_260").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_094121"));
            }
        }
        
        
        class UDocument_Glossary_OM_GRD_DRAKE : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_GRD_DRAKE_260");
            default Metadata.Add(n"GlossaryForCharacter", "OM_GRD_DRAKE_260");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Drake_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Drake_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_GRD_DRAKE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_GRD_DRAKE;
        }
    }
}
#endif /* WITH_STORY_G1R */