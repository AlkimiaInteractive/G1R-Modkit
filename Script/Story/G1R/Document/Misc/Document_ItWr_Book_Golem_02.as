#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Golem_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Golem_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Golem_02-Heading_1"));
                AddSectionHeading(LocText("Document-ItWr_Book_Golem_02-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_02-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_02-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_02-Text_3"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Golem_02_Full"), LocText("TEXT_WIP_OQHNQN_20260120_191501"));
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Golem_02-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_02-Text_4"));
                AddParagraph(LocText("Document-ItWr_Book_Golem_02-Text_5"));
            }
        }
        
        
        class UDocument_ItWr_Book_Golem_02 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Golem_02_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Golem_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Golem_02;
        }
    }
}
#endif /* WITH_STORY_G1R */