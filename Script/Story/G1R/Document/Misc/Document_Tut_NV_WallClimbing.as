#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_NV_WallClimbing_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_NV_WallClimbing;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111309"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111317"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/Climbing_wall"), LocText("TEXT_WIP_HBBFEBC_20260206_143018"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111326"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111337"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111353"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111402"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111410"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111426"));
                AddParagraph(LocText("TEXT_WIP_EJEGGUI_20260326_184157"));
            }
        }
        
        
        class UDocument_Tut_NV_WallClimbing : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_NV_WallClimbing_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_101850";
            default m_SortOrder = 102;
            default Metadata.Add(n"SortOrder", "102");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_NV_WallClimbing : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_NV_WallClimbing;
        }
    }
}
#endif /* WITH_STORY_G1R */