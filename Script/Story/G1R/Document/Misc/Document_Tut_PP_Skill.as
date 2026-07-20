#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PP_Skill_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PP_Skill;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173648"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173657"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113722"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173716"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113726"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173738"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173748"));
            }
        }
        
        
        class UDocument_Tut_PP_Skill : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PP_Skill_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_173633";
            default m_SortOrder = 1101;
            default Metadata.Add(n"SortOrder", "1101");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PP_Skill : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PP_Skill;
        }
    }
}
#endif /* WITH_STORY_G1R */