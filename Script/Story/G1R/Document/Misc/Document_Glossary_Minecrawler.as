#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Minecrawler_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Minecrawler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_141827"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Minecrawler_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Minecrawler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_141852"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Minecrawler_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Minecrawler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_141859"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Minecrawler_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Minecrawler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_141906"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Minecrawler_Entry5 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Minecrawler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_141915"));
            }
        }
        
        
        class UDocument_Glossary_Minecrawler : UGlossaryCreaturesDocument
        {
            default Title = LocText("MINECRAWLER");
            default Metadata.Add(n"GlossaryForCharacter", "MINECRAWLER");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Crawler_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Crawler_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Minecrawler : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Minecrawler;
        }
    }
}
#endif /* WITH_STORY_G1R */