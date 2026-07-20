#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_WorldComplete_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_WorldComplete;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD_ORC"), LocText("TEXT_WIP_BRKDUKF_20240327_153748"));
            }
        }
        
        
        class UDocument_ItWr_Map_WorldComplete : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_WorldComplete_Initial);
            default Title = "Document-ItWr_Map_WorldComplete-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_WorldComplete : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_WorldComplete;
        }
    }
}
#endif /* WITH_STORY_G1R */