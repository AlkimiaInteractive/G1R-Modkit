#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_ORRY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_ORRY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DZYJPTK_20250409_164606"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_ORRY_Weapon : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_ORRY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_110201"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_ORRY_Velaya : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_ORRY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LYVDWFL_20250410_150525"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_ORRY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_ORRY;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_ORRY_254");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_ORRY_254") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_ORRY_254").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162046"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_ORRY : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_ORRY_254");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_ORRY_254");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Orry_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Orry_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_ORRY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_ORRY;
        }
    }
}
#endif /* WITH_STORY_G1R */