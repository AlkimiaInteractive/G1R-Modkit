#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Molerat_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Molerat;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_INHQEIK_20250714_104501"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Molerat_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Molerat;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLAUKMK_20250723_092827"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Molerat_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Molerat;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLAUKMK_20250723_093810"));
            }
        }
        
        
        class UDocument_Glossary_Molerat : UGlossaryCreaturesDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Molerat_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Molerat_S");
            default Title = LocText("MOLERAT");
            default Metadata.Add(n"GlossaryForCharacter", "MOLERAT");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Molerat : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Molerat;
        }
    }
}
#endif /* WITH_STORY_G1R */