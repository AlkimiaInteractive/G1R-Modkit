#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_PATHTOORCENCLAVE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_PATHTOORCENCLAVE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TPDUCLK_20250702_141744"));
            }
        }
        
        
        class UDocumentSegment_CH4_PATHTOORCENCLAVE_End : UDocumentSegment
        {
            default InDocument = UDocument_CH4_PATHTOORCENCLAVE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TPDUCLK_20250702_142556"));
            }
        }
        
        
        class UDocument_CH4_PATHTOORCENCLAVE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_PATHTOORCENCLAVE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_PATHTOORCENCLAVE;
        }
    }
}
#endif /* WITH_STORY_G1R */