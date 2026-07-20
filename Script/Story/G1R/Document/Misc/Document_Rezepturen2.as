#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Rezepturen2_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Rezepturen2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddSectionHeading(LocText("Document-Rezepturen2-Heading_1"));
                AddParagraph(LocText("Document-Rezepturen2-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Rezepturen2-Text_2"));
            }
        }
        
        
        class UDocument_Rezepturen2 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Rezepturen2_Initial);
            default Title = "Document-Rezepturen2-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Rezepturen2 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Rezepturen2;
        }
    }
}
#endif /* WITH_STORY_G1R */