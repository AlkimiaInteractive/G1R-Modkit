#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Meatbug_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Meatbug;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_140454"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Meatbug_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Meatbug;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_140529"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Meatbug_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Meatbug;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_140540"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Meatbug_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Meatbug;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_140550"));
            }
        }
        
        
        class UDocument_Glossary_Meatbug : UGlossaryCreaturesDocument
        {
            default Title = LocText("MEATBUG");
            default Metadata.Add(n"GlossaryForCharacter", "MEATBUG");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Meatbug_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Meatbug_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Meatbug : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Meatbug;
        }
    }
}
#endif /* WITH_STORY_G1R */