#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PR_Base_Learning_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PR_Base_Learning;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_114736"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/taching_dialoge_tooltip"), LocText("TEXT_WIP_DABMKKF_20260223_153016"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_114823"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_114836"));
            }
        }
        
        
        class UDocument_Tut_PR_Base_Learning : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PR_Base_Learning_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_114720";
            default m_SortOrder = 5;
            default Metadata.Add(n"SortOrder", "5");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PR_Base_Learning : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PR_Base_Learning;
        }
    }
}
#endif /* WITH_STORY_G1R */