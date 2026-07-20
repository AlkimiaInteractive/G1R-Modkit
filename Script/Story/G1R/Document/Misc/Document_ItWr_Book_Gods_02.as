#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Gods_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Gods_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_QGPNVSI_20260319_124413"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Words_of_Gods_2_v2"), LocText("TEXT_WIP_HGPNVSI_20260312_140932"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Gods_02-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Gods_02-Text_2"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Words_of_Gods_2_v1"), LocText("TEXT_WIP_HGPNVSI_20260312_141001"));
            }
        }
        
        
        class UDocument_ItWr_Book_Gods_02 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Gods_02_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Gods_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Gods_02;
        }
    }
}
#endif /* WITH_STORY_G1R */