#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Troll_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Troll_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Troll_01-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Troll_01-Text_1"));
                AddParagraph(LocText("Document-ItWr_Troll_01-Text_2"));
                AddParagraph(LocText("Document-ItWr_Troll_01-Text_3"));
            }
        }
        
        
        class UDocument_ItWr_Troll_01 : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Troll_01_Initial);
            default Title = "Document-ItWr_Troll_01-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Troll_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Troll_01;
        }
    }
}
#endif /* WITH_STORY_G1R */