#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CR_Ownership_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CR_Ownership;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_124944"));
                AddParagraph(LocText("TEXT_WIP_EJEGGUI_20260326_172119"));
                AddParagraph(LocText("TEXT_WIP_EJEGGUI_20260326_172125"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125032"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125042"));
            }
        }
        
        
        class UDocument_Tut_CR_Ownership : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CR_Ownership_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_124915";
            default m_SortOrder = 1005;
            default Metadata.Add(n"SortOrder", "1005");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CR_Ownership : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CR_Ownership;
        }
    }
}
#endif /* WITH_STORY_G1R */