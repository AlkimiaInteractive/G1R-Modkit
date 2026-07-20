#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_Focus_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_Focus;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD_FOKI"), LocText("TEXT_WIP_BRKDUKF_20240327_153221"));
            }
        }
        
        
        class UDocument_ItWr_Map_Focus : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_Focus_Initial);
            default Title = "Document-ItWr_Map_Focus-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_Focus : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_Focus;
        }
    }
}
#endif /* WITH_STORY_G1R */