#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CB_Base_Execution_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CB_Base_Execution;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121315"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121325"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121330"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121339"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121347"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/execution_prompt"), LocText("TEXT_WIP_DABMKKF_20260223_153055"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121355"));
            }
        }
        
        
        class UDocument_Tut_CB_Base_Execution : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CB_Base_Execution_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_121304";
            default m_SortOrder = 8;
            default Metadata.Add(n"SortOrder", "8");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CB_Base_Execution : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CB_Base_Execution;
        }
    }
}
#endif /* WITH_STORY_G1R */