#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_ESCAPEPLAN_Note : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ESCAPEPLAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_170509"));
            }
        }
        
        
        class UDocumentSegment_CH4_ESCAPEPLAN_GomezKo : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ESCAPEPLAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_133134"));
            }
        }
        
        
        class UDocumentSegment_CH4_ESCAPEPLAN_Alarm : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ESCAPEPLAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_133954"));
            }
        }
        
        
        class UDocumentSegment_CH4_ESCAPEPLAN_NoGuards : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ESCAPEPLAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_134740"));
            }
        }
        
        
        class UDocument_CH4_ESCAPEPLAN : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_ESCAPEPLAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_ESCAPEPLAN;
        }
    }
}
#endif /* WITH_STORY_G1R */