#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Focus_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Focus;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_BRKDUKF_20240327_154426"));
                AddSectionHeading(LocText("TEXT_WIP_BRKDUKF_20240327_154438"));
                AddParagraph(LocText("TEXT_WIP_BRKDUKF_20240327_154448"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_BRKDUKF_20240327_154623"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Almanac"), LocText("TEXT_WIP_HGPNVSI_20260312_140741"));
            }
        }
        
        
        class UDocument_ItWr_Book_Focus : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Focus_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Focus : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Focus;
        }
    }
}
#endif /* WITH_STORY_G1R */