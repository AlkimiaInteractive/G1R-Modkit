#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Lizard_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_111246"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Lizard_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_112350"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Lizard_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_112400"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Lizard_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_112744"));
            }
        }
        
        
        class UDocument_Glossary_Lizard : UGlossaryCreaturesDocument
        {
            default Title = LocText("LIZARD");
            default Metadata.Add(n"GlossaryForCharacter", "LIZARD");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Lizard_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Lizard_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Lizard : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Lizard;
        }
    }
}
#endif /* WITH_STORY_G1R */