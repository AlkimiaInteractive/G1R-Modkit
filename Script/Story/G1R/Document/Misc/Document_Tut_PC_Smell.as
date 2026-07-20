#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PC_Smell_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PC_Smell;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123039"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123049"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123056"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123103"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123111"));
            }
        }
        
        
        class UDocument_Tut_PC_Smell : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PC_Smell_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_123024";
            default m_SortOrder = 1203;
            default Metadata.Add(n"SortOrder", "1203");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PC_Smell : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PC_Smell;
        }
    }
}
#endif /* WITH_STORY_G1R */