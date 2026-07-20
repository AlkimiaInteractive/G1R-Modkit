#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_BanditsCamp_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BanditsCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121254"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BanditsCamp_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BanditsCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_144300"));
            }
        }
        
        
        class UDocument_Glossary_BanditsCamp : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_BANDITSCAMP_PLATEAU_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_BANDITSCAMP_PLATEAU_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_BanditCamp_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_BanditCamp_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_BanditsCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_BanditsCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */