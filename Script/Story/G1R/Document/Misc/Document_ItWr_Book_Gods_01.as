#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Gods_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Gods_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_QGPNVSI_20260319_124339"));
                AddParagraph(LocText("Document-ItWr_Book_Gods_01-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Gods_01-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Gods_01-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Gods_01-Text_4"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Words_of_Gods_1"), LocText("TEXT_WIP_HGPNVSI_20260312_140823"));
            }
        }
        
        
        class UDocument_ItWr_Book_Gods_01 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Gods_01_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Gods_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Gods_01;
        }
    }
}
#endif /* WITH_STORY_G1R */