#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Troll_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Troll;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_112131"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Troll_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Troll;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_112146"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Troll_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Troll;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_112153"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Troll_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Troll;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_112201"));
            }
        }
        
        
        class UDocument_Glossary_Troll : UGlossaryCreaturesDocument
        {
            default Title = LocText("TROLL");
            default Metadata.Add(n"GlossaryForCharacter", "TROLL");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_JuvenileTroll_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_JuvenileTroll_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Troll : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Troll;
        }
    }
}
#endif /* WITH_STORY_G1R */