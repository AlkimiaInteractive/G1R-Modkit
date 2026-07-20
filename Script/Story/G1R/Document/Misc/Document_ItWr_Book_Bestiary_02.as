#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Bestiary_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Bestiary_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_02_Full"), LocText("TEXT_WIP_OQHNQN_20260120_183237"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_UROXZYD_20250123_160136"));
                AddSectionHeading(LocText("TEXT_WIP_UROXZYD_20250123_160332"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160407"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160416"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160425"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_02_Mid"), LocText("TEXT_WIP_OQHNQN_20260120_183315"));
            }
        }
        
        
        class UDocument_ItWr_Book_Bestiary_02 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Bestiary_02_Initial);
            default Title = "TEXT_WIP_UROXZYD_20250123_160050";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Bestiary_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Bestiary_02;
        }
    }
}
#endif /* WITH_STORY_G1R */