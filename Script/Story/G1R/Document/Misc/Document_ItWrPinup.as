#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrPinup_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrPinup;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_PINUP"), LocText("TEXT_WIP_BRKDUKF_20240327_153521"));
            }
        }
        
        
        class UDocument_ItWrPinup : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrPinup_Initial);
            default Title = "Document-ItWrPinup-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrPinup : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrPinup;
        }
    }
}
#endif /* WITH_STORY_G1R */