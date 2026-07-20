#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_MEETYBERION_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MEETYBERION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MARSWDD_20250606_111020"));
            }
        }
        
        
        class UDocumentSegment_CH2_MEETYBERION_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MEETYBERION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MARSWDD_20250606_111030"));
            }
        }
        
        
        class UDocument_CH2_MEETYBERION : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_MEETYBERION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_MEETYBERION;
        }
    }
}
#endif /* WITH_STORY_G1R */