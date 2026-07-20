#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_LoveStoryWomen_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_LoveStoryWomen;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Love_Story_Woman_1"), LocText("TEXT_WIP_KOYHWBI_20260519_182648"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_LoveStoryWomen : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_LoveStoryWomen_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_LoveStoryWomen : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_LoveStoryWomen;
        }
    }
}
#endif /* WITH_STORY_G1R */