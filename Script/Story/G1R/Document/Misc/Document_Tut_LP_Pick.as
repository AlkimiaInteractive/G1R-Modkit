#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_LP_Pick_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_LP_Pick;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172127"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172135"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172146"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172159"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172209"));
            }
        }
        
        
        class UDocument_Tut_LP_Pick : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_LP_Pick_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_172026";
            default m_SortOrder = 1106;
            default Metadata.Add(n"SortOrder", "1106");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_LP_Pick : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_LP_Pick;
        }
    }
}
#endif /* WITH_STORY_G1R */