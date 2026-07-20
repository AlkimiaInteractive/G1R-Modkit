#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Bestiary_05_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Bestiary_05;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_05_Full"), LocText("TEXT_WIP_OQHNQN_20260120_184004"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_UROXZYD_20250123_160254"));
                AddSectionHeading(LocText("TEXT_WIP_UROXZYD_20250123_160720"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160736"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_05_Mid"), LocText("TEXT_WIP_OQHNQN_20260120_183918"));
                AddParagraph(LocText("TEXT_WIP_XGDWEXI_20250919_181308"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_XGDWEXI_20250919_181336"));
            }
        }
        
        
        class UDocument_ItWr_Book_Bestiary_05 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Bestiary_05_Initial);
            default Title = "TEXT_WIP_UROXZYD_20250123_160121";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Bestiary_05 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Bestiary_05;
        }
    }
}
#endif /* WITH_STORY_G1R */