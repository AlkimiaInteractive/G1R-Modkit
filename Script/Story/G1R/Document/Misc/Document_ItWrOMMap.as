#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrOMMap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrOMMap;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_OLDMINE"), LocText("TEXT_WIP_BRKDUKF_20240327_153634"));
            }
        }
        
        
        class UDocument_ItWrOMMap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrOMMap_Initial);
            default Title = "Document-ItWrOMMap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrOMMap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrOMMap;
        }
    }
}
#endif /* WITH_STORY_G1R */