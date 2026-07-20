#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OrcTerritory_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcTerritory;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_172038"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OrcTerritory_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcTerritory;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_172443"));
            }
        }
        
        
        class UDocument_Glossary_OrcTerritory : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OrcTerritory_M");
            default Title = LocText("AREA_ORCTERRITORY_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_ORCTERRITORY_NOTIFICATION");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OrcTerritory_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OrcTerritory : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OrcTerritory;
        }
    }
}
#endif /* WITH_STORY_G1R */