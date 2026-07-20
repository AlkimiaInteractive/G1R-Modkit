#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_BALOROS_WAFFE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BALOROS_WAFFE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("BALOROS_WAFFE_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_BALOROS_WAFFE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BALOROS_WAFFE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("BALOROS_WAFFE_ENTRY_1"));
            }
        }
        
        
        class UDocument_CH1_BALOROS_WAFFE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_BALOROS_WAFFE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_BALOROS_WAFFE;
        }
    }
}
#endif /* WITH_STORY_G1R */