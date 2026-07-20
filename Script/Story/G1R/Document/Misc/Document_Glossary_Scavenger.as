#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Scavenger_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Scavenger;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_114321"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Scavenger_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Scavenger;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_093502"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Scavenger_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Scavenger;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_093512"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Scavenger_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Scavenger;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_093519"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Scavenger_Entry5 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Scavenger;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_093526"));
            }
        }
        
        
        class UDocument_Glossary_Scavenger : UGlossaryCreaturesDocument
        {
            default Title = LocText("SCAVENGER_MEDIUM");
            default Metadata.Add(n"GlossaryForCharacter", "SCAVENGER_MEDIUM");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_ScavengerYoung_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_ScavengerYoung_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Scavenger : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Scavenger;
        }
    }
}
#endif /* WITH_STORY_G1R */