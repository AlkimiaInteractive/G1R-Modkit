#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrWorldmap_Orc_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrWorldmap_Orc;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD_ORC"), LocText("TEXT_WIP_BRKDUKF_20240327_153748"));
            }
        }
        
        
        class UDocument_ItWrWorldmap_Orc : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrWorldmap_Orc_Initial);
            default Title = "Document-ItWrWorldmap_Orc-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrWorldmap_Orc : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrWorldmap_Orc;
        }
    }
}
#endif /* WITH_STORY_G1R */