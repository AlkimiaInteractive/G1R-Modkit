#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_KalomsRecipe_Initial : UDocumentSegment
        {
            default InDocument = UDocument_KalomsRecipe;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-KalomsRecipe-Text_1"));
                AddParagraph(LocText("Document-KalomsRecipe-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-KalomsRecipe-Text_3"));
                AddParagraph(LocText("Document-KalomsRecipe-Text_4"));
            }
        }
        
        
        class UDocument_KalomsRecipe : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_KalomsRecipe_Initial);
            default Title = "Document-KalomsRecipe-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_KalomsRecipe : UWritingDefinition
        {
            default m_WritingDocument = UDocument_KalomsRecipe;
        }
    }
}
#endif /* WITH_STORY_G1R */