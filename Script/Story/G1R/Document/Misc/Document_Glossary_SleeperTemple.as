#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SleeperTemple_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SleeperTemple;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121607"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SleeperTemple_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SleeperTemple;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_152801"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SleeperTemple_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SleeperTemple;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_152810"));
            }
        }
        
        
        class UDocument_Glossary_SleeperTemple : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_SLEEPERTEMPLE_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_SLEEPERTEMPLE_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_SleeperTemple_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_SleeperTemple_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SleeperTemple : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SleeperTemple;
        }
    }
}
#endif /* WITH_STORY_G1R */