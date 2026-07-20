#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FireLizard_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireLizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_100349"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FireLizard_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireLizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_100406"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FireLizard_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireLizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_100559"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FireLizard_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireLizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_100620"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FireLizard_Entry5 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireLizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_100631"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FireLizard_Entry6 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireLizard;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PLOSEG_20250818_100644"));
            }
        }
        
        
        class UDocument_Glossary_FireLizard : UGlossaryCreaturesDocument
        {
            default Title = LocText("LIZARDFIRE");
            default Metadata.Add(n"GlossaryForCharacter", "LIZARDFIRE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_FireLizard_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_FireLizard_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FireLizard : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FireLizard;
        }
    }
}
#endif /* WITH_STORY_G1R */