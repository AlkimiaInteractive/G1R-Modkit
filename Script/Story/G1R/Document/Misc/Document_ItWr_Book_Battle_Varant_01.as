#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Battle_Varant_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Battle_Varant_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Battle_Varant_01-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Battle_Varant_01-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Battle_Varant_01-Text_3"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Battle_Varant_1"), LocText("TEXT_WIP_HGPNVSI_20260312_134614"));
            }
        }
        
        
        class UDocument_ItWr_Book_Battle_Varant_01 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Battle_Varant_01_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Battle_Varant_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Battle_Varant_01;
        }
    }
}
#endif /* WITH_STORY_G1R */