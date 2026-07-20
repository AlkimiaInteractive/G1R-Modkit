#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_AbandonedMine_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_AbandonedMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121228"));
            }
        }
        
        
        class UDocumentSegment_Glossary_AbandonedMine_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_AbandonedMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_143108"));
            }
        }
        
        
        class UDocumentSegment_Glossary_AbandonedMine_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_AbandonedMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_143116"));
            }
        }
        
        
        class UDocumentSegment_Glossary_AbandonedMine_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_AbandonedMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_143124"));
            }
        }
        
        
        class UDocument_Glossary_AbandonedMine : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_ABANDONEDMINE_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_ABANDONEDMINE_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_AbandonedMine_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_AbandonedMine_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_AbandonedMine : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_AbandonedMine;
        }
    }
}
#endif /* WITH_STORY_G1R */