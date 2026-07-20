#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OldMine_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121428"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OldMine_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_145738"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OldMine_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_145746"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OldMine_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OldMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WNWBKYL_20250901_140224"));
            }
        }
        
        
        class UDocument_Glossary_OldMine : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_OLDMINE_INTERIOR_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_OLDMINE_INTERIOR_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OldMine_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_OldMine_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OldMine : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OldMine;
        }
    }
}
#endif /* WITH_STORY_G1R */