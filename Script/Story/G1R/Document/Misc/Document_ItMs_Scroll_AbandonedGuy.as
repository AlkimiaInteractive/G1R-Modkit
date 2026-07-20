#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_AbandonedGuy_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_AbandonedGuy;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QHMTAUF_20260316_113309"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_AbandonedGuy : UDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_AbandonedGuy_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_AbandonedGuy : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_AbandonedGuy;
        }
    }
}
#endif /* WITH_STORY_G1R */