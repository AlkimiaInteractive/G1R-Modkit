#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_LoveStoryFogTower_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_LoveStoryFogTower;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Love_Story_Fog_Tower"), LocText("TEXT_WIP_KOYHWBI_20260519_182745"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_LoveStoryFogTower : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_LoveStoryFogTower_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_LoveStoryFogTower : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_LoveStoryFogTower;
        }
    }
}
#endif /* WITH_STORY_G1R */