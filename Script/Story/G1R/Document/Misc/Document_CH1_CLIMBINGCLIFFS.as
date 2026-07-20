#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_CLIMBINGCLIFFS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CLIMBINGCLIFFS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OBZTSOD_20250602_123228"));
            }
        }
        
        
        class UDocumentSegment_CH1_CLIMBINGCLIFFS_TeachMissPoints : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CLIMBINGCLIFFS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OBZTSOD_20250602_141007"));
            }
        }
        
        
        class UDocumentSegment_CH1_CLIMBINGCLIFFS_TeachMissNuggets : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CLIMBINGCLIFFS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OBZTSOD_20250602_141240"));
            }
        }
        
        
        class UDocumentSegment_CH1_CLIMBINGCLIFFS_TeachCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CLIMBINGCLIFFS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OBZTSOD_20250602_141752"));
            }
        }
        
        
        class UDocumentSegment_CH1_CLIMBINGCLIFFS_ClimbCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CLIMBINGCLIFFS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OBZTSOD_20250602_141127"));
            }
        }
        
        
        class UDocument_CH1_CLIMBINGCLIFFS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_CLIMBINGCLIFFS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_CLIMBINGCLIFFS;
        }
    }
}
#endif /* WITH_STORY_G1R */