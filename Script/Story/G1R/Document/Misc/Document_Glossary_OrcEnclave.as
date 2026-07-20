#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OrcEnclave_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcEnclave;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121522"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OrcEnclave_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcEnclave;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_152529"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OrcEnclave_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcEnclave;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_152540"));
            }
        }
        
        
        class UDocument_Glossary_OrcEnclave : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_ORCENCLAVE_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_ORCENCLAVE_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OrcEnclave_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OrcEnclave_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OrcEnclave : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OrcEnclave;
        }
    }
}
#endif /* WITH_STORY_G1R */