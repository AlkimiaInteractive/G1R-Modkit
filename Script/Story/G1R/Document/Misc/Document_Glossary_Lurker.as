#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Lurker_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lurker;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_135650"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Lurker_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lurker;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_135708"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Lurker_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lurker;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_135720"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Lurker_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Lurker;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_135728"));
            }
        }
        
        
        class UDocument_Glossary_Lurker : UGlossaryCreaturesDocument
        {
            default Title = LocText("LURKER");
            default Metadata.Add(n"GlossaryForCharacter", "LURKER");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Lurker_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Lurker_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Lurker : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Lurker;
        }
    }
}
#endif /* WITH_STORY_G1R */