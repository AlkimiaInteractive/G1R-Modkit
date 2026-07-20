#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Troll_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Troll;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Book_Troll-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Troll-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Troll-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_Troll-Text_3"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Troll"), LocText("TEXT_WIP_HGPNVSI_20260312_145127"));
            }
        }
        
        
        class UDocument_ItWr_Book_Troll : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Troll_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Troll : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Troll;
        }
    }
}
#endif /* WITH_STORY_G1R */