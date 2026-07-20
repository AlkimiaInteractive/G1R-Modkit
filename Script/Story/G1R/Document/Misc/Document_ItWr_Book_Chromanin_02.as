#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Chromanin_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Chromanin_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddChapterHeading(LocText("Document-itwr_book_chromanin_02-Heading_1"));
                AddParagraph(LocText("Document-itwr_book_chromanin_02-Text_1"));
                AddParagraph(LocText("Document-itwr_book_chromanin_02-Text_2"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                G1R::UStoryG1R::Get().ChromaninRead(2);
                Quest::ValleyOfMines_CHROMANIN_CHROMANIN_2.SucceedQuest();
            }
        }
        
        
        class UDocument_ItWr_Book_Chromanin_02 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Chromanin_02_Initial);
            default Title = "Document-itwr_book_chromanin_02-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Chromanin_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Chromanin_02;
        }
    }
}
#endif /* WITH_STORY_G1R */