#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_00_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_00;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_00_0"), LocText("TEXT_WIP_RIAVKRI_20260303_141710"));
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_EMOHWID_20251104_125312"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_125624"));
                AddPageBreak();
                AddSectionHeading(LocText("TEXT_WIP_EMOHWID_20251104_140315"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_125850"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_125855"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_125930"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_141826"));
                AddSectionHeading(LocText("TEXT_WIP_EMOHWID_20251104_130032"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_130047"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_141957"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_00_1"), LocText("TEXT_WIP_RIAVKRI_20260303_141740"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_00 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_00_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_00 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_00;
        }
    }
}
#endif /* WITH_STORY_G1R */