#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_THORUS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_THORUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_111320"));
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_112544"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_THORUS_RankUpGuard : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_THORUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_112556"));
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_113516"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_THORUS_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_THORUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_113156"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_THORUS_Teacher2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_THORUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_125505"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_THORUS_FireMages : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_THORUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_100105"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_114146"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_114241"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_THORUS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_THORUS;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_THORUS_200");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_THORUS_200") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_THORUS_200").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162116"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_THORUS : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_THORUS_200");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_THORUS_200");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Thorus_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Thorus_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_THORUS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_THORUS;
        }
    }
}
#endif /* WITH_STORY_G1R */