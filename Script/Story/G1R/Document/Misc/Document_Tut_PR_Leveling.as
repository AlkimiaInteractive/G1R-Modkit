#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PR_Leveling_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PR_Leveling;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111930"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/stat_screen_level"), LocText("TEXT_WIP_DABMKKF_20260223_152905"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111937"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111944"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111953"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_112002"));
            }
        }
        
        
        class UDocument_Tut_PR_Leveling : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PR_Leveling_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_111905";
            default m_SortOrder = 201;
            default Metadata.Add(n"SortOrder", "201");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PR_Leveling : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PR_Leveling;
        }
    }
}
#endif /* WITH_STORY_G1R */