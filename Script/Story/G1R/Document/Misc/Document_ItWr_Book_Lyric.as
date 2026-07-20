#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Lyric_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Lyric;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_4"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_5"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_6"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_7"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_8"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_9"));
                AddParagraph(LocText("Document-ItWr_Book_Lyric-Text_10"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Myrtana_Poetry"), LocText("TEXT_WIP_HGPNVSI_20260312_141237"));
            }
        }
        
        
        class UDocument_ItWr_Book_Lyric : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Lyric_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Lyric : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Lyric;
        }
    }
}
#endif /* WITH_STORY_G1R */