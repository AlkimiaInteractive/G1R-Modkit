#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Bestiary_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Bestiary_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_01_Full"), LocText("TEXT_WIP_OQHNQN_20260120_185250"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_YZLYTQL_20250122_120228"));
                AddSectionHeading(LocText("TEXT_WIP_YZLYTQL_20250122_120247"));
                AddParagraph(LocText("TEXT_WIP_YZLYTQL_20250122_120349"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_YZLYTQL_20250122_120403"));
                AddBulletListEntry(LocText("TEXT_WIP_YZLYTQL_20250122_121418"));
                AddBulletListEntry(LocText("TEXT_WIP_YZLYTQL_20250122_121446"));
                AddBulletListEntry(LocText("TEXT_WIP_YZLYTQL_20250122_121458"));
                AddParagraph(LocText("TEXT_WIP_YZLYTQL_20250122_120523"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bestiary_01_Mid"), LocText("TEXT_WIP_DPARWR_20260116_164910"));
                AddParagraph(LocText("TEXT_WIP_YZLYTQL_20250122_120510"));
            }
        }
        
        
        class UDocument_ItWr_Book_Bestiary_01 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Bestiary_01_Initial);
            default Title = "TEXT_WIP_YZLYTQL_20250122_120014";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Bestiary_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Bestiary_01;
        }
    }
}
#endif /* WITH_STORY_G1R */