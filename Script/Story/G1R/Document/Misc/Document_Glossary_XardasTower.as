#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_XardasTower_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121659"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XardasTower_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_153055"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XardasTower_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XardasTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_153104"));
            }
        }
        
        
        class UDocument_Glossary_XardasTower : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_XARDASTOWER_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_XARDASTOWER_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_XardasTower_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_XardasTower_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_XardasTower : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_XardasTower;
        }
    }
}
#endif /* WITH_STORY_G1R */