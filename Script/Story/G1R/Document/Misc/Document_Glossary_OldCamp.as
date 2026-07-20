#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OldCamp_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_120815"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OldCamp_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_150152"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OldCamp_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_150201"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OldCamp_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_150208"));
            }
        }
        
        
        class UDocument_Glossary_OldCamp : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_OLDCAMP_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_OLDCAMP_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OldCamp_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OldCamp_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OldCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OldCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */