#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Chromanin_04_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Chromanin_04;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddChapterHeading(LocText("Document-itwr_book_chromanin_04-Heading_1"));
                AddParagraph(LocText("Document-itwr_book_chromanin_04-Text_1"));
                AddParagraph(LocText("Document-itwr_book_chromanin_04-Text_2"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                G1R::UStoryG1R::Get().ChromaninRead(4);
                Quest::ValleyOfMines_CHROMANIN_CHROMANIN_4.SucceedQuest();
            }
        }
        
        
        class UDocument_ItWr_Book_Chromanin_04 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Chromanin_04_Initial);
            default Title = "Document-itwr_book_chromanin_04-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Chromanin_04 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Chromanin_04;
        }
    }
}
#endif /* WITH_STORY_G1R */