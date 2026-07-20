#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_DreamUniverse_Start : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_DreamUniverse;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OVFAKRL_20250828_121658"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_DreamUniverse : UDocument
        {
            default Title = "TEXT_WIP_OVFAKRL_20250828_121632";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_DreamUniverse : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_DreamUniverse;
        }
    }
}
#endif /* WITH_STORY_G1R */