#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Bloodhound_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodhound;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_094409"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Bloodhound_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodhound;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_094418"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Bloodhound_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodhound;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_094426"));
            }
        }
        
        
        class UDocument_Glossary_Bloodhound : UGlossaryCreaturesDocument
        {
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Bloodhound_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Bloodhound_S");
            default Title = LocText("BLOODHOUND");
            default Metadata.Add(n"GlossaryForCharacter", "BLOODHOUND");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Bloodhound : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Bloodhound;
        }
    }
}
#endif /* WITH_STORY_G1R */