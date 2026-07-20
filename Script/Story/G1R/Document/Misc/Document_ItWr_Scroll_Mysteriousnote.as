#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Mysteriousnote_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Mysteriousnote;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Nyras_Note"), LocText("TEXT_WIP_KOYHWBI_20260519_183044"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Mysteriousnote : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Mysteriousnote_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Mysteriousnote : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Mysteriousnote;
        }
    }
}
#endif /* WITH_STORY_G1R */