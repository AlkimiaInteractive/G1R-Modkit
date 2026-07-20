#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Letter_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Letter_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Scroll_Letter_01-Text_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_Letter_01-Text_2"));
                AddParagraph(LocText("Document-ItWr_Scroll_Letter_01-Text_3"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                AGothicCharacterState::FindByUniqueName(n"Hero").RemoveItemFromInventory(UItWr_Scroll_Letter_01, 1, 0);
                AGothicCharacterState::FindByUniqueName(n"Hero").AddItemToInventory(UItWr_Scroll_Letter_02, 1);
            }
        }
        
        
        class UDocument_ItWr_Scroll_Letter_01 : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Letter_01_Initial);
            default Title = "Document-ItWr_Scroll_Letter_01-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Letter_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Letter_01;
        }
    }
}
#endif /* WITH_STORY_G1R */