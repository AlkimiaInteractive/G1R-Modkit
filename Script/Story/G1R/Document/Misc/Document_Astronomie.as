#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Astronomie_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Astronomie;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Astronomie-Text_1"));
                AddParagraph(LocText("Document-Astronomie-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Astronomie-Text_3"));
                AddParagraph(LocText("Document-Astronomie-Text_4"));
            }
        }
        
        
        class UDocument_Astronomie : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Astronomie_Initial);
            default Title = "Document-Astronomie-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Astronomie : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Astronomie;
        }
    }
}
#endif /* WITH_STORY_G1R */