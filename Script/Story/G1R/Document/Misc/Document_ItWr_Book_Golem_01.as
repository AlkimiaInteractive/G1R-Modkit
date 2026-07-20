#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Golem_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Golem_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Golem_01-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_01-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_01-Text_2"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Golem_01_Full"), LocText("TEXT_WIP_OQHNQN_20260120_191346"));
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Golem_01-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_01-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_01-Text_4"));
            }
        }
        
        
        class UDocument_ItWr_Book_Golem_01 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Golem_01_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Golem_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Golem_01;
        }
    }
}
#endif /* WITH_STORY_G1R */