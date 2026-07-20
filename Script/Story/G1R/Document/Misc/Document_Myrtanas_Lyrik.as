#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Myrtanas_Lyrik_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Myrtanas_Lyrik;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_1"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_3"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_4"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_5"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_6"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_7"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_8"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_9"));
                AddParagraph(LocText("Document-Myrtanas_Lyrik-Text_10"));
            }
        }
        
        
        class UDocument_Myrtanas_Lyrik : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Myrtanas_Lyrik_Initial);
            default Title = "Document-Myrtanas_Lyrik-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Myrtanas_Lyrik : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Myrtanas_Lyrik;
        }
    }
}
#endif /* WITH_STORY_G1R */