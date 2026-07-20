#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_DEALERJOB_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DEALERJOB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DEALERJOB_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_DEALERJOB_Success : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DEALERJOB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DEALERJOB_ENTRY_7"));
            }
        }
        
        
        class UDocument_CH1_DEALERJOB : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_DEALERJOB : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_DEALERJOB;
        }
    }
}
#endif /* WITH_STORY_G1R */