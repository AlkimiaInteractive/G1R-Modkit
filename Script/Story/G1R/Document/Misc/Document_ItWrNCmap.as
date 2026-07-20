#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrNCmap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrNCmap;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_NEWCAMP"), LocText("TEXT_WIP_BRKDUKF_20240327_153709"));
            }
        }
        
        
        class UDocument_ItWrNCmap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrNCmap_Initial);
            default Title = "Document-ItWrNCmap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrNCmap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrNCmap;
        }
    }
}
#endif /* WITH_STORY_G1R */