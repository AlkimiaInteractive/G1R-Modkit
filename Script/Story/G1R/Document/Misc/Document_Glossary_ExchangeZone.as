#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_ExchangeZone_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_ExchangeZone;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_093652"));
            }
        }
        
        
        class UDocumentSegment_Glossary_ExchangeZone_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_ExchangeZone;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_123105"));
            }
        }
        
        
        class UDocumentSegment_Glossary_ExchangeZone_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_ExchangeZone;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_123109"));
            }
        }
        
        
        class UDocument_Glossary_ExchangeZone : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_ExchangeZone_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_ExchangeZone_S");
            default Title = LocText("AREA_EXCHANGEZONE_ELEVATOR_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_EXCHANGEZONE_ELEVATOR_NOTIFICATION");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_ExchangeZone : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_ExchangeZone;
        }
    }
}
#endif /* WITH_STORY_G1R */