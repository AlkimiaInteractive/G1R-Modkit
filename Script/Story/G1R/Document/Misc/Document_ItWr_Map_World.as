#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_World_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_World;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD"), LocText("TEXT_WIP_BRKDUKF_20240327_153730"));
            }
        }
        
        
        class UDocument_ItWr_Map_World : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_World_Initial);
            default Title = "Document-ItWr_Map_World-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_World : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_World;
        }
    }
}
#endif /* WITH_STORY_G1R */