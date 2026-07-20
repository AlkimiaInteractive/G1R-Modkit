#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Demon_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Demon;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_133059"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Demon_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Demon;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_133107"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Demon_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Demon;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_133116"));
            }
        }
        
        
        class UDocument_Glossary_Demon : UGlossaryCreaturesDocument
        {
            default Title = LocText("DEMONLESSER");
            default Metadata.Add(n"GlossaryForCharacter", "DEMONLESSER");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_LesserDemon_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_LesserDemon_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Demon : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Demon;
        }
    }
}
#endif /* WITH_STORY_G1R */