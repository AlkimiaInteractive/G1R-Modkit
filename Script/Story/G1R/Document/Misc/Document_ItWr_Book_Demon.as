#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Demon_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Demon;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Demonology_v2"), LocText("TEXT_WIP_HGPNVSI_20260312_140535"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_RQSBFK_20251107_141106"));
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_141109"));
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_141850"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_142055"));
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_142401"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Demonology_v1"), LocText("TEXT_WIP_HGPNVSI_20260312_140551"));
            }
        }
        
        
        class UDocument_ItWr_Book_Demon : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Demon_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Demon : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Demon;
        }
    }
}
#endif /* WITH_STORY_G1R */