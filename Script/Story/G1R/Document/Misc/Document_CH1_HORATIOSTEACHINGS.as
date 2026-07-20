#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_HORATIOSTEACHINGS_Entry0 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_HORATIOSTEACHINGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_HORATIOSTEACHINGS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_HORATIOSTEACHINGS_Entry1 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_HORATIOSTEACHINGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_HORATIOSTEACHINGS_ENTRY_1"));
            }
        }
        
        
        class UDocument_CH1_HORATIOSTEACHINGS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_HORATIOSTEACHINGS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_HORATIOSTEACHINGS;
        }
    }
}
#endif /* WITH_STORY_G1R */