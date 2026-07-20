#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrFocimap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrFocimap;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD_FOKI"), LocText("TEXT_WIP_BRKDUKF_20240327_153221"));
            }
        }
        
        
        class UDocument_ItWrFocimap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrFocimap_Initial);
            default Title = "Document-ItWrFocimap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrFocimap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrFocimap;
        }
    }
}
#endif /* WITH_STORY_G1R */