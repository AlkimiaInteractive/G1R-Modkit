#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Swampshark_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Swampshark;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_110754"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Swampshark_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Swampshark;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_110812"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Swampshark_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Swampshark;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_110819"));
            }
        }
        
        
        class UDocument_Glossary_Swampshark : UGlossaryCreaturesDocument
        {
            default Title = LocText("SWAMPSHARK");
            default Metadata.Add(n"GlossaryForCharacter", "SWAMPSHARK");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Swampshark_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Swampshark_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Swampshark : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Swampshark;
        }
    }
}
#endif /* WITH_STORY_G1R */