#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Book_Innos_Title : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Book_Innos;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddPageBreak();
                AddChapterHeading(LocText("TEXT_WIP_XGDWEXI_20250919_203522"));
            }
        }
        
        
        class UDocumentSegment_ItMs_Book_Innos_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Book_Innos;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XGDWEXI_20250919_203252"));
                AddParagraph(LocText("TEXT_WIP_XGDWEXI_20250919_203308"));
                AddParagraph(LocText("TEXT_WIP_XGDWEXI_20250919_203311"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_XGDWEXI_20250919_203316"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Magic_Runes_Rituals"), LocText("TEXT_WIP_HGPNVSI_20260312_141455"));
            }
        }
        
        
        class UDocument_ItMs_Book_Innos : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Book_Innos_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Book_Innos : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Book_Innos;
        }
    }
}
#endif /* WITH_STORY_G1R */