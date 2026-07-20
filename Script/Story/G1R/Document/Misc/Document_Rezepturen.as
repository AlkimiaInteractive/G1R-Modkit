#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Rezepturen_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Rezepturen;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddSectionHeading(LocText("Document-Rezepturen-Heading_1"));
                AddParagraph(LocText("Document-Rezepturen-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Rezepturen-Text_2"));
            }
        }
        
        
        class UDocument_Rezepturen : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Rezepturen_Initial);
            default Title = "Document-Rezepturen-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Rezepturen : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Rezepturen;
        }
    }
}
#endif /* WITH_STORY_G1R */