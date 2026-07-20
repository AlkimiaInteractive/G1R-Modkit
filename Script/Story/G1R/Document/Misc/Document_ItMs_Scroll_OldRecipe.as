#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_OldRecipe_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_OldRecipe;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HESOPYI_20250902_152458"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_OldRecipe : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_OldRecipe_Initial);
            default Title = "TEXT_WIP_SRFQVSM_20250506_110124";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_OldRecipe : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_OldRecipe;
        }
    }
}
#endif /* WITH_STORY_G1R */