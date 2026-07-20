#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_DreamWorld_Start : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_DreamWorld;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OVFAKRL_20250828_121537"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_DreamWorld : ULetterDocument
        {
            default Title = "TEXT_WIP_OVFAKRL_20250828_121502";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_DreamWorld : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_DreamWorld;
        }
    }
}
#endif /* WITH_STORY_G1R */