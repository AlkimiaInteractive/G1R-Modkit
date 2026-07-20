#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Cronos_Brief_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Cronos_Brief;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Cronos_Brief-Text_1"));
                AddParagraph(LocText("Document-Cronos_Brief-Text_2"));
                AddParagraph(LocText("Document-Cronos_Brief-Text_3"));
                AddParagraph(LocText("Document-Cronos_Brief-Text_4"));
            }
        }
        
        
        class UDocument_Cronos_Brief : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_Cronos_Brief_Initial);
            default Title = "Document-Cronos_Brief-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Cronos_Brief : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Cronos_Brief;
        }
    }
}
#endif /* WITH_STORY_G1R */