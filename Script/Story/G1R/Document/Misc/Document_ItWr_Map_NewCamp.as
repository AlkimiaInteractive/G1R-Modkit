#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_NewCamp_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_NewCamp;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_NEWCAMP"), LocText("TEXT_WIP_BRKDUKF_20240327_153709"));
            }
        }
        
        
        class UDocument_ItWr_Map_NewCamp : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_NewCamp_Initial);
            default Title = "Document-ItWr_Map_NewCamp-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_NewCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_NewCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */