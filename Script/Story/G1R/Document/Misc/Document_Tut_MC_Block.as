#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Block_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Block;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122828"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122835"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122841"));
            }
        }
        
        
        class UDocument_Tut_MC_Block : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Block_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_122818";
            default m_SortOrder = 401;
            default Metadata.Add(n"SortOrder", "401");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Block : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Block;
        }
    }
}
#endif /* WITH_STORY_G1R */