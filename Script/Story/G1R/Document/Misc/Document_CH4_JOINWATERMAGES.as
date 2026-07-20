#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_JOINWATERMAGES_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_144455"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_Alchemy : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_154140"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_Inscription : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_154207"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_Professions : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_154652"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_Ritual : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_154933"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_Return : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_155302"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_CompletedAfterFireMage : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_155552"));
            }
        }
        
        
        class UDocumentSegment_CH4_JOINWATERMAGES_Complete : UDocumentSegment
        {
            default InDocument = UDocument_CH4_JOINWATERMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_155918"));
            }
        }
        
        
        class UDocument_CH4_JOINWATERMAGES : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_JOINWATERMAGES : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_JOINWATERMAGES;
        }
    }
}
#endif /* WITH_STORY_G1R */