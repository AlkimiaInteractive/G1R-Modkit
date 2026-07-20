#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrFocusmapPsi_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrFocusmapPsi;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_WORLD_FOCUSPSI"), LocText("TEXT_WIP_BRKDUKF_20240327_153455"));
            }
        }
        
        
        class UDocument_ItWrFocusmapPsi : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrFocusmapPsi_Initial);
            default Title = "Document-ItWrFocusmapPsi-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrFocusmapPsi : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrFocusmapPsi;
        }
    }
}
#endif /* WITH_STORY_G1R */