#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Chromanin_06_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Chromanin_06;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddChapterHeading(LocText("Document-itwr_book_chromanin_06-Heading_1"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_140121"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_140257"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                G1R::UStoryG1R::Get().ChromaninRead(6);
                Quest::ValleyOfMines_CHROMANIN_CHROMANIN_OBJ_RESOLVE.SucceedQuest();
                UWorldPointManager::Get().CallGlobalEvent(n"OnChromaninRead");
            }
        }
        
        
        class UDocument_ItWr_Book_Chromanin_06 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Chromanin_06_Initial);
            default Title = "Document-itwr_book_chromanin_06-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Chromanin_06 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Chromanin_06;
        }
    }
}
#endif /* WITH_STORY_G1R */