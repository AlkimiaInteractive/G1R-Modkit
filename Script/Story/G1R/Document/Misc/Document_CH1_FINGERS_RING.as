#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_FINGERS_RING_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FINGERS_RING;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WJGMTPL_20250527_155845"));
            }
        }
        
        
        class UDocumentSegment_CH1_FINGERS_RING_Ring : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FINGERS_RING;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WJGMTPL_20250527_160003"));
            }
        }
        
        
        class UDocumentSegment_CH1_FINGERS_RING_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FINGERS_RING;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WJGMTPL_20250527_160204"));
            }
        }
        
        
        class UDocument_CH1_FINGERS_RING : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_FINGERS_RING : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_FINGERS_RING;
        }
    }
}
#endif /* WITH_STORY_G1R */