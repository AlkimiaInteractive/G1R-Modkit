#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_OldMine_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_OldMine;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_OLDMINE"), LocText("TEXT_WIP_BRKDUKF_20240327_153634"));
            }
        }
        
        
        class UDocument_ItWr_Map_OldMine : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_OldMine_Initial);
            default Title = "Document-ItWr_Map_OldMine-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_OldMine : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_OldMine;
        }
    }
}
#endif /* WITH_STORY_G1R */