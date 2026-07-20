#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Gods_03_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Gods_03;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_QGPNVSI_20260319_124440"));
                AddParagraph(LocText("Document-ItWr_Book_Gods_03-Text_1"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Words_of_Gods_3_v1"), LocText("TEXT_WIP_HGPNVSI_20260312_141025"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Gods_03-Text_2"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Words_of_Gods_3_v2"), LocText("TEXT_WIP_HGPNVSI_20260312_141035"));
            }
        }
        
        
        class UDocument_ItWr_Book_Gods_03 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Gods_03_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Gods_03 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Gods_03;
        }
    }
}
#endif /* WITH_STORY_G1R */