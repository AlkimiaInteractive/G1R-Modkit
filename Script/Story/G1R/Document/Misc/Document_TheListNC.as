#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_TheListNC_Initial : UDocumentSegment
        {
            default InDocument = UDocument_TheListNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-TheListNC-Text_1"));
                AddParagraph(LocText("Document-TheListNC-Text_2"));
                AddParagraph(LocText("Document-TheListNC-Text_3"));
                AddParagraph(LocText("Document-TheListNC-Text_4"));
                AddParagraph(LocText("Document-TheListNC-Text_5"));
                AddParagraph(LocText("Document-TheListNC-Text_6"));
                AddParagraph(LocText("Document-TheListNC-Text_7"));
                AddParagraph(LocText("Document-TheListNC-Text_8"));
                AddParagraph(LocText("Document-TheListNC-Text_9"));
                AddParagraph(LocText("Document-TheListNC-Text_10"));
                AddParagraph(LocText("Document-TheListNC-Text_11"));
                AddParagraph(LocText("Document-TheListNC-Text_12"));
                AddParagraph(LocText("Document-TheListNC-Text_13"));
                AddParagraph(LocText("Document-TheListNC-Text_14"));
                AddParagraph(LocText("Document-TheListNC-Text_15"));
            }
        }
        
        
        class UDocument_TheListNC : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_TheListNC_Initial);
            default Title = "Document-TheListNC-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_TheListNC : UWritingDefinition
        {
            default m_WritingDocument = UDocument_TheListNC;
        }
    }
}
#endif /* WITH_STORY_G1R */