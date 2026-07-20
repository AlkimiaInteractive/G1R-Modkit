#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_TrollCanyon_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_TrollCanyon;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_171646"));
            }
        }
        
        
        class UDocument_Glossary_TrollCanyon : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_TrollCanyon_M");
            default Title = LocText("AREA_TROLLCANYON_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_TROLLCANYON_NOTIFICATION");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_TrollCanyon_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_TrollCanyon : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_TrollCanyon;
        }
    }
}
#endif /* WITH_STORY_G1R */