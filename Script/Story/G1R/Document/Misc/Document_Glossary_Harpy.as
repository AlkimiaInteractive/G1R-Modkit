#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Harpy_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Harpy;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_133826"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Harpy_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Harpy;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_133845"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Harpy_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Harpy;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_133854"));
            }
        }
        
        
        class UDocument_Glossary_Harpy : UGlossaryCreaturesDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Harpy_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Harpy_S");
            default Title = LocText("HARPY");
            default Metadata.Add(n"GlossaryForCharacter", "HARPY");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Harpy : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Harpy;
        }
    }
}
#endif /* WITH_STORY_G1R */