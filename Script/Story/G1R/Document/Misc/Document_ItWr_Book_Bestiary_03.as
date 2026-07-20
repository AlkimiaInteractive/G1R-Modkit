#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Bestiary_03_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Bestiary_03;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_03_Full"), LocText("TEXT_WIP_OQHNQN_20260120_183652"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_UROXZYD_20250123_160210"));
                AddSectionHeading(LocText("TEXT_WIP_UROXZYD_20250123_160451"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160458"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160508"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160514"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_03_Mid"), LocText("TEXT_WIP_OQHNQN_20260120_183442"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160517"));
            }
        }
        
        
        class UDocument_ItWr_Book_Bestiary_03 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Bestiary_03_Initial);
            default Title = "TEXT_WIP_UROXZYD_20250123_160106";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Bestiary_03 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Bestiary_03;
        }
    }
}
#endif /* WITH_STORY_G1R */