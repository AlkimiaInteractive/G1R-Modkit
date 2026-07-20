#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Jacko_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Jacko_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OUJXIRD_20251007_090223"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                G1R::UStoryG1R::Get().JackoNoteRead = 1;
            }
        }
        
        
        class UDocument_ItWr_Scroll_Jacko_01 : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Jacko_01_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Jacko_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Jacko_01;
        }
    }
}
#endif /* WITH_STORY_G1R */