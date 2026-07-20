#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_StoneSketch_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_StoneSketch;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/ItWr_StoneSketch"), LocText("TEXT_WIP_QQHNQN_20260122_122549"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_134243"));
            }
        }
        
        
        class UDocument_ItMs_StoneSketch : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_StoneSketch_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_StoneSketch : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_StoneSketch;
        }
    }
}
#endif /* WITH_STORY_G1R */