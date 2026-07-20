#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_OldCamp_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_OldCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_OLDCAMP"), LocText("TEXT_WIP_BRKDUKF_20240327_153655"));
            }
        }
        
        
        class UDocument_ItWr_Map_OldCamp : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_OldCamp_Initial);
            default Title = "Document-ItWr_Map_OldCamp-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_OldCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_OldCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */