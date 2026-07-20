#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_AbandonMineSketch_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_AbandonMineSketch;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/ItWr_Scroll_AbandonMineSketch"), LocText("TEXT_WIP_EJEGGUI_20260326_110523"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_AbandonMineSketch : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_AbandonMineSketch_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_AbandonMineSketch : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_AbandonMineSketch;
        }
    }
}
#endif /* WITH_STORY_G1R */