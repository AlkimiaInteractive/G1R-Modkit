#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrOCmap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrOCmap;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/MAP_OLDCAMP"), LocText("TEXT_WIP_BRKDUKF_20240327_153655"));
            }
        }
        
        
        class UDocument_ItWrOCmap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrOCmap_Initial);
            default Title = "Document-ItWrOCmap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrOCmap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrOCmap;
        }
    }
}
#endif /* WITH_STORY_G1R */