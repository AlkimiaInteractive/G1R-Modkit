#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Sketch_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Sketch;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/ItWr_PinUp"), LocText("TEXT_WIP_BRKDUKF_20240327_153521"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Sketch : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Sketch_Initial);
            default Title = "Document-ItWr_Scroll_Sketch-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Sketch : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Sketch;
        }
    }
}
#endif /* WITH_STORY_G1R */