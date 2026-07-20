#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_SCORPIO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_SCORPIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_100418"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_SCORPIO_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_SCORPIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_105518"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_SCORPIO_Escape : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_SCORPIO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_105908"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_SCORPIO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_SCORPIO;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_SCORPIO_205");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_SCORPIO_205") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_SCORPIO_205").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_110327"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_SCORPIO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_SCORPIO_205");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_SCORPIO_205");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Scorpio_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Scorpio_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_SCORPIO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_SCORPIO;
        }
    }
}
#endif /* WITH_STORY_G1R */