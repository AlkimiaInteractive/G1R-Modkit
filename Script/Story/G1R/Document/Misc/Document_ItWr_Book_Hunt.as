#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Hunt_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Hunt;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Hunt-Text_1"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Hunter_Prey"), LocText("TEXT_WIP_HGPNVSI_20260312_141159"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Hunt-Text_2"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Hunter_Prey_V2"), LocText("TEXT_WIP_HGPNVSI_20260312_141209"));
            }
        }
        
        
        class UDocument_ItWr_Book_Hunt : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Hunt_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Hunt : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Hunt;
        }
    }
}
#endif /* WITH_STORY_G1R */