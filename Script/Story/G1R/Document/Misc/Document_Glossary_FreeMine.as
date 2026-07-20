#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FreeMine_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FreeMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_121337"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FreeMine_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FreeMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_144918"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FreeMine_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FreeMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NHWBCKC_20250821_144928"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FreeMine_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FreeMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WNWBKYL_20250901_140047"));
            }
        }
        
        
        class UDocument_Glossary_FreeMine : UGlossaryLocationsDocument
        {
            default Title = LocText("AREA_FREEMINE_INTERIOR_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_FREEMINE_INTERIOR_NOTIFICATION");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_FreeMine_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_FreeMine_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FreeMine : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FreeMine;
        }
    }
}
#endif /* WITH_STORY_G1R */