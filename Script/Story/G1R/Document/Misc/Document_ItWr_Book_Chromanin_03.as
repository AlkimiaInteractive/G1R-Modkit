#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Chromanin_03_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Chromanin_03;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddChapterHeading(LocText("Document-itwr_book_chromanin_03-Heading_1"));
                AddParagraph(LocText("Document-itwr_book_chromanin_03-Text_1"));
                AddParagraph(LocText("Document-itwr_book_chromanin_03-Text_2"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                G1R::UStoryG1R::Get().ChromaninRead(3);
                Quest::ValleyOfMines_CHROMANIN_CHROMANIN_3.SucceedQuest();
            }
        }
        
        
        class UDocument_ItWr_Book_Chromanin_03 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Chromanin_03_Initial);
            default Title = "Document-itwr_book_chromanin_03-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Chromanin_03 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Chromanin_03;
        }
    }
}
#endif /* WITH_STORY_G1R */