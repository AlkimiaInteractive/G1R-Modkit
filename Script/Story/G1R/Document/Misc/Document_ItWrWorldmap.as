#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrWorldmap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrWorldmap;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD"), LocText("TEXT_WIP_BRKDUKF_20240327_153730"));
            }
        }
        
        
        class UDocument_ItWrWorldmap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrWorldmap_Initial);
            default Title = "Document-ItWrWorldmap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrWorldmap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrWorldmap;
        }
    }
}
#endif /* WITH_STORY_G1R */