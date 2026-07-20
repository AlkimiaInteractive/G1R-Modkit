#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Milten_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Milten;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_ItWr_Scroll_Milten"), LocText("TEXT_WIP_ZQFEQXH_20260527_103934"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Milten : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Milten_Initial);
            default Title = "Document-ItWr_Scroll_Milten-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Milten : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Milten;
        }
    }
}
#endif /* WITH_STORY_G1R */