#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Goblin_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Goblin;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_110431"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Goblin_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Goblin;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_110440"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Goblin_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Goblin;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_110447"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Goblin_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Goblin;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_110459"));
            }
        }
        
        
        class UDocument_Glossary_Goblin : UGlossaryCreaturesDocument
        {
            default Title = LocText("GOBLIN_GREEN");
            default Metadata.Add(n"GlossaryForCharacter", "GOBLIN_GREEN");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Goblin_02_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Goblin_02_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Goblin : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Goblin;
        }
    }
}
#endif /* WITH_STORY_G1R */