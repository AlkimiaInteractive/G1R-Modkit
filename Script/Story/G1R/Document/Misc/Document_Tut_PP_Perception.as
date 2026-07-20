#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PP_Perception_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PP_Perception;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173126"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113557"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173139"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113602"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173157"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173204"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173213"));
            }
        }
        
        
        class UDocument_Tut_PP_Perception : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PP_Perception_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_173115";
            default m_SortOrder = 1104;
            default Metadata.Add(n"SortOrder", "1104");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PP_Perception : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PP_Perception;
        }
    }
}
#endif /* WITH_STORY_G1R */