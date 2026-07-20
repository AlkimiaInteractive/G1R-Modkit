#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PR_Base_Attributes_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PR_Base_Attributes;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111719"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/stat_screen_attributes"), LocText("TEXT_WIP_DABMKKF_20260223_144709"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111727"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111738"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111747"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111800"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111808"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111817"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111825"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111834"));
            }
        }
        
        
        class UDocument_Tut_PR_Base_Attributes : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PR_Base_Attributes_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_111657";
            default m_SortOrder = 3;
            default Metadata.Add(n"SortOrder", "3");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PR_Base_Attributes : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PR_Base_Attributes;
        }
    }
}
#endif /* WITH_STORY_G1R */