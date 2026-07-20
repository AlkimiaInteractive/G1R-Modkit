#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NewCamp_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NewCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121011"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NewCamp_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NewCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_151849"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NewCamp_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NewCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_151857"));
            }
        }
        
        
        class UDocument_Glossary_NewCamp : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_NEWCAMP_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_NEWCAMP_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_NewCamp_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_NewCamp_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NewCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NewCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */