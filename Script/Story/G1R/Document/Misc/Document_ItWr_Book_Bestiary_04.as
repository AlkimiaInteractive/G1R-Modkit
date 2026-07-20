#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Bestiary_04_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Bestiary_04;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_04_Full"), LocText("TEXT_WIP_OQHNQN_20260120_183839"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_UROXZYD_20250123_160245"));
                AddSectionHeading(LocText("TEXT_WIP_UROXZYD_20250123_160614"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160622"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_04_Mid"), LocText("TEXT_WIP_OQHNQN_20260120_183743"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160626"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160628"));
                AddParagraph(LocText("TEXT_WIP_UROXZYD_20250123_160631"));
            }
        }
        
        
        class UDocument_ItWr_Book_Bestiary_04 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Bestiary_04_Initial);
            default Title = "TEXT_WIP_UROXZYD_20250123_160114";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Bestiary_04 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Bestiary_04;
        }
    }
}
#endif /* WITH_STORY_G1R */