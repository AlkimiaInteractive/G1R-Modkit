#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Bran_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Bran_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OUJXIRD_20251007_110119"));
                AddParagraph(LocText("TEXT_WIP_OUJXIRD_20251007_110250"));
                AddParagraph(LocText("TEXT_WIP_OUJXIRD_20251007_110300"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                G1R::UStoryG1R::Get().BranNoteRead = 1;
            }
        }
        
        
        class UDocument_ItWr_Scroll_Bran_01 : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Bran_01_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Bran_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Bran_01;
        }
    }
}
#endif /* WITH_STORY_G1R */