#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SwampCamp_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SwampCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121035"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SwampCamp_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SwampCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_152130"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SwampCamp_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SwampCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_152139"));
            }
        }
        
        
        class UDocument_Glossary_SwampCamp : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_SWAMPCAMP_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_SWAMPCAMP_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_SwampCamp_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_SwampCamp_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SwampCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SwampCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */