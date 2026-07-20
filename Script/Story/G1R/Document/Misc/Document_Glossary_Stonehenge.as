#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Stonehenge_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Stonehenge;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_170640"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Stonehenge_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Stonehenge;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_171435"));
            }
        }
        
        
        class UDocument_Glossary_Stonehenge : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_Stonehenge_M");
            default Title = LocText("AREA_STONEHENGE_MAINAREA_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_STONEHENGE_MAINAREA_NOTIFICATION");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_Stonehenge_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Stonehenge : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Stonehenge;
        }
    }
}
#endif /* WITH_STORY_G1R */