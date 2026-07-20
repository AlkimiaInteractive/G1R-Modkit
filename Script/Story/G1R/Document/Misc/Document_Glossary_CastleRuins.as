#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_CastleRuins_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_CastleRuins;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_161737"));
            }
        }
        
        
        class UDocumentSegment_Glossary_CastleRuins_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_CastleRuins;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_162059"));
            }
        }
        
        
        class UDocument_Glossary_CastleRuins : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_CastleRuins_M");
            default Title = LocText("AREA_CASTLERUINS_KEEP_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_CASTLERUINS_KEEP_NOTIFICATION");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_CastleRuins_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_CastleRuins : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_CastleRuins;
        }
    }
}
#endif /* WITH_STORY_G1R */