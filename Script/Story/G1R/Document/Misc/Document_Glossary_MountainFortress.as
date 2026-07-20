#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_MountainFortress_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_MountainFortress;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_170115"));
            }
        }
        
        
        class UDocumentSegment_Glossary_MountainFortress_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_MountainFortress;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_170548"));
            }
        }
        
        
        class UDocumentSegment_Glossary_MountainFortress_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_MountainFortress;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_170605"));
            }
        }
        
        
        class UDocument_Glossary_MountainFortress : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_MountainFortress_M");
            default Title = LocText("AREA_MOUNTAINFORTRESS_KEEP_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_MOUNTAINFORTRESS_KEEP_NOTIFICATION");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_MountainFortress_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_MountainFortress : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_MountainFortress;
        }
    }
}
#endif /* WITH_STORY_G1R */