#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PC_Awareness_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PC_Awareness;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122527"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122531"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113450"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122548"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113455"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122611"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122618"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122627"));
            }
        }
        
        
        class UDocument_Tut_PC_Awareness : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PC_Awareness_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_122448";
            default m_SortOrder = 1201;
            default Metadata.Add(n"SortOrder", "1201");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PC_Awareness : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PC_Awareness;
        }
    }
}
#endif /* WITH_STORY_G1R */