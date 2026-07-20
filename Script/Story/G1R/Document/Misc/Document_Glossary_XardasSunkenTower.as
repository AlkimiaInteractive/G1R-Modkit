#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_XardasSunkenTower_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasSunkenTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121829"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XardasSunkenTower_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasSunkenTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_153304"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XardasSunkenTower_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasSunkenTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_153311"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XardasSunkenTower_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasSunkenTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_153318"));
            }
        }
        
        
        class UDocument_Glossary_XardasSunkenTower : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_XARDASSUNKENTOWER_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_XARDASSUNKENTOWER_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_XardasSunken_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_XardasSunken_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_XardasSunkenTower : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_XardasSunkenTower;
        }
    }
}
#endif /* WITH_STORY_G1R */