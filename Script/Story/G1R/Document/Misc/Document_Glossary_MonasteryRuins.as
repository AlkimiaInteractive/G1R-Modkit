#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_MonasteryRuins_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_MonasteryRuins;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_163210"));
            }
        }
        
        
        class UDocumentSegment_Glossary_MonasteryRuins_Entry1 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_MonasteryRuins;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KCTRJAD_20251205_163639"));
            }
        }
        
        
        class UDocument_Glossary_MonasteryRuins : UGlossaryLocationsDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_MonasteryRuins_M");
            default Title = LocText("AREA_MONASTERYRUINS_CLOISTER_NOTIFICATION");
            default Metadata.Add(n"GlossaryForCharacter", "AREA_MONASTERYRUINS_CLOISTER_NOTIFICATION");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Locations/T_GlossaryImage_MonasteryRuins_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_MonasteryRuins : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_MonasteryRuins;
        }
    }
}
#endif /* WITH_STORY_G1R */