#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_LP_Skill_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_LP_Skill;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172305"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112543"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172319"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112550"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172334"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112555"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_172353"));
            }
        }
        
        
        class UDocument_Tut_LP_Skill : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_LP_Skill_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_172256";
            default m_SortOrder = 1105;
            default Metadata.Add(n"SortOrder", "1105");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_LP_Skill : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_LP_Skill;
        }
    }
}
#endif /* WITH_STORY_G1R */