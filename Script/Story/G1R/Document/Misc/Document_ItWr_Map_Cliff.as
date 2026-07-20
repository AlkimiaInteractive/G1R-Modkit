#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_Cliff_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_Cliff;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD_FOCUSPSI"), LocText("TEXT_WIP_BRKDUKF_20240327_153455"));
            }
        }
        
        
        class UDocument_ItWr_Map_Cliff : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_Cliff_Initial);
            default Title = "Document-ItWr_Map_Cliff-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_Cliff : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_Cliff;
        }
    }
}
#endif /* WITH_STORY_G1R */