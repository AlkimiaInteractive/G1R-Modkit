#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_TheList_Initial : UDocumentSegment
        {
            default InDocument = UDocument_TheList;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-TheList-Text_1"));
                AddParagraph(LocText("Document-TheList-Text_2"));
                AddParagraph(LocText("Document-TheList-Text_3"));
                AddParagraph(LocText("Document-TheList-Text_4"));
                AddParagraph(LocText("Document-TheList-Text_5"));
                AddParagraph(LocText("Document-TheList-Text_6"));
                AddParagraph(LocText("Document-TheList-Text_7"));
                AddParagraph(LocText("Document-TheList-Text_8"));
                AddParagraph(LocText("Document-TheList-Text_9"));
                AddParagraph(LocText("Document-TheList-Text_10"));
            }
        }
        
        
        class UDocument_TheList : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_TheList_Initial);
            default Title = "Document-TheList-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_TheList : UWritingDefinition
        {
            default m_WritingDocument = UDocument_TheList;
        }
    }
}
#endif /* WITH_STORY_G1R */