#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Geheimnisse_der_Zauberei_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Geheimnisse_der_Zauberei;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Geheimnisse_der_Zauberei-Text_1"));
                AddParagraph(LocText("Document-Geheimnisse_der_Zauberei-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Geheimnisse_der_Zauberei-Text_3"));
                AddParagraph(LocText("Document-Geheimnisse_der_Zauberei-Text_4"));
            }
        }
        
        
        class UDocument_Geheimnisse_der_Zauberei : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Geheimnisse_der_Zauberei_Initial);
            default Title = "Document-Geheimnisse_der_Zauberei-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Geheimnisse_der_Zauberei : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Geheimnisse_der_Zauberei;
        }
    }
}
#endif /* WITH_STORY_G1R */