#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_CAINE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_CAINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_143854"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_CAINE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_CAINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_144035"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_CAINE : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_CAINE_1301");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_CAINE_1301");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Caine_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Caine_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_CAINE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_CAINE;
        }
    }
}
#endif /* WITH_STORY_G1R */